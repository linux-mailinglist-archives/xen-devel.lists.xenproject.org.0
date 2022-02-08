Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0810B4AD5EE
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 12:10:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268184.461975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHOO3-0001p7-FG; Tue, 08 Feb 2022 11:10:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268184.461975; Tue, 08 Feb 2022 11:10:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHOO3-0001m4-Bc; Tue, 08 Feb 2022 11:10:19 +0000
Received: by outflank-mailman (input) for mailman id 268184;
 Tue, 08 Feb 2022 11:10:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=v7zX=SX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHOO2-0000sB-7B
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 11:10:18 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b23fbe26-88cf-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 12:10:17 +0100 (CET)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2059.outbound.protection.outlook.com [104.47.13.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-5-XNIXGx2OO7eWKzfmhRytew-1; Tue, 08 Feb 2022 12:10:15 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB3103.eurprd04.prod.outlook.com (2603:10a6:802:a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19; Tue, 8 Feb
 2022 11:10:12 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Tue, 8 Feb 2022
 11:10:12 +0000
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
X-Inumbo-ID: b23fbe26-88cf-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644318617;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hQAWbIZUu8I/Hw982BplPrZjsb5S7+IUbxdTD8OgJ9o=;
	b=D8lYFk+qNYdP/uJD75FF4AtZfCy+obGGv7xngrSVa1LY3MUK8we2hq2sHagbVcCeyKBE1Y
	BEY9FkzxgK69R2nS21WLW5RmgloHdbj84MfzlZotICA99pLjTtyso6dYBJWV/ox+YkQndK
	btRRxRKKNCeElyT7zJTc7lnEzqjxEUI=
X-MC-Unique: XNIXGx2OO7eWKzfmhRytew-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3ucAqfwruDyvhQt9vChILajH60PEkpxSvWbCiGj2X4EULUOKSJS/Gad6aGrIby/ywhCSd1XCfKBgW+ssPnCXGwl3wsqNNgZDciWVfVWMxrHudB2JjRnqhHQNZGx++Ob785lbwKE0ucKhUkBt0Q9P8m1Ix4YJPVtbU/Lc0tzFx37lTC8ADn09mOtjvFGoQp4nzBX7DxNWOSoz9/s8nEeGLfdDG+agXEgZlfLXcj1cfigY8ebM6V9qIWVqkxbJtODAuMBUL8lLJmrf/XvMowmtKale8S8Ea09eWjQ4IB4kD3By467NQ+nWssrv77TGgkvjuxJO6UVk0nDYrjqPS797Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQAWbIZUu8I/Hw982BplPrZjsb5S7+IUbxdTD8OgJ9o=;
 b=VTmGoz8tf/dxQUb2vOXnrQoM7QgDABGSq8t95Wju0JM9sLv79YE1EJzx6BulBvz80e9Ng0S1Zo2Pb7SQteAFz89cUQwJ1C0UOmWSKS0p3ovPeE2CQ6yOrv5ggastqAiUIsFQT/2P6U/6Pojibl7rSEVVMvt0b/UQLqsG4tdRPD/BJywEUue4yTgxGOcBDshFJW3r5xfkFUuLoZIwpTCxmSg3TrUWy4AsQbQcYAGdYjfvvdEQXwUPUuBV689mN1uD1ikQDXH0v+yWC01YZEELPAp5UpX47KiGZGyzGWlJuii76xeXK9LsZur+8T94Z7EdNvESxEZYeeR+eNePqEfnXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <87559a9c-d459-e0df-cd89-6371f45870d2@suse.com>
Date: Tue, 8 Feb 2022 12:10:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] xen/efi: Use PrintErrMsg() rather than printk() in
 efi_exit_boot()
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220208105211.96727-1-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220208105211.96727-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P194CA0003.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::12) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f61e991-a7eb-4752-834c-08d9eaf393af
X-MS-TrafficTypeDiagnostic: VI1PR04MB3103:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB310395E6605A6BA95EEBD5F3B32D9@VI1PR04MB3103.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	svn7FIvHvwl9YCN5LSoDQmIhpY89vKfDGhukri8OQF+drjgLcW6ygloyKI5aRqJ1yoHtzoPxgfcbF9bsvl+3WjhvblbYrGzp0DRXGknYN3An/2hadEZvKmTBkdEgVcQw8z+BYprxXAcylZvvb7IPlfrCDDmR/s+NR+AMJmGxFMJZpcTaXh9RqVjWAompzIGFSEIkkI6U3XW+YNReH6iWA+jBZ00WcqhIvgH2q1hrEok9+STPWxYpXhNtvJ7IPkoR9e8gTr2oHLs42udMESmkuGmku1kbzUjXPjd44TdxEafhiSr6RWtLgBGjXwToULbt28zWnQDv4DrnmMQffsGwuCoBFBMOEa5ZP1929gOLccfAzCkrxz/GQw2hTpvXaYGjv5bTT9DeC2D2qUjY7WOM0w8v71uq+BDjv1lz9T1UqPJP/QyxakN2yxd2mfqqUfFGmQH/hwegxa9gwarlKxQQcFxVGeIeECn3m3LpfVpeD9iRpA837f8RmKgJhXyFRdpn6HsNOfq2idxf+1QqMaRG/arwsopT4MYK6KNrVYbisMi+0w0K9r3OQMlnGa40/tdGVxyZw9C5ediVm8JCKoi70eBREvIAziaGvXFhqcNNRpoP5Pcr0B0Z8jzf99rYdMCFv8a6XMg83laiGwrKYdwRBirHKUol8FAleo4XWsAPLxgiVFd81KIz4SWqRpeN06F6FPFcMZ6BaQlLcUEKPRP1LpfbCg931Ewv3srA8XuLtGE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(31686004)(53546011)(6512007)(316002)(508600001)(66946007)(2906002)(6506007)(186003)(26005)(5660300002)(6486002)(86362001)(66476007)(8676002)(4326008)(31696002)(36756003)(8936002)(6916009)(38100700002)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VW5LQVVvTHpRSmQ0N2RNVHdjYUlNZmduZ2VzYVJCaFRpZFMwNkJZYXQ1SlZi?=
 =?utf-8?B?RzhTQ1I4ZnNtN042VS9FazZvekdXMExnYVByWU9VK010WWx5RjZYM2hXbGg2?=
 =?utf-8?B?TnBQMEtKdVlkOHlQSlFIc3ErbUo3VTBXTElrajM2cTFkalFMTVNIa3pBRExy?=
 =?utf-8?B?TXdFY3R0Q0VCR3RpYmVSYmtLM1A1aC80NE9TNkZKcEZ0ajhVcXZFUXZwQ1ZY?=
 =?utf-8?B?T3ZTeTdueWVic2ZLOUtheVhzUENLVkJmc0dCcEt0OGRIRHZYK3U0R1FwR1o0?=
 =?utf-8?B?TUZwOS91U0FEQ3Qrb0QvVk5UZ3kzU2VHWTYvOVZVdlZUM0l3bUpRN00wa1hD?=
 =?utf-8?B?S3dFa0c3Vi96YXJiZmRFQ0FGbklwNHF0cElDcGJmbERQeDhSMFlKdFg0ckFN?=
 =?utf-8?B?ZFpEOC9nVDFYaDNiaVdaRFgyM3pvUllBZWh0MStncTNibHBnVU94N2tCd3Fm?=
 =?utf-8?B?cjFtRmp4ZFBqWDlaeVBGaFBsNEtoTWU2Vm1WS015SGlxZWNKdkIzTEZ5LzJj?=
 =?utf-8?B?bEtXR002cDZ5SkZ4VVhXTEg2eTFCcjVrblRhVFRzN1RJVllKRFduWWpYZHZm?=
 =?utf-8?B?MGJNUXp0aThIYmlUcHhyWXhzM2J6Z2RLNkpMdkNLR2xPRjBpOHM0RHYvMFF1?=
 =?utf-8?B?VXEzZGxxSUtSeUFwNkU4V0tRclIwU1JjTGtIcUtNMVVVd3B1NmVNMEFXMTN5?=
 =?utf-8?B?dnNtb0hEajlCNkk0REtsbE5LbENaUGZ5VVdSRmFJYWxZSGVyaVZLV3o1RDlR?=
 =?utf-8?B?UW1KYzNDUGdPdXhsMEFrZTZtc2I1RUl1eTBpSGNWbVNJSkVQRjljU05YVnZl?=
 =?utf-8?B?OUIzNUhVaDA5WEN3T2pNaVQ3MHBRbk9NN056Y2pDdlhtZWk0WmsyTTV4Slky?=
 =?utf-8?B?anhSR0NWTUtnNUp5TVVYR2lGdXJFR3paMHRacGdYcXFPNnp2c0xlR3l4Nmwx?=
 =?utf-8?B?U3MyODZUK0wzOVM5RUpRR3JBa1ZKTGJTaEVnbjJBbHFZc0EweXcxS28vMk02?=
 =?utf-8?B?elJDUjdBKzcveTJxZjVXS3VZNElIbHVMci9Tcis0Z3JFRlVRN0tTQmFmYXJm?=
 =?utf-8?B?bkRLbjBtcTdkclJ0VXlvK2hVTnA5S2lHb3ZmRG9TSlZDZHJkMll6NmNhb01n?=
 =?utf-8?B?T3ExWTRqWWlBTzMrSmwvKzBkNWRpRXYwSmtCZzVmMW40V052NVp5Mm9JZFRr?=
 =?utf-8?B?bnM1eisramdRR2xzenIwTXROUGlKYVRBTUpPa2Jpa2RnbWxNSTk4R0ZxWkkr?=
 =?utf-8?B?SVcySENXcnY1N01BQ3RsVGNHS1lBR0VTOUJzTVJGOFpQMXl1ZDRpRHkyQXhp?=
 =?utf-8?B?cHpuT1lxMi8yeWdvN1FVaG5WS0RLK0RGTnd1eFY2WTJEb0NkUStjdSs2eHBN?=
 =?utf-8?B?SWRoS0tQSDhBL0s5WkZOL2o5bWNXRXNSVWY1bXIzR0R6TFl0OXlCVEtSci9O?=
 =?utf-8?B?Z21uZ3lsNnRodHNJcUNweXhlSC9VNXRYaGtDMkFkajFTWElEYTVEMTlrT0Y5?=
 =?utf-8?B?Uk1ZeGVwK3JUaFpXN2M5aDdvcWJ1MmhIalN6TWNXZDFtRCtVN0ZVQVd4R25i?=
 =?utf-8?B?Z2s1SkZSSUJJaG96KzN0akY1emZxRm1ScWtGZEdlZ1VidnAwSVdBN2tXa21p?=
 =?utf-8?B?LzAyREJnRWY1K25oQkNFbjBlbHUrRzBKMlRXRkRxTlpNRFIyUlZQbEpxeU1P?=
 =?utf-8?B?ejE1RVFzWGZwc2Ztem4rVmNhUzJQSGVWdE0zczhMT0F5UG9kcXowb3dzYTkz?=
 =?utf-8?B?MVBGVkJLMkNLOHVqQWlLVzF1V09ISjJyL1p3NEZyNUJIY3VKNHVnWUw0RTJG?=
 =?utf-8?B?RVl2cnprSzVOK1dsV0lRanloQWdLeGxqSHBBbStXQkxUTzEvTUw3YkxKdDl6?=
 =?utf-8?B?UHQ5UXdVaEVQZy95ZWh4eGQrdGhmZnlRR2xuc0JmdWoxdlQ0OHQwTkNacWQr?=
 =?utf-8?B?NEhhSVdJMVgyYUQ1RXArbjJ2aU1remRIN1NabTA1QVdlOGMvWWlTdlRBWlVY?=
 =?utf-8?B?dlVNRGxJY0ZRaUxRRXU4UDJCOWx3RW1sUnlqVHh4T1VUdWZDQ0tQTStiMjdI?=
 =?utf-8?B?aGRyU1hrejYzOHFkQno5Z2Y2ZURLWXVmdjlsZVNyaGl4bHdJMVRvZW8rQllK?=
 =?utf-8?B?c1Znd2lyT0ZEaUp0andjUWU5QU1uNGxnVjZDR2Faem00c2J4VmREZWh5aHpq?=
 =?utf-8?Q?H6Ky6nbGtsRbLfY2UDW2QNw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f61e991-a7eb-4752-834c-08d9eaf393af
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2022 11:10:12.6278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fQhuYoMNUXwDlD1ztBbgnfH2Z5GpvU+5RTe7SXYUx1sL6aUvGJeFSGs8wGoeVWHzXfjFUNvMnLOarGpw24nwUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3103

On 08.02.2022 11:52, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> The function efi_exit_boot() will be called within the UEFI stub. This
> means printk() is not available will actually result to a crash when
> called (at least on Arm).
> 
> Replace the call to printk() with PrintErrMsg().
> 
> Fixes: 49450415d6 ("efi: optionally call SetVirtualAddressMap()")
> Signed-off-by: Julien Grall <jgrall@amazon.com>

I think it was intentional to use printk() here, so I'd like to ask
for more details about the observed crash. That's also to try to
figure whether x86 would also be affected. The problem is that
without serial console configured in EFI, the output from
PrintErrMesg() is going to be very unlikely to actually be observable
(on the console), whereas the printk() output would at least be
retrievable by "xl dmesg" after the system is up.

What's worse though:

1) PrintErrMesg() invokes blexit() as the last thing. Yet we don't
   want to prevent Xen from booting; all we want is to disable use of
   runtime services.

2) I'm not convinced you can use StdErr anymore after ExitBootServices()
   was already called.

Jan


