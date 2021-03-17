Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FE533F164
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 14:46:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98706.187382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMWUt-0007sF-Hi; Wed, 17 Mar 2021 13:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98706.187382; Wed, 17 Mar 2021 13:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMWUt-0007rq-Ef; Wed, 17 Mar 2021 13:46:03 +0000
Received: by outflank-mailman (input) for mailman id 98706;
 Wed, 17 Mar 2021 13:46:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=htWl=IP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lMWUr-0007rS-EP
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 13:46:01 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e61311af-6f35-42dc-bdbf-b3ef6e23a502;
 Wed, 17 Mar 2021 13:46:00 +0000 (UTC)
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
X-Inumbo-ID: e61311af-6f35-42dc-bdbf-b3ef6e23a502
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615988760;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0YzWHjNAnPhWN9Kh6JB5HhheT9rg02M3FcBUziUqsNk=;
  b=CBSnCRPbHYzoJizg1AuRBjCUq65462ryyEJpoAdg96cGvg5VQD3Vrtuv
   bBQ67QMBcwldbePCNa0bYAoQYtk1qdb1BhRKWP6AMKWXbJP6dphvt6iwH
   7eSv5DVJYHr+lyGH5uJx6y7BmevdtN9Tfv/8g4+wGK5RtgK8KxQT7LuA2
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZVlHBufiYEkPiZFnMEELk08j0xve2b3z+pdjV+YQp7BPTcOEcRRIMZCx2UPVTs9GA5Jctl/Pg5
 WgPc75VQi5CLuClDJAwyUjVCMMijqPKh41ji+Ke7lGknSdVaQV11g3eaLhEhu0t+kKBZOr4GJH
 h9qA+P96WdYSsCZnrN5K64VLygP5QjgbGWAg56uCYFiAQePwTO6QH0Jt40SDIpQEMI2Ui4K6UK
 YW95NcAHHJEOn/x1+aWve2r4v0/Jju4ECxpm9ZkKjsD6p5Ce9SSlEKyDOTynGZapf0nn+ayqyj
 hTI=
X-SBRS: 5.2
X-MesageID: 39388489
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23: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
X-IronPort-AV: E=Sophos;i="5.81,256,1610427600"; 
   d="scan'208";a="39388489"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NNhWkU/888rPyhgcktrIERNeJptgOHOLszNW/nYSbPFv22sKMEW/wpBtuDiiF6fXr7IuIqcOlBqorIPPr7FDKVMP2+wiUgaQun8XuvA8Yn5P5/og0IHkrFyo8bFrPAiDpXrPk++Z8dNrfo/vUixA4a+xNW5O47DpXFKoPs4p1ThAihnE6lmJfz5favTc7rQZaFUWRxxkGvDOIdGXAc+4fOkoBIY+N1uxNwIGmSzwUNrZslocUY/D7eqCAHw5yzbhPCx9+z1EF4ZuSF7gt3HOIBVPskxizU1f1Dy1XyiK8nqkOCp8j+94BYqR7Fm92OdyAMCzsBcYpr/CH6/rTF3ISQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy3NqsFP3OnRutrrUYLpp1kAnLMNdN/HNf9rhiY+1I0=;
 b=YcvTJdjwzVdayG+37+mRu7leWothMDT9rpgWUPa8Z7MlXEpMuCUE5ubcNRHnVFCVRj+t+pCrJFSamI37Htak76QclUy58+SBDz0MA901DrEoBbn8zoBBYI+KYuaUEGclogJ9xQZ7SvJY71VkKguLrRTXYK25ndPACmf+3r7cWbIMfo4e/GykzgrOIxCAOi9n9NPG6fJalNoNuVRWXDTIot1b2+PhNyIJUnOn1uxG3cmhNbJRm9xPN0pBBEuxQyawWMmmPdNSFNXHKIwZ5k/UNYuPakn60wTzkIjim7OMYxvKGBjakoRlDAsCqm4mSqlT5bO1UbT6JE0aTQVfWfe4TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy3NqsFP3OnRutrrUYLpp1kAnLMNdN/HNf9rhiY+1I0=;
 b=w/nLhwYKClRnD8PaUUhxHPWB1EwZME0XF9/g7JzjriopopXalgTMAfh0CGB8ATdFvJfRE7pWXoRx4bmhb0YYZEeO8qh9GO0eMAardPrHoowVBOp3q4RR2gK+U/Ybvbk/8dFL5QEa2P+69uLS090iQp7q+6JO4X4ALxVsQ8wGCMk=
Subject: Re: [PATCH 1/3] Revert "x86/msr: drop compatibility #GP handling in
 guest_{rd,wr}msr()"
