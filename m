Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 860924024C7
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 10:00:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180546.327251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNW1h-0006zM-JS; Tue, 07 Sep 2021 08:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180546.327251; Tue, 07 Sep 2021 08:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNW1h-0006wd-Fa; Tue, 07 Sep 2021 08:00:17 +0000
Received: by outflank-mailman (input) for mailman id 180546;
 Tue, 07 Sep 2021 08:00:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNW1f-0006wN-8v
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 08:00:15 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1be4cc95-5834-47be-bbd0-023698e99f46;
 Tue, 07 Sep 2021 08:00:14 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2053.outbound.protection.outlook.com [104.47.14.53]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-RbVMblSFOeGXKIM1TETcQg-1; Tue, 07 Sep 2021 10:00:12 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (20.178.127.208) by
 VI1PR0401MB2605.eurprd04.prod.outlook.com (10.168.65.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.22; Tue, 7 Sep 2021 08:00:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 08:00:10 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0158.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Tue, 7 Sep 2021 08:00:09 +0000
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
X-Inumbo-ID: 1be4cc95-5834-47be-bbd0-023698e99f46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631001613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qGYW5LYytLbES3ZLTz8QqvgRsEvCsh8vaEda5ensums=;
	b=BJEwoJ7Yb+YOMp0EvEWTyvVtwrVqKMfVw4/SesvqB6zHsc4AZffJMYgwoHe1VW/2MmydEW
	LRl4m7kGQWZroGSXkiR/OhsDFH/+A87nbSoERVz+oFf0c7qsHFVEnHQrQPRWMbzu6x2gFz
	KfuCkeDZHFrULCVjHUNDzBsbzyBKFok=
X-MC-Unique: RbVMblSFOeGXKIM1TETcQg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G8JOlJDb8Lp2O8VHnfiauI8z86sTs4NWpdicP7UfTonCKu2NQ+wNuDxjMavY2Hq+ePXzoJH0DQxBSxy9A1ZipOmlaV2qI2IYiwe2ug38Pvn1J3LyW3Gx5LHBkxE2NVwFIuI3m9fw/8f0STgZcetX4g5sV/9pNRAymZkLzVTCnmYrOiJw8Hut417aV3UB/PLu9Ih4nuuqjcxpdExEHUqPmndXqNACcukm5OVZBe9/0jmoMu0e7kuJK8hdM2iJwRv7vCgjXohoaimUMCBL9Vq6X47MhTaNuNqmm85f63bNLqXrOvkLsJUfnmCVrRg1zIqRafrT22/l9zE82KJv18OHig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=qGYW5LYytLbES3ZLTz8QqvgRsEvCsh8vaEda5ensums=;
 b=iNFLr6hdUFsDa+uDTSAjoA3I44L5iYlpo7TWelAH77Xd/cdo0V81fVYuS/BiB2ZVlfnPLopCRjzHVFIWIKMi4yc7vJMZzcNnbGriwKP+xu/wc9IPgw+WQcfGdbYupBx5HcOPJbymCgFPAbPNitwjT7lcAvNa/RC4BwIgPy2TuXQ24JsebwkRsPnIIqK5NR6jIN5kH9TlGxQrVEC4TeYe4qUB9z68isEgx12DbF1brlVk+o/9kX/bFg9kEqLVDXY1phI0BnEy2LTUws1l2u1ZxGza4Oplez/wYny8tOiKWiGCvJ4H+uABam2qrediKAKNGlemJrO2S3Am/sUMsruoYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 8/9] vpci/header: Reset the command register when adding
 devices
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-9-andr2000@gmail.com>
 <ffddb533-399d-3b34-69f2-33ba1e977231@suse.com>
 <5366265c-d169-041d-f812-1c49260f6499@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8f1816db-798b-15d9-7343-2199eb8f39e0@suse.com>
