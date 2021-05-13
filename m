Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1BF37F50B
	for <lists+xen-devel@lfdr.de>; Thu, 13 May 2021 11:50:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.126794.238252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh7yt-0001ox-RE; Thu, 13 May 2021 09:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 126794.238252; Thu, 13 May 2021 09:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lh7yt-0001lk-NW; Thu, 13 May 2021 09:50:11 +0000
Received: by outflank-mailman (input) for mailman id 126794;
 Thu, 13 May 2021 09:50:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=P1X2=KI=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lh7yr-0001le-SR
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 09:50:10 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 008b7613-ce50-4de2-a1f0-09928eb2f586;
 Thu, 13 May 2021 09:50:08 +0000 (UTC)
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
X-Inumbo-ID: 008b7613-ce50-4de2-a1f0-09928eb2f586
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620899408;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=yHLKetI3NyzR3rzD1w253ufqwhgEkkui2QRIuUW1rss=;
  b=FJw9Sd1YfbPG+HypMwfJ5FaCWTEieQ67cGXcH4klr9DLOHLczlmW5RXQ
   IdWezX0Nu4KSWYhj8X62OGGLN0lsmNAhYYWhE/Rj+tsTzJm4vgEGIC3N9
   wIAhmbGBklqRgP3Ofry5tVuFCvAnemWuHqRF4w14GuBkwOIruq1FuOsgn
   I=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: s9QPmd7KPYMxlrR1I/4XMks04S32kJb00wL/imkLcmPslXfOwX0HZrmB+3uUXU/+sybHSMUlAZ
 eVt3qwG3yg+GfbbNfp9b7Lf1CTtqT/hlEjIagERR29nltW8uV+XKiHXyDp0Ll47Svrs8tGOr5a
 Z543i3rFu0C434nm1J1f+J021hkfEiWnIeLdp27zkIV70UDFE6AEMrFxAADD1aIERa/MziuKrT
 d423zwx8/5X+QANBnvcu/iO99plgjXg3btSDBnRdCNAvtuSRPPnhl0OEhUuUg5eZEeBWWddIRL
 5Bw=
X-SBRS: 5.1
X-MesageID: 45247315
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:zEoY36zJU8W1aUMW2jDRKrPxJ+skLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjnfZr5z+8J3WBxB8bZYOCCggqVxe5ZnO7fKlHbaknDH6tmpN
 tdmstFea3N5DpB/L7HCWCDer5KqrT3k9HL9JXjJjVWPHpXgslbnnZE422gYzRLrWd9dP0E/M
 323Ls4m9PsQwVbUizVbUN1E9TrlpnurtbLcBQGDxko5E2lljWz8oP3FBCew1M3Ty5P6a1Kyx
 mFryXJooGY992rwB7V0GHeq75MnsH699dFDMuQzuAINzTXjBqybogJYczNgNkMmpDt1L8Wqq
 iPn/95VP4Drk85P1vF7icF4jOQkArHsBTZuBulaRKJm72LeNo4Y/Axzb6xPCGprHbIh+sMpJ
 6j6Vjp/qa/PSmw6RgV2OK4IC2CtnDE6kbKwtRjxUC2b+MlGclsRNskjTxo+dE7bWTH1Lw=
X-IronPort-AV: E=Sophos;i="5.82,296,1613451600"; 
   d="scan'208";a="45247315"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LZSXaqE324CoAmtxH7tdJp3NWHa0Hb2RBX4HtfBg3zOmUeHfoYxti28pN15qSEA/JHueTqIKiaIVoUG/1acQ68C0QtCB+KXarLrkgaK8iY6iCpVFUuo/oofX4HmEOuB2zIzCZjBr2wBnrb6oTZSHTIvmHbQMHQKXwu3oEX2bFKM1By6GFWMETR60g+lRKha/O0NYpzwnAQ0UZGtJKPAGvkZm/9QpsWI5rEgqy4ss+bIm7ol/pzs6J/0aefiNNoLVxE1BK1SgLWn8Utk/Dr06MxABiabfS/H9wFZri7fNNIlYISlUWflpQF2TNuJXVSQ93KOzhmtxsXijJIN9vV21tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMXwlt7TVK1hz2VTJ+mF80Mj3FSuGadpLNeph+EWHgs=;
 b=djxudOyGvM6oFPjCX4mqGyIlv4qiluwPxA+Ph3kwi6jRWmcxZsWeXRiORFbiy9B1KZCTLYB8lIYIr0KtVu8t52hmypoFmfMuaTY90GfOdse/70DxksS3cXA9OfYmYsH5R6nnU3WDw0YKVQxBLvdQsrhAu7eAQ+IbiwBGvk1OeLEniGO6cUCJNsBTz6MGJaZFBMNyrCCRM3TTtGOqV7iAp6jvEZZLx3J9EWn8efu3PZHQK33q4us4Z1PCgan8W0jkku14iOhj16zxhbAQHEALXSb0xqq9n7RaRVqh/HBtThny3uWYaIQxtLIPdO05KuJietBf7qGlmjvyF/S3OX3a9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMXwlt7TVK1hz2VTJ+mF80Mj3FSuGadpLNeph+EWHgs=;
 b=kGMkYa6btl5Mj1kfgPjHtP2JaaoPqEExZtrrSf7pWOFO51BlIvETV5rwzYkpEanzqC0dT65KBe6o/hUxJs2uL99hl+MA+DV20ms3gZbCltlwWO7s+UBKhkvldG4euncjfhb6L3DZebGn5UBpcQbNNSuMRyocCYIecVSfaejrmJ8=