To: Ian Jackson <iwj@xenproject.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, Wei Liu <wl@xen.org>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>
References: <20210316161844.1658-1-andrew.cooper3@citrix.com>
 <20210316161844.1658-2-andrew.cooper3@citrix.com>
 <24658.1583.601613.903527@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <4b1c13ee-f121-3379-6fb3-c0d4dbb76e48@citrix.com>
Date: Wed, 17 Mar 2021 13:45:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <24658.1583.601613.903527@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0201.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::8) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a9a9172-b12f-4962-59bb-08d8e94afdd8
X-MS-TrafficTypeDiagnostic: BN7PR03MB3827:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB382755B6DE71EE397FCF62E1BA6A9@BN7PR03MB3827.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6/jCeK9Orn8TC//fj1Jz+OdEWObmLP3JEYhG8E/P8lxJgVEBM3v9lO5C8okark7XeZuVn6OhcvMILIYW7zakKFKguUUtlIvT71/QuSxcCPHtdsVNNKlhMmENbbtgQMeuHea48W24xy3rXDa2GkLXgdJeHij71M50J2TGeWwyjvlomO1aBBPXowR0SaQzruEg7jVNU0+R3ACxQC6lC5q3RaqsKKAkv4lbg8Amnauue9XqzqC9j2cdYddZYviTVuYBTRnSM/pRILhJcpqGKSfReyv5Zv+Bx8MSwU34mi0vlSrtqCo+sqWj+I0z/ovLBeg7tlH1nUlHvbH52hUm4B6j4kqW5FTYWTtq/sESxsyKRxtTVZOe4OFslQ8cTYxJiS/VFczWtog8LbHk+G1o0pllVk2mL57NChudQnxEWr4vpSyld6xFtkooQQYf3vnQJKc2XYCjnKPFsNNFOfQ72Sepvvw6ZWmfTiBKZ+pY/qLlHSMeSbs2fqAc1ifgkYq0zyZ70dOvwRjzWAVsoPcufqCXzDUS0hCAQ0Wx1bwXAxJczMI6Cj3mY+zpxMOeGyM2CGCwy/VKMRlozmBkBpwhMPc5VSuJ9FNJn4TbvuwLNgoi3CXoFJLGIAxbEcuXFc4KTsd3ynzDQEdN4DcZmND8f/tD7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(478600001)(31686004)(2906002)(66556008)(54906003)(186003)(36756003)(5660300002)(6636002)(31696002)(66946007)(66476007)(86362001)(83380400001)(316002)(6666004)(4326008)(53546011)(8936002)(26005)(6486002)(16526019)(8676002)(956004)(2616005)(110136005)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aHVFQzNqcURjcnFZaHZHaUlob3BUS0hVRk9mcHB0SVRtYjc1cUtYQ1lUMU5o?=
 =?utf-8?B?cmF0NEdQSjJQUHFlS2s0TTZvYVA0K0lMMlJwVUlsc1hQanEzbUliOUJBN29W?=
 =?utf-8?B?SUlrUXAzYWxjaDZBTGpNV25XeFIyM0NGZXhQOHVVOUtpNU5STWdTY2QvTVZC?=
 =?utf-8?B?VCswOXVlci9mNjQweXNuVFdWZ2I0TlhQczRoVUh5YXp2VHhGY1QzSHBnNERt?=
 =?utf-8?B?VTlERk1FT0x2NG45S0F6VldJOUorb3JldE9YTGY0Z0pCeW1aSmdOcUc1V1g3?=
 =?utf-8?B?L1RMTThKZmo0YUFCcjJpaUNCZDZlaUJPRzRXMXVXNFRMbFlnODRCWU1Kby9l?=
 =?utf-8?B?VkVaYmppRnZXSDZMaytFSnNiVGpzdTIwMkdJZWpPcVlLaVJadnAwTDlWT3A3?=
 =?utf-8?B?NzZGZEhuUFVGYnM1QjVwbUp3KzRkTUNGQkh1dFV1cERRK2oyWndwZVk5QUYw?=
 =?utf-8?B?dk5uSmNoMmh6NHVaeTN6SEc1eXY3c1phTEl1ZmZPMmlEcmtzVjFZOFNMQ2Iv?=
 =?utf-8?B?S2JadUkyenRiVXl3amIxVGxJaDBYNlN3SS91MkVQTFhEVjljM2dGLzczMVNt?=
 =?utf-8?B?R1RGaHFHbVg1UDNLak96SlJ3a2JCemhsM01QcVk4WU9qOXBIakNQdWRWdlI1?=
 =?utf-8?B?YVdPZWY1S1pKVFdYZERTTnJvWEdDRnhvZHZSSGV6NG1MMU5wbUNHSU1ScGQz?=
 =?utf-8?B?TnVGL2o5K1RaR3BwVTBnSFBNS056SjB1YWRXSUd3MFFoS2svQzhRUGttQ2xj?=
 =?utf-8?B?Nmc3SzhER2lxSW9FMHNYblBaVkVqd05OaFdhZEJqc2VyN2RrY0Vsek1KTTV2?=
 =?utf-8?B?aEJoUTQ3b3ErL0hhVUhMQitiTDgxbUU5N01reXlzLytrRi95QUM0Z1plM0dS?=
 =?utf-8?B?dEdPUjkrVTZ5SkRYSGNOYmJoYjJ2MkczM1RVU1lIakRQRk9DMXlSNmIwdE40?=
 =?utf-8?B?aFBVVzBBR2VHK2Fjc0hQZFEyYWtNWlh1SEZHV256MU8yNTM0NEpmaHF5T3Zq?=
 =?utf-8?B?dzZpaXNvbHZJbWlpZ0FmUVkvSldadkw2dTh3amhodFdKaFhIUkRxZldoQkJn?=
 =?utf-8?B?anZqZDdOWGx1bDEyTlMvdTl3UXR4d3p5cXAyU1UxVnVjVHFJbExXcVk4dDY5?=
 =?utf-8?B?YUE1RTY0clducTJRK1lDUmIvNSt5Z3hNcmh2ZDBQejJmVTRmMy93dFRMdFI0?=
 =?utf-8?B?emliU1owUDhKcXBQRVg3SzB3ZkFlczJWMUVTaW95SEJGZjNJcTdQa1FaK0Fz?=
 =?utf-8?B?NFRpYnlKQUJXaXlsZnNCMGFBdlV4NTROMnN0VHZLYkVySDJkUHRGZk5DTUZR?=
 =?utf-8?B?YWhEbjFDbFZuUlpmZDJHaEtsT0FFV0NPTSsxd09ZSFpVdGtjZXJlV3pXZSt0?=
 =?utf-8?B?THVtWThuOGZSTnZ2NDh4WThDQmtLR0QyckFrY01pWC90Zm1iSzR1NklNZnJP?=
 =?utf-8?B?M2lLUGdGL2RvUnV0Nm1IS2g1MXUycGVxa01nT25oNU5nWkpNSWRGZUlndGN0?=
 =?utf-8?B?eTUrVnhBRmVVUzEwaldZOTFWaEpIUDFrMnpOYk8vVm5kVDRacVB6MXhEMnZR?=
 =?utf-8?B?OUxqNGdTTmNmWnQyVmlhTFRZemd1RlRUNUZUd2dxRjdwa3lzMzZIRndkNWNH?=
 =?utf-8?B?bXlvYnRQQUNmOWpUSy9tT2RDR0M3cFdiVXgxaGM2SjdVZDIrUWJxTktyTG9W?=
 =?utf-8?B?RTdjZlNZU0RWZ08za3kvNCszQ2IrTGN5WEMrWE9LaE5WODJZbjZxc2JSTUlW?=
 =?utf-8?Q?wM0UP5WWFTCXwossY9IXa8o2cveWmEq4ewB5LY2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a9a9172-b12f-4962-59bb-08d8e94afdd8
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 13:45:57.1019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Xfc+18DJcoRs/iEzTp+12/QXjkKOULtHbjamaZh+D9lwhAdpzSTbgvrlkDOFPh6JT26QO4OvywYQxy0bIL7ZGylsChzVVLI4oUen/5wgrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3827
X-OriginatorOrg: citrix.com

On 17/03/2021 13:37, Ian Jackson wrote:
> I have read this thread and with my release manager hat on I feel
> confused and/or ignorant.
>
> Patch 3/ has a good explanation of what the problem is it is
> addressing and why this is important for 4.15.  But then there is
> Jan's most recent reply starting "I find all of this confusing".  Jan,
> can you please tell me in words of one syllable what the implication
> of that message is ?  In particular is any of what you say a reason
> for me to withhold my release-ack ?
>
> AFAICT there is no explanation for why patches 1/ and 2/ deserve to go
> into 4.15.  We are late in the freeze now, so I would ideally be
> looking for a clear and compelling argument.  I'd also like to
> understand what the risks are of taking these.  Can someone please
> enlighten me ?

To make the code in 4.15 match 4.14, so patch 3 can be written in the
first place.

Also, as a side benefit, patches 1 and 2 reduce the quantity of logspew
from the impacted MSRs.

We cannot simply take patch 3 as-is, and say "4.14 and earlier" for
backport, because that still forces end users to specify msr_relaxed to
unbreak their Solaris guests, which is usability regression vs 4.14

~Andrew

