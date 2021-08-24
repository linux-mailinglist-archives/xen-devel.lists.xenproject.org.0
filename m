Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22CD3F5E24
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 14:42:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171311.312607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVks-0000eN-7Q; Tue, 24 Aug 2021 12:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171311.312607; Tue, 24 Aug 2021 12:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIVks-0000bv-4H; Tue, 24 Aug 2021 12:42:14 +0000
Received: by outflank-mailman (input) for mailman id 171311;
 Tue, 24 Aug 2021 12:42:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QsuA=NP=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mIVkr-0000bp-7x
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 12:42:13 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b39d59f8-04d8-11ec-a8cf-12813bfff9fa;
 Tue, 24 Aug 2021 12:42:11 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: b39d59f8-04d8-11ec-a8cf-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629808931;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tE78tg92dfnp6QQGPRGJ8r8VD9pevASCWFLZPe1xwq0=;
  b=NZqqz++Oek1d/04InG9I1+JuIq5TjgCC6O3gwol/50Zh9dMCU/AVvq/y
   Q9Ulq/mgSLpw1S/j0QM8V3tFYOo3fJzX9tZY4naa6A0owh5FjF3nqRRdy
   iQ4HBOkHQlNhxrs1nZqiNx5jof4CemKMXCUFBFmFRoicgkxXhfXIL7mVj
   o=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: kP8G5EXDlkW903ZAzoT9UtcAXQqAaq+fYyQDpXNaaCNxVGrUbqey5EROi53r01P+iZ6PClXhQ8
 nBBStGXaNUvD5sU+E+okt6OG1i9Wb6f/eQ3qo/fxlkekLRrkQ0xn3m0e07U0iqI66Cs5dBKRrW
 6q1thU87TRF6YyZWvWGZdi0+WF5WlaQwc/geFNfpW8b5IiJv+t2dmtQGuDL3Hp59WI9GqY4Rvn
 FKXLUMSaYDwXyU+5zTITmpKDDXSgcYDpWXXtM1py/FR2xrUU+zXRYcD+3fD2m6eYbZQSzJU6cm
 6B4J8OwJFjsHqkww+Tyr3H61