Date: Tue, 7 Sep 2021 10:00:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <5366265c-d169-041d-f812-1c49260f6499@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR0P264CA0158.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 223bb35e-1efb-4fb7-3dd7-08d971d583c2
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2605:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260581B9B2FC7C1813931FC6B3D39@VI1PR0401MB2605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W44jmgzxr1Bqfl5Ur/sgExxDR1isKpyvDiD/S1Nj9ebyDjNkIFg5zmvJR8RzhLuQKyWoZCADr+eemcZsXbPvxeS7Zyg/D2JQD9py+QGuleF3ylSNU9dzEjVOrUuOlvhnaVnI1pwLSLFyxetDCi6u7u6l8pgZw9ZI/aCZNXfHDv66Qv+8J25ACejM+PvD6oBIheXdOO42QEEGxnyYbNKS3+JWNDGWGdAcWtHb2eTtYR3XPmRdns6UMbxz4S+qV9Qpd7pT2QiZ3ifJvOgD45N/o4cTDjJdsfzT7NYC1St3IpQa8OmRpEYLIaxqsrjYsug+CZdlTWudOMBFCBO7iN3U9R/gf1bZzZV08LE9MsmbkQ69dJ6kkLOHWl3kzC1TgZZPmrPwS88Hi2tcmyVfybxBCBVXDFiWsi6i8xdTvw78NE1tfKNPXkjJ8TrelGCh8BctJgNadZul5UVW2NLVvJSalTAQasKfIBVzpKIMDsjarZGonuVt7WKETkAEh9a2Q5byePxacRUIw4RuEUHDy/1AKF8BTI3SlLJWrIimJAovYNkjkufstZoozjhsYJ/VhgicSLIu6iMQNg5y5NaxNAT9QC9DMI5DRQmhhXJtAJl78n6qfCMqmGOfH3G8g3tChiBqu2Kw+y8q70FvS0i1w/5ocj0euHEZZxg5CICjl1yD1ZS1NgwKVr0rldFlOQdtehW4oi40u61aLFliqe0OLlL9IVIMrmriAdCeiqr9kknE5855TY33sLwpEJEgMONwcvyM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(396003)(39860400002)(376002)(366004)(136003)(5660300002)(7416002)(53546011)(31686004)(36756003)(316002)(16576012)(66946007)(83380400001)(6486002)(66476007)(66556008)(186003)(2906002)(26005)(956004)(38100700002)(31696002)(2616005)(478600001)(8936002)(8676002)(4326008)(86362001)(54906003)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlpPMitNdi80enhCTTlhemxDSTVVK1dwNEJQdm5zMXBqcDR1MWhIb29hVTdY?=
 =?utf-8?B?RUxEV3JCRzJ1RW1KUjJLbWxLTTR3N3FmNXpwQm5ZdXgxWjAvbmNzYS9hY3E5?=
 =?utf-8?B?Z3pYZEw0UG8xUWdhRVdUaTZqaGNybzkxU1RzQW4vb3pXQ2Y2VmQ1MjU4U3VF?=
 =?utf-8?B?ZlBTd3V2UE9DeDNiMk9relArbTE1ZEJ1M1RhVnFTV2VWeVJYOThxb2g5alJh?=
 =?utf-8?B?S1daZkV0NnBLYXVPSXZYejRSY2dxNGpQNmhLVjlHVWVWWlRQdktBWC8zOFpE?=
 =?utf-8?B?cXdTUmxWaCt1VC9LbHVVUmI3Qy9zNDZDSUlQdE54TWVXU0ZHRlhyNHQ1QjRu?=
 =?utf-8?B?L3BLSWNoME1lUk1laWJ2ekVCbnNua0c5ZUhOK1NCbVh4VmdKQkdDNFUyK2dj?=
 =?utf-8?B?dzdiQ25FNWlCZE1mcGg2NjdSbnBDSDdxNlZ2Rk1uNHp6NGJaV3lsRHpBblZG?=
 =?utf-8?B?UjAwYnhKbmY2N3JSVmJMcE1kcE9wVkhCNEg2VDYrNEE0dDJ6c3Vud0xlbWR3?=
 =?utf-8?B?OWxEaEhBODlNZEQ2NlpvNDBYZEd2M1Rka3o0djU3cWJ2YmhzVXF4RUpVSjdC?=
 =?utf-8?B?NUtaVCsycm1tZVVKWTdUYzBXcEpMNU5scUUrZTdZSmJGK3lhZEV3Yk9lYnBG?=
 =?utf-8?B?NFlFQll6QXFiZTBVYmdSSFBtYjJHUU1nZFBUWWQyOEM0djdTdllnR0hvZE0v?=
 =?utf-8?B?Y2pVcnd5Q2tLOVVKU2JETSsrVEoyakxBL0tQekVLOWhaUFZsS1p2Mzlta3Mz?=
 =?utf-8?B?ZkQ3SVJQcDI3STVwVmYwN1ZZcnVCNTVPaGtjUXdNWGl4NTIyTElUQUQwU21Z?=
 =?utf-8?B?QnJTM2RHelNocVduOWl2aFRybVgzQ2ZLVGE3eGljMUptWk1zeTZLODE5VXpz?=
 =?utf-8?B?eGRvdEl4OG9tbFlNaUhLZmRMN3d3M1o0T3RUdkR4S3EzeStMOUpVMFJaazdW?=
 =?utf-8?B?bHIwZ0twbi92M0dLQTVKYVNTMXB2eE15bkkvOFpRRkg2emlpRUh0VzBIejFj?=
 =?utf-8?B?VFBGa3hrdjRQTFp3eUl1bTI2RXhXSm9RR3lRNDkrSGJ5Q05Ec1lsb1VMd3Rp?=
 =?utf-8?B?TmxpamFJaWRIaXE2YmtwbHJFb2RXaUlnUldtdGRMcE1wUVF3T2lFcE9pd0hy?=
 =?utf-8?B?RnVnRzV4VTAvbWlyT2UvdExkakhJOHNVeWhHbkJVUTdMZERPZWVYVHZuR3hZ?=
 =?utf-8?B?d2dXbEd3a0pIOE8xbk9jcHdIcXV5VTZhWU1iWThFRUI4K0lGL1JvQmlYOVdM?=
 =?utf-8?B?c0FiNVMycG1rViswa0g4TVhCN3BFR2RtU2MzS2ZObmJuaXV5ckFFL0V1L2VF?=
 =?utf-8?B?eVpnQ3g4VHg0UmZsdjN0elBmR3lSZTlTZkJ1bVVSdnBEdFR5K2hsOUNlQWdB?=
 =?utf-8?B?a1JyMDJMNGhpd1lXdUdhdzl5TzQzWTUzYVpaejV1SlVmT0d3S24xMXVRSEhD?=
 =?utf-8?B?Uk5KN29zWWU2YTV6dVc1WHJJL3JEalgzVVdBK3RhcmFhdlJjZUJkQWhVN2Jy?=
 =?utf-8?B?SWVPeE5Wa05rdzVMUkVRVnViVjA2V1lSS0Yzc0lJRUExczdXM3plTmowZ3c5?=
 =?utf-8?B?WlIwaDNDVkgrVkhseStYMTZnZVJKNGtvTXdPWE9LT1dzYjhlY0QvQWhTaVJr?=
 =?utf-8?B?VDVvYTBjUk1CYlJhcUhzazZFd1lKNlN1UWdEMUpDZ0lmeXdSR09KV2hFVmgr?=
 =?utf-8?B?YlIyZUZHSGFjVjVLMFpUMGowQ1RsamV5RldXRjFvd3l3NU1zKzVKMFk0NDJs?=
 =?utf-8?Q?PqKd+raBG1YqgM2IKrDake8vGx9V5fO7H/0mO4L?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 223bb35e-1efb-4fb7-3dd7-08d971d583c2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 08:00:10.3273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CppwKVVBl30tD5wgR07UVvKzn08D8WT+tB8mfkilSOW19cqXFMMHgDGSWBWtU7gt7Zb6n3XTAaRoFzaEhVc6dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2605

