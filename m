Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 708C93E5588
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 10:34:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165295.302089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDNCR-0000Sn-Qs; Tue, 10 Aug 2021 08:33:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165295.302089; Tue, 10 Aug 2021 08:33:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDNCR-0000R0-MW; Tue, 10 Aug 2021 08:33:27 +0000
Received: by outflank-mailman (input) for mailman id 165295;
 Tue, 10 Aug 2021 08:33:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CvVY=NB=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mDNCQ-0000Qu-Cf
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 08:33:26 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41bcf3c8-e6cd-4223-a914-6ae0532f2370;
 Tue, 10 Aug 2021 08:33:24 +0000 (UTC)
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
X-Inumbo-ID: 41bcf3c8-e6cd-4223-a914-6ae0532f2370
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1628584404;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xeNzRTaq7EbzhFto09/4l3icPuceGhXuRsWUN5jnfEY=;
  b=E00LKz0SnRq7/DvbsHdeKw1Y3UfRXHBT4eowyXbylWxB06VWq3JqSWyz
   KTLiNnQYnzxgFDvd8mcQRekDM2gU533JzTKJUJgr5BCqJDF/ko4bJETh0
   dzxOMNu+lUZjkzvaPxHlbqmkTfuw7mAySVcgcTQG9ictrB9kHSvRmVqwL
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: /ysuthRUydvviW7TSZc4+sAOvzBjMRBOvqS6Kdg9Hff9ilfhFgVgcgRMa2YrT2pHp3kl9mlXc8
 Or+s+/K8qwyIVZkTvdCQQgonjSakyO5yR5M1wLxsp8oMcu8+HX/PeaeENHFSv5+bbaGFtNE+Jm
 BK0uzVd8tyiIKxLYs/6pusdgwWzS7A4Kb0srknqf4m8kIe2l5djWXwADJ92iP50YOPOF8t+qur
 wHydyKw4bs3U2rTu6RMwdWrblc1xUSxI/LCwuVsdHVga0Vfq+6TWGL5zhE43Vl+h7wRn5+siTQ
 ileHR4Nk5Ouf+HDfsnsc5Lbf
X-SBRS: 5.1
X-MesageID: 50127795
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tDWVuqsY1/WCg9QsqudqtZet7skDgNV00zEX/kB9WHVpm6yj+v
 xGUs566faUskd2ZJhEo7q90ca7Lk80maQa3WBVB8bBYOCEghrOEGgB1/qA/9SIIUSXmtK1l5
 0QFpSWYOeaMbEQt7ef3ODXKbcdKNnsytHWuQ/dpU0dMz2DvctbnnZE4gXwKDwHeOFfb6BJba
 Z1fqB81kedkXJ8VLXCOlA1G9Ltivfsj5zcbRsPF3ccmXWzZWPB0s+AL/CAtC1uKQ9y/Q==
X-IronPort-AV: E=Sophos;i="5.84,309,1620705600"; 
   d="scan'208";a="50127795"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Evx4kcd2udZC6git7ZjUvNPTo4zWRZ0FK59fp54zffBaPjGl9kbrkxYMWyXJOEGjoeQ9PTcOgcfiFhmU8didfTRXZc72COVK476Wrukvs9P+sFtk9rAIGu99JLkH7l4p6oGVlcQuG/6TbltnLHfNigvR/WkmeTzSP9Xwl8Z6l6qyVWsXZU2AV9qjJfQd38EIo4CLowfOcvS//L/aNflA4wHtMn4gvSjEg3EyGzH2mrKjDTnroyX6Vk5VPBxxNrHp4uekYfvN5I3MW6DmHyl9C/0zcBl5Y/2dxYyPpadl3c37e6FjWpAavpjK3LCjKreU8TlDQuAPP0s8wJ6v8X/Zog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeNzRTaq7EbzhFto09/4l3icPuceGhXuRsWUN5jnfEY=;
 b=Z1ni+2BxKZRIO7W1L8sxmB4yM8+oSfHbKRdCCapUUu/yiqeT/FGr3whO7YMv2kgp0fRfe4nSMFe/fEP6P/Ri4OKJhofFiMZiH/CKKGvnFQWQ+YY1tGNYkR9BusM2z7GI6EueWb6J178qvn1HjUJauhDipnq1oLYcxZLdAfcKA5Jnvf6xW+hijPVUfZSyFn7J5Ria0OZDMfD9wARGdSxk7nyB4V8Ckh6qbLpGsKtW+Mtsrd7B8yCAvyPT4vFOp55VfOJ/IfrGSKyZaDDb9+sdiMRXJQ8Q+j4YWZgxn2g0Gn3XR+xKR+4d9qdrRZfjPOkBbPgP8HcMV0KfHhZMTaBu5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xeNzRTaq7EbzhFto09/4l3icPuceGhXuRsWUN5jnfEY=;
 b=R2PddOxpWBkwjhjcUd+OeV28a/12U9SD9uvBEmwE0fvY5cqgUHyD9kF3qgfWg3KnBCyBprxzuLfLlF+G5Bwrk9QCrM3dZ67C4KtYRoBO/4wdelL1QXLojYf2KgXnYRDUdzV8dYGp/6my843sYRaC6Pjkk0TJQlFMGBhPldlQ6BY=
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <2e0beb7e-022f-efb3-3adc-4877c60bfeba@suse.com>
 <69a34c1f-0df8-47c2-4c67-2b22abb9fd21@citrix.com>
 <28bc0732-9c20-c670-4485-8b39bc595eff@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: work around build issue with GNU ld 2.37