X-SBRS: 5.1
X-MesageID: 52883317
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:2o77X6zPCyNQuUX0J6r7KrPxq+skLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjlfZquz+8K3WB3B8bcYOCGghrVEGgG1+rfKlLbalbDH4JmpM
 Fdmu1FeaDN5DtB/LXHCWuDYq4dKbC8mcjC74qurAYOPHRXguNbnmBE426gYz1LrWJ9dOME/f
 Snl696TnabCA4qhpPRPAh1YwGPnayLqHqgCiR2TiIP2U2rt3eF+bT6Gx+X0lM3VC5O+64r9S
 zgnxbi7quunvmnwluEvlWjrKh+qZ/E8J9uFcaMgs8aJnHFjRupXp1oX/mnsCouqO+ixV42mJ
 3nogsmPe5093TNF1vF4SfF6k3F6nID+nXiwViXjT/KptH4fiszD457iYdQYnLimgYdleA59J
 gO83OStpJRAx+Ftj/6/cL0WxZjkVfxiWY+kMYI5kYvFbc2Wft0l8gy7UlVGJAPEGbR84Y8Ct
 RjC8na+bJ/bU6aVXbEpWNiqebcG0jbJi32BHTqh/bligS/xBtCvhMlLY0k7zU9HasGOt55D7
 +uCNUyqFkmJfVmH56UB486MIaK4yL2MEjx2M/7GyWuKEg9AQO7l3fA2sR+2AibQu198HIMou
 W2bLp5jx98R6u8M7zB4HV0miq9C1lVGw6dl/1j2w==
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="52883317"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOLYGdSs1OLLHEVDXjhlEd3U+SiBy3i9NMB136aW52kw0orKKuSdX8NVX4UlDRDLQiSUEIKxTyiFPOUacT/RRU1VnAGYmXju8dQNgAdj6IBsXcmQLf6me7j6LNSCHzNQGQOB4uEhl2XxRI4I7+YUQYNlN6wftnL5qR5VO+8l9OIKwjZdDrcoUhfdO1sk2RbvrLs32NJtWgTRFohiBH7nsfJbBmlo3+nRh4GvC83MDa89M0mpHaMcj36TkmOL9CM1W8ljkuGOrcSWLJUCbxllAaUbGabJ9EcdqJtvd60ZjUCmk0i7xJ9CmYjw5bAUIV+EBuxYrloi8dPj18n10NNYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tE78tg92dfnp6QQGPRGJ8r8VD9pevASCWFLZPe1xwq0=;
 b=hAVnaa6eqqaePaFvA72DJxB+nj31ubbmNKKicEv88kuZVCZzNidoxqwfF1ro6GIVWcJ2CqZFmx8q+/yV6yYeJJfaxd9ioAnFntJ8odH6/Sy3Fn7pY0wMUnTadXZY8qhTBYJVXs6EtoOt6asfLvSCoUMJ+PdYDETGsv4qTAIyWMh2+rChQtSK+ZDdLnmk7bPP5K5COW1Pl8y/hZ1PUVOMix+wkS9BqkbUsbEoSQtrL8yWoQdHGKAe7dpxvQ9CFYA00p1UgSVkITBmGo0Gd0VJBJkhFQtH1L84nbZdUn3ZV2/3ROej68vjMPR3DZRBRZ+FZwdjGkfrib+BTfws24HxUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tE78tg92dfnp6QQGPRGJ8r8VD9pevASCWFLZPe1xwq0=;
 b=BZHF9ZhSEDaXjHBrli0ifrvdMiwFwTY3j/9Sl2FKj5rdN4tPtTL6fRmqxdl8/Zaog3+Lt8PmgbZqdiRG8AS44fiNswiyGcDWGHjML5aWgPAbzBreNXt+aAQEV32fVPbD3KatEuaR28uJHAuNsLrDw3HOUvpLPv7lzufIjbJobcI=
To: Jan Beulich <jbeulich@suse.com>, Bobby Eshleman <bobby.eshleman@gmail.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Elena Ufimtseva <elena.ufimtseva@oracle.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	<xen-devel@lists.xenproject.org>
References: <cover.1629315873.git.bobby.eshleman@gmail.com>
 <7925a89cf830e0e3705a8700fce09a408fcfc27c.1629315873.git.bobby.eshleman@gmail.com>
 <cf162154-a988-ffe9-f6a0-40351f654d1b@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v3 2/6] x86/debugger: separate Xen and guest debugging
 debugger_trap_* functions