Date: Thu, 13 May 2021 11:49:58 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: regression in Xen 4.15, unable to boot xenlinux dom0
Message-ID: <YJz2RpJ/c8dTXG0w@Air-de-Roger>
References: <20210513112136.6dcc3aaf.olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210513112136.6dcc3aaf.olaf@aepfle.de>
X-ClientProxiedBy: MR2P264CA0149.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:1::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff93146d-a3cf-4d60-c139-08d915f47bf9
X-MS-TrafficTypeDiagnostic: DM4PR03MB5967:
X-Microsoft-Antispam-PRVS: <DM4PR03MB5967D172F10880E5BB43D9FC8F519@DM4PR03MB5967.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v6Gizg+R7O3uo7qotiFTnK+pqn0ZJyVqDtH2KIPjaYGcwnOC1HO+GqtsD1IkJUWrSezLB+/8LQiT2k1Hb3vsH38ksql3kcJTGAVmh1nrwQPQrlxV6zkC1CZ6XVPpLOexqdAfNou8FIMRSxbrDHjpjZi6Nlc0BzpSXKaqHvZrE9gHqZkjHGkCSyvc0xtuwGmRcI/GSpqqnsrl87jwDGf7e6Cx0jW3PwgV42/Z/PgTXqag/ZfEteMsPXWvqj7Xd1XNPpfN0HiooSJ7aZq59oYswz6rBvHiYariiraNE6wObCQOOFHXpp2u1dGzzhxFpH+BadAytXO6H4YKO26MI3oxEVkznlns1LnBHt8vbW5/GWrtXdNx/vt95MWM6CBkRTAhgM/tdspfL5/0P+dP8zX6I5zJA7GDf0Tlg75E++WTZ+jaYBCqLKAWmsOB3f35/sxbvRdbsnoYo8LiX1se1sD3utr88vmnAyQJCBl/4vPs+5heeP+flluZsToKQSEHN7cuoS5vc2eT7Bz7B39Y3AX33b5lwoIb1UvccrAZYHqIUGbbFp+oRrp9KS2WMLE1dUDkiQkn5ulMmznsiIjnlCjDP6dp+HXyI8y/mpglwu54e8Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(366004)(346002)(39850400004)(136003)(376002)(45080400002)(16526019)(186003)(2906002)(5660300002)(956004)(26005)(4326008)(8676002)(85182001)(478600001)(66556008)(66476007)(66946007)(9686003)(33716001)(6486002)(8936002)(4744005)(86362001)(83380400001)(316002)(6666004)(6496006)(6916009)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cCt3MG1yYTZFMGVQRXZqR29aR3AreHJWNy9HRmF6S1FwazFqYytYN3VERFBS?=
 =?utf-8?B?SmlUbmtObFNQYTBmUjJ6SFQ2YStkN1BFY3BDWjJ6alpocXhZRFN3WXhOYmho?=
 =?utf-8?B?ZnhqdGhrcjJkQlRQZURHdXNwZHdBOXU4NTI4TXJoT0JCNE9La3dneVVCY0ZW?=
 =?utf-8?B?YlgzemlOZXNPS1h3U0VzQzM2alZJbzgweWlldmMyRlgwMWtVaXBRQVV4OUF1?=
 =?utf-8?B?d25ydG90SWNqMFd1Y3Ivd2pvekQvMmpyczZEQlN5cTY5eHNVeGtKODdWL2o3?=
 =?utf-8?B?UkdBRGY4K01wM215cWFZNFphSit4QTc5S3FxZUNjR01QR1ZWdzJySDZiVDIx?=
 =?utf-8?B?R1dWN3hKeDIva042ZXVzcTVRbEl3SXJPZTNVR0hmd0I3cjhRbXF6dTFnWkxZ?=
 =?utf-8?B?MUN2NjBxOTlybzBjaTR4aW1DWU9JZVJXUGxDS2F2V0FvR2x5MjNTVVR0VURN?=
 =?utf-8?B?UlpndnZXSGpPVUJlV2lLMUhsZlJVa2VMQTJ4d0t0T2lzTXA0UWNPQW1EQU81?=
 =?utf-8?B?K0ZsMUVYcXdTUXMwcHhXUUdiSUIrOTlKc2EydVBZMC9mKzRUdFkzb0liVnh1?=
 =?utf-8?B?K081TTR0bVdhR3h0MTM2VjBHbWFCd2E2Y3ZaZTlPaWdDL2U5aE5ac3dVYTBK?=
 =?utf-8?B?d1c1dTV6SWw0MnpSUjFrVzRRUDY2dUE1cGlKdWliMU1JdlErMFZadWJhbzJY?=
 =?utf-8?B?a3V5SXJnMUhBT3E1K1NtTUVCalB6NkVjQUZ0V3N4QkN6a3NMczFrdEZnaUZw?=
 =?utf-8?B?cXZnU2FIUVdBZFFTMFJPK0k4elRFeGkwN01vdlZWU2VVWWpBVi9wMVFqaXFY?=
 =?utf-8?B?VllZN0lma1VSK3l3VGtrQ08zaVZCWDRmK0lXY2tKbkc1UmhRYzd6T0tBb2x2?=
 =?utf-8?B?REU5SE9TVnF1WUZibEI0UWlZVUVzNlFzek9WTDlYcm80OHRPeTYzNE1CSHZr?=
 =?utf-8?B?UHplQjBuQURzMk5jbXpkdENVNGdqWk9KQmVGNngwZHA3blVmME8xVHVZZHFM?=
 =?utf-8?B?WXlyK1VKMUVyOElUM3d6L1hxcjBwTk4vU2dUSGpJclpvSnF0Nzk5QWhBMUhO?=
 =?utf-8?B?V29SbzBkOFBPRmIyM1RjeTdlbkE3dTBBeDhrNVFrNlJhYjhzenExeUpnTTdz?=
 =?utf-8?B?bkZFaURsczNxNmZDZXZOWXB5eSszanFWMGp3Yk5QUGNwb01waDhwZzhQT1A0?=
 =?utf-8?B?NzJJTzh3Z2dpd1k4R1AzUEtRWFhLVXU5ZzVpV3hhNVYwYm5OOG5lc2QzYWZX?=
 =?utf-8?B?NkV4WW96Szk3N1dnc3hPSmdWTDkvYm9POE9rQVJrbmdYNlhJY3dZMlNOcHF4?=
 =?utf-8?B?NWdRMmtrZGVzNWxuckd5aGZaZ1pKN3I5dXFtbmJpMHRmYU1FSUVRQlROaUNE?=
 =?utf-8?B?anBiMHNXb3M2eGorNHRHMnV2TkUwMk9JQTBRSUQ1SXRjS2ZrNm8wdjQvNFJz?=
 =?utf-8?B?K3paVVNBRmxEMEFxNGxwczc5ZVFyREcrYVladHRBdFMyZzNuTEhyeHlFdEIz?=
 =?utf-8?B?VzM1NjZmSklkUFBoVXJMVjNNVjluQmdHZEU4eWVhWmkyU1lYRkVyb2RtRUhO?=
 =?utf-8?B?NGtmU3VXelN0TG5oQjZLNGRjQnpQWVRoc2F5TTVDcEx4TCtjWFcxelpjL29p?=
 =?utf-8?B?QzdUdHR5TWJndElOTTJDNmxCL1d5U1drMnVSUEthNlZNcWo4OGZVdFloa05C?=
 =?utf-8?B?M1BadW5GV2xDUlBNejdLYnpTRkZDSTdoQ1hZWDZlTzhyRFJ4UzV1ZEZDeDUw?=
 =?utf-8?Q?cGE3bCtxeii7WhPYI6MFRjyvXmvckhc6Y5ECtmN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff93146d-a3cf-4d60-c139-08d915f47bf9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2021 09:50:04.6999
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11W3qjMrSM8UhpxKyplI35O2+aDBoDTdH5VfbfKwNKc5KI5gUku175vzt8PheI9uKrIy+fX4lrxBCIgvvZNmeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5967
X-OriginatorOrg: citrix.com

On Thu, May 13, 2021 at 11:21:36AM +0200, Olaf Hering wrote:
> I have access to a ProLiant BL465c G5, which can boot a xenlinux based dom0 kernel, like the one included in SLE11SP4. But it fails to do that with staging-4.15 and staging:
> 
> ...
> [    0.197199] node 0 link 0: io port [1000, 3fff]
> [    0.197199] node 0 link 2: io port [4000, ffff]
> (XEN) emul-priv-op.c:1015:d0v0 RDMSR 0xc001001a unimplemented
> [    0.197199] general protection fault: 0000 [#1] SMP 
> [    0.197199] CPU 0 
> [    0.197199] Modules linked in:
> [    0.197199] Supported: Yes
> [    0.197199] 
> [    0.197199] Pid: 1, comm: swapper Not tainted 3.0.101-63-xen #1 HP ProLiant BL465c G5  
> [    0.197199] RIP: e030:[<ffffffff807874e4>]  [<ffffffff807874e4>] early_fill_mp_bus_info+0x344/0x7f9
> ....
> 
> I have attached the full logs from staging-4.14 and staging-4.15.

Can you boot with dom0=msr-relaxed on the Xen command line?

Roger.