Message-ID: <b310f267-c478-15b7-7e1d-19a650d0a891@citrix.com>
Date: Tue, 10 Aug 2021 09:33:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <28bc0732-9c20-c670-4485-8b39bc595eff@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0298.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::22) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cf508291-ec09-4a56-607f-08d95bd98116
X-MS-TrafficTypeDiagnostic: BYAPR03MB3494:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB34949EDEF42D94BB342FF37EBAF79@BYAPR03MB3494.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1186;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 54Rll5ZlbDBLkroPaxNEq1qETXJMINBUXc51X92s4XElKumRpXipQwMC7mbrbmMw2LJrUiSO3pCO9FGG1Ly/8MCqNa9SuiHHeD270euEiKgNXs7hJFGEK1lVgy1q34JhbXC+uL+y5Ih25pLJGGJqNt4TJKiA6Xrj8tgbISO0LZFgqge9sjvq+bnsqkgoDp0+FPUff11tezuejrhESukBxHyQSBlw6OXATdFWgN6xDIPpP2gFD8bER6eBvi/n4SD+Mz/HlmJKk1v3f88J+AyfDmNUwq1B+3syB1Uh0X6j1b2zaoJNoUipE3go3xou5UFTSC4lHBNd3hiqEzTHSywe02eylOBbYjLu4p6Kov80AVS/5lYbn0igIiBcdBdqHj44Xo7tl3ZMMVPeZ+PsMKPyP8vYjfFOlgUvTFxY9csn2IDB2wrwkeyvXTnZnacq47NFskFErIExqGsIopPGxB9QC5jzJaqjCGEE68S58nIAA1jozJtsUZ+ulQgGAB0cz57dLMLjDfT9W+M4+cHdgtc9Kxru+qXbSQtTow6FYv+1TWRa1ErqGeT1T4V+cMVazWfO0eARfLdQbnCAC9f736yRZkh5IDCbdE3l2xS8xFG2poBdHp/kcERWuNhOAyDHnNsBP0kjnFxdPK7rJQeSmguoyZpphmmNSgzhH4qlfkoG+yYixBpEM7UkBdDvv+EB2knrqWjSVtKCq+g8ztZ7hNc/p7qBNouFVf5lTjfMHfpmQogFImqv1/+QyMUoCURFSbcFYX6m0HohwUWY119FzTY2jauUSxJVIxG0d60+HCVpEhGY8OZAoyh7bCpWUZ+GeMHE
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6666004)(8936002)(53546011)(86362001)(966005)(38100700002)(36756003)(186003)(4326008)(6916009)(54906003)(31696002)(2906002)(66946007)(66476007)(66556008)(2616005)(956004)(316002)(16576012)(83380400001)(8676002)(26005)(31686004)(5660300002)(508600001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWNTeUlhY05udjlSWmdsaVB4c01kZE1mOWdnRTFUNmxMR2tjTlZxS3lBa2xD?=
 =?utf-8?B?U3p6alpYdWhPV0szZE43MTkzcnl3UU82ZzB1eDV0dys1RFA0YTdoNGJOZzdx?=
 =?utf-8?B?ZVRUVVZ5YVhCTVhLK0g1RFhOTUJZN0VtSEYyY2RGQ1lFcU0wK3dKU3l3dlcy?=
 =?utf-8?B?RW5BL1pud3BaWDhlZEtHOXZzUS96M3plOXZNS3JxejNTSW13c2xYY3gxa1BZ?=
 =?utf-8?B?a3dmc05RR0hyTU1tZEhmNFlsRlFKN2IrUjVTaVA2N2ZTYjNjL3JlQ3J3ays2?=
 =?utf-8?B?dnRIQkk0ckdkL1FJZTBHZEFFOFdXWi9NblE5QWw5OExkTnJBZE42RThNempi?=
 =?utf-8?B?aVByQjhEL0JiTVYrWEVraWRnQm9BNXNPbStKTm5ZNVdMTUhpNjlOTnFiS1pi?=
 =?utf-8?B?VVgxTkJLMEdld3hXanlEcGUwQ05UY21QWXJacjZvU3hLZ0d2ZDlPcnhyTGlZ?=
 =?utf-8?B?L2VpNzF3U3dCNGFmL2Nvd2VlRGhtN3VBSFAxcG90MXlIUFh1bHZZS3oyZndy?=
 =?utf-8?B?VHdMcXc4d2hZVDZIRDJvV1RNMFR1cHh0cW0vYVFtelZnM1BiQVdaOGh4VS84?=
 =?utf-8?B?SmpTalZkUHdjQm9CZTk3TGUxM1pBanZNZXVCdnVnbUpINmVONXJDL0U3K1ZE?=
 =?utf-8?B?V1RRcFhLNDBLSU5rcEFhay9WU3FXNlJGWGw2UjZCVWN0dFRSdTI5bGVCUW9W?=
 =?utf-8?B?SWVPNGpnMUt6WlBJYzM3b2FkOGRUTS9XV2JxL2ZJeGFMMzNGR0FOZkJ4Zzhu?=
 =?utf-8?B?WnJ2YUJjM3p6QWQrV2pLWWxrWnRaSi9STzRJWHNpWWhBa0ZSOFJqSWIxeTNO?=
 =?utf-8?B?Yms5MHVzM3JCSCt3MmdTSWwvRFo3Zy9adkdmeGV1SFdIZmM2L3ZjWEVUQkVZ?=
 =?utf-8?B?UWZrMzdtbDh1MUwrcjVXZkUyeEtuTHFYUUFhL1F3b2Q3anl3Z2ltOTRTWkNk?=
 =?utf-8?B?elhMZUNqWTRUdENYdjM3RHNpTENUdzYxaHdtQWEwRElmT3k0WjZKcXYvYTU3?=
 =?utf-8?B?eFdrTkd6d2F6MkM2eUNNRHNpdnVadDN4YjY5QUE3eXE5UDhia0ptaXVBK1lv?=
 =?utf-8?B?dVF2ZGc1RnQ0WEltZlhwUHltcDRrNGtKZWZEdVZnOFo5Q25yVmFLM01GQ3dZ?=
 =?utf-8?B?Vmpva2VvN0NaVFFEWTFwYU9PRk1WUEsyYklkYWcrNW1GZjR3ZU1XMmdwME1D?=
 =?utf-8?B?NG4yWk5sQTFKckFTT1VjVG9GQnFoOUhLamU5dFJ0b2VIeDhuc3lNb0V1TjBv?=
 =?utf-8?B?S21lQTU4YTg3dmhUMHZPQjN3empmR2t4Z3E3ZDNZWGVzUW9Wa0VTeTNsOUtM?=
 =?utf-8?B?N3F0elZBQmJDRkdlcU5ra0pJUGxZRXkxNHEzWWtLS2NUYXJxQVZxWEhFNjIv?=
 =?utf-8?B?cmZrOGphY3VoazUwalBmdThZNnJlMXorSTQvTUFCRnVjUzJjWXNVSEk2K1Iy?=
 =?utf-8?B?U0Rmc0REellTSFJhcjJ2QkFROFFiOFdIVVRrUkhXaVowYm1IUDV5WUNNMzhH?=
 =?utf-8?B?Y0RWSWNueFpFRmlFVEZzS2hUZTBRNzFKZSsvMnovZ1ZqWFJneU9KUTVxVlAy?=
 =?utf-8?B?RnRjaURaK3N0bkVzdXFxVmhuOC9Gckc1MFFBYUoyR3h1WC9YaDc0M2N6VTdh?=
 =?utf-8?B?YkVMbFd6SFhpOEtzNWJ0Q2FpZmMyeVZHVGowbGFUYzFFeForZ1Fmb1VZclB2?=
 =?utf-8?B?Nk5oWGlnSkJBNFgvM0pmYlg4b0oreWJBd241Q2I5QmZPWXljcWpKcGRteGtX?=
 =?utf-8?Q?N8tEP/4unQsgCuj6ShIPexdyyz7TgP1zbuw1qmi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf508291-ec09-4a56-607f-08d95bd98116
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 08:33:18.4692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G4ymP0YVtlO87AL26+fY5IndOIiVieJieKH27zsNcUEt+GhogIpLCuYxPmXmLrAPZSJ4eqIO9pd/ls8EEb+CYIAN06uYxej10bxKKnnQoGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3494
X-OriginatorOrg: citrix.com

On 03/08/2021 07:37, Jan Beulich wrote:
> On 27.07.2021 14:33, Andrew Cooper wrote:
>> On 22/07/2021 10:20, Jan Beulich wrote:
>>> I suspect it is commit 40726f16a8d7 ("ld script expression parsing")
>>> which broke the hypervisor build, by no longer accepting section names
>>> with a dash in them inside ADDR() (and perhaps other script directives
>>> expecting just a section name, not an expression): .note.gnu.build-id
>>> is such a section.
>> Are binutils going to fix their testing to reduce the number of serious
>> regressions they're releasing?
> To be honest - I simply don't know.
>
>>> Quoting all section names passed to ADDR() via DECL_SECTION() works
>>> around the regression.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> I guess we've got no choice.=C2=A0 Acked-by: Andrew Cooper
>> <andrew.cooper3@citrix.com>
> Thanks. I see you've committed this already.

Actually, it unilaterally breaks FreeBSD builds:=C2=A0
https://cirrus-ci.com/task/5417332467040256

I'm not sure why my build tests didn't notice, but obviously this patch
isn't a workable option.

~Andrew