Message-ID: <56659479-80b1-4242-5689-f1a0b62df549@citrix.com>
Date: Tue, 24 Aug 2021 13:41:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <cf162154-a988-ffe9-f6a0-40351f654d1b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0392.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29904cde-6620-46ad-d1d6-08d966fc9132
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5693:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB56934E3ED4D6C2416876B62DBAC59@SJ0PR03MB5693.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xWVuQocMIVhPbnmqKZVXwJncWHQ6arvYyPWDcOSa6qau5E/4XRRO7qNR3rzgSig8eXMtxpNSVjvEcsxzpiqV8NLEDO5M9P7/X/nWDbfXyQpv9Dhjb02SzhlkHRivsf9QCeBVvJQ+YGkNfXfTOqz3s7hizC1ZLhX4CDl16Z6S9KxERSR4Vr68eoyJCHbvVDLK9SdpkOL9HTxq1wRRo/nDYxODQ23OmgUpoBC1iCwwbZEus9eGADfTtK9OriBtpIOTvSR/ChghyNcnE+MidBqWzBOBoSx+EoduS34n7k+cLDxIdHWASVLjfGcmeM4IG2jzw+Xp74nWVWBK1j+J+4L0b+eAFE5mYlGZExQQmbAO8E5hVrsejjJ22tUznVnyluc/yXr67LXqV+aL13m9q6Febo9NwBQqOLZcBOR7NsiJobKjKhxORBd8IOLTkJDN8aiSVC8e2tDor90xI69m/sshEMU09tpvA13AzG9TLzxDAGa92nkZP/NcOb72LyPjRa97TpU1FOhjx/rSnwS/Qm8tXll621Z55pwfrrcu8/aeaJE9EdiEumT3WGYMKyzFNO1q+rewtD7kOBziVcumXJ5UPpUwbYu/KYg7WVTgufA7ekbTOLSfwrY+p5dpTAY8pjIM+PMruvyOo0pbBOovlFrxp6n5R6Rudo81w2HdoaG4BGGUmdOvb8auyP4Gsm68txfPFkkXCf28Qbp/5MChKxeryd+qr9sM+BxwnHVsB/emntI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(54906003)(36756003)(478600001)(16576012)(26005)(316002)(8676002)(4326008)(956004)(55236004)(8936002)(7416002)(38100700002)(2616005)(5660300002)(110136005)(31686004)(53546011)(6486002)(66946007)(31696002)(86362001)(6666004)(66556008)(2906002)(66476007)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWlwQ1pzTS9KdHF6QlE1OWV0dUVLVHZibUw4ZGZ3dDJ6OVpkNzh4R3lMd2hK?=
 =?utf-8?B?QjZhZWJjWmFCMzltdUY3M0phNFovN01HTU4yQ3J2b254K25yaDc0ZmJDUXhj?=
 =?utf-8?B?RHBTdlM2YkJkZ2xlNnNNblpJcHRxZzcrbUR0M2F5Sm5OT0NkdzlqcVpJc0NL?=
 =?utf-8?B?UnlHL3RPV1Bzbjh5YkdHRkxjNEliR2VXdEIvMjc3S2VRYUlESk9ITWx5UkE0?=
 =?utf-8?B?QnV4VGltRWs2S2VvdmJaWXdqZ0FmVFc2WENWMWJrQmp1aEk4NmJycEtKQlAw?=
 =?utf-8?B?ejVmcVlwZ0doVTg5dW1nV1FTVHVlRVlEa2VNNUdXR3lWa3hTaWVvY3NocndO?=
 =?utf-8?B?Slo5QUNXT0JhaEVYaENSV2Vzbmc4aFlCUHg2UUpuSGFLMWp5cW9LNXRJOVJo?=
 =?utf-8?B?ZWpZYS9NZzhoVWZrSWZXTDhQOU0rcDFmblg2YUNQdVpWdWZjRU91QVBNWUlO?=
 =?utf-8?B?WkNPM0FpNWI4TWNSRTlrRDV2NUxsc21McTlpY3Bhb2lRd0NLaW05NDlwbWxL?=
 =?utf-8?B?c2kvSDRLR3luVzRTQm5CWHJZeENKOTV3YzFEWjNIelA5L2RRZGQ3NENSaUZj?=
 =?utf-8?B?cHBLQk5icFJuTjdYTVdSZU1ta3NRaGJLdGFoQWhiQUl6RklqT3pCbG0ybzIw?=
 =?utf-8?B?bFErQ0VSZ2NJYkVPbjJvdjZZRmJ4V0h5R2h5NEZ4UFZxYmJLclQ4WWdWU0dh?=
 =?utf-8?B?QVRmNG5OL2tOckxTRno2Z3g3NlpNd05zcWV0aVZTR2lFSHNGMzlkZjkyamN4?=
 =?utf-8?B?LzhwdGYwblErelhMRE10aXhsYjhJZzRzMWpiaFFjOERTYzZaTzJHekZpeVBD?=
 =?utf-8?B?TktQcDltM0FGMDlLYy93dDdPTU1SYkt5YXUya1Q5azlJemxlcm9hcUV2eHA0?=
 =?utf-8?B?Y2F6eitickZpZ3hWdWJSYVVZTWM4YVhvSWM3bkhPeGM1aUxjTFd3ZE1rM05L?=
 =?utf-8?B?YWxqZjE2dXVsZ1oyRG84aVlFZlJ3QXczMVdXVkhOMWhWaitZQS94cDVMMzFK?=
 =?utf-8?B?ejZtUm05WkhKTmUvUThsK2hPNmhlVnpRME84RDRtQ0lsdFJtQ2ZrdUJSbExV?=
 =?utf-8?B?TjJEcTR4RGJEOHljZkF0NkFpQ0tBNHJrNitxa3dqdXNNbDdaWVpqY3Y1UktT?=
 =?utf-8?B?SExHQjlEVTlpYmtsNkJNY2tVZExWRi9WV3dKZllweEtXcllESGU1WU1WbGRY?=
 =?utf-8?B?enlVMGE5djU1cll3dlA0Wi8xd2Z4QUJNUUNCbzMwWjU4UW1EcTRLSkFYaGNT?=
 =?utf-8?B?bkZ1blAwV3ZXTE9UZDFmeTZnSktGVjFFN0ttZVVybGhSZzJlNHVvRko0d2hD?=
 =?utf-8?B?VTFzeHc2SWRrOWxHSVdkWkpvb0R6bFlNS0dJMTZDc2RoT2htMEMyN3RnM1I2?=
 =?utf-8?B?dFg4U2k4YXNnaDdsenVhZHk3Sjh5YnNSNlgzT0tabExEYVd6aVUydTc2cVNY?=
 =?utf-8?B?MG1Ud1JTYmpzdFZ6cGZYUnJHSkM1V3NMMEVURklaVUtiVjJDNjlTcmZ5aTVs?=
 =?utf-8?B?ekZHaWt6QVZFNnRFRk5QY2djcHRjOWJKQ0J1WTJxZ2VTT2xmUCtGUUQzZHQv?=
 =?utf-8?B?TXZKQlcwWW5tS0RTLzAraXFoSW9adG5iS0IwODdzQUxYR29lc0ZhTjVOazV6?=
 =?utf-8?B?VEZoMmJ0ZDN2OWViTWIxdU5MR013YU5kRWJMdS9obUdIR293c3lNdTQ4VlZ6?=
 =?utf-8?B?U2Y0TGsxWHlleFBsMFhBa3RodTExNkw1VmpPTHRWVzZYaW9IeGVKU0p4QnVW?=
 =?utf-8?Q?P+1tvieIld8JlTHnxYdjcWdB9eVOcCyxfTNlD33?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29904cde-6620-46ad-d1d6-08d966fc9132
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 12:42:00.4843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: raUINse1OAQn+KgsKh1yXjAo9LnKVvnzFts3oSQ/ntNbLpCc9xEzlJABodNcSTpcOOrkpjFK051mKUSUdSxdLifjJSE8riPkL4yssr7kwZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5693
X-OriginatorOrg: citrix.com

On 24/08/2021 13:16, Jan Beulich wrote:
> On 18.08.2021 22:29, Bobby Eshleman wrote:
>> Unlike debugger_trap_fatal() and debugger_trap_immediate(),
>> debugger_trap_entry() is specific to guest debugging and *NOT* the
>> debugging of Xen itself. That is, it is part of gdbsx functionality and
>> not the Xen gdstub. This is evidenced by debugger_trap_fatal()'s usage
>> of domain_pause_for_debugger(). Because of this, debugger_trap_entry()
>> does not belong alongside the generic Xen debugger functionality.
> I'm not convinced this is what the original intentions were. Instead I
> think this was meant to be a generic hook function which initially
> only cared to deal with the gdbsx needs.

It doesn't exactly matter what the original intentions where - what we
currently have is unused and and a clear source of confusion between two
unrelated subsystems.

It is unclear that the gdbstub is even usable, given at least a decade
of bitrot.

Keeping an empty static inline in the enabled case is nonsense, because
at the point you need to edit Xen to insert some real debugging, there
are better ways to do it in something which isn't even a catch-all
despite appearing to be one.

~Andrew