On 07.09.2021 09:43, Oleksandr Andrushchenko wrote:
> 
> On 06.09.21 17:55, Jan Beulich wrote:
>> On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
>>> --- a/xen/drivers/vpci/header.c
>>> +++ b/xen/drivers/vpci/header.c
>>> @@ -811,6 +811,16 @@ int vpci_bar_add_handlers(const struct domain *d, struct pci_dev *pdev)
>>>           gprintk(XENLOG_ERR,
>>>               "%pp: failed to add BAR handlers for dom%d\n", &pdev->sbdf,
>>>               d->domain_id);
>>> +
>>> +    /*
>>> +     * Reset the command register: it is possible that when passing
>>> +     * through a PCI device its memory decoding bits in the command
>>> +     * register are already set. Thus, a guest OS may not write to the
>>> +     * command register to update memory decoding, so guest mappings
>>> +     * (guest's view of the BARs) are left not updated.
>>> +     */
>>> +    pci_conf_write16(pdev->sbdf, PCI_COMMAND, 0);
>> Can you really blindly write 0 here? What about bits that have to be
>> under host control, e.g. INTX_DISABLE? I can see that you may want to
>> hand off with I/O and memory decoding off and bus mastering disabled,
>> but for every other bit (including reserved ones) I'd expect separate
>> justification (in the commit message).
> According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0" I have at hand,
> section "6.2.2 Device Control" says that the reset state of the command
> register is typically 0, so this is why I chose to write 0 here, e.g.
> make the command register as if it is after the reset.
> 
> With respect to host control: we currently do not really emulate command
> register which probably was ok for x86 PVH Dom0 and this might not be the
> case now as we add DomU's. That being said: in my implementation guest can
> alter command register as it wants without restrictions.
> If we see it does need proper emulation then we would need adding that as
> well (is not part of this series though).
> 
> Meanwhile, I agree that we can only reset IO space, memory space and bus
> master bits and leave the rest untouched. But again, without proper command
> register emulation guests can still set what they want.

Yes, writes to the register will need emulating for DomU. Reporting the
emulated register as zero initially is probably also quite fine (to
match, as you say, mandated reset state).

Jan


