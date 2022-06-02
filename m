Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7DA53B708
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jun 2022 12:26:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.341033.566201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwi1Y-0005Kp-LM; Thu, 02 Jun 2022 10:25:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 341033.566201; Thu, 02 Jun 2022 10:25:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwi1Y-0005J2-IX; Thu, 02 Jun 2022 10:25:52 +0000
Received: by outflank-mailman (input) for mailman id 341033;
 Thu, 02 Jun 2022 10:25:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4LFK=WJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nwi1X-0005Iw-5c
 for xen-devel@lists.xenproject.org; Thu, 02 Jun 2022 10:25:51 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5f436a06-e25e-11ec-bd2c-47488cf2e6aa;
 Thu, 02 Jun 2022 12:25:49 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2059.outbound.protection.outlook.com [104.47.14.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-45-4dRvOHWmMpKteXhH0kiE5Q-1; Thu, 02 Jun 2022 12:25:48 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0401MB2521.eurprd04.prod.outlook.com (2603:10a6:3:7d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Thu, 2 Jun
 2022 10:25:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5314.013; Thu, 2 Jun 2022
 10:25:46 +0000
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
X-Inumbo-ID: 5f436a06-e25e-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654165549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mqi+JSWlfcglnSGg50ayVBnST8mkBeyG4Xv1EP4vmCk=;
	b=JWIerWVzX8oDPuPPg0LPGVC+X74WtfuSiKC6H9zJacWaPxxehTNHfQCdAdQL/jtiqIjmZa
	tfVzCFLYVO6h+YWehTYJGt9eg3a6rAkzn+jHgUBl0nBML8jD6dDYAWgM0F8UOjlRRaxZb9
	GkjM1uUOzmSip9rqKARuYm9mu8XUvQQ=
X-MC-Unique: 4dRvOHWmMpKteXhH0kiE5Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTAw9HgBPlNMJ5aPn6SusPnedpGzku51HcJmhAu1GkfLqxFR9wLdpHTpnwSGBwHZxaVqS1oncasjXXjpwHZZQYDy/3V22tVv3KaxltDgsOl4h8dEgHsGp+sRIvotWCFyyuLWYsC5baboSOc8q+Q5IOvNTFdhX+7CNhi44O1zcb6sBGSjO6qU5fuP5ZZiRxpnWhztfhmtsPuZHn28ceJVsvGYWntV4nsbK7CPpp+jyKpmsUkJxiik5+v/XeIN9+mKgne/z+hsZL8PupYEov+xX8z2F2UPbTKpfWKs/2qAwWoixxsZO/l98K+lIYrBrVlDqKzfeAuBf+Urixo3tbAlJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqi+JSWlfcglnSGg50ayVBnST8mkBeyG4Xv1EP4vmCk=;
 b=VgbIhjCL1qmNxubuUNcUFoQitHU+G0fefHsjLfseV9xAq0eKnzcOlOy0jgkF3pnZNMBGezI+90Wpf5p4ryzTa0E6xIcTv+i+4Axq0lG514hG9nY0jFdkJzdCQtLSx3KLKUE0nvozNdXOymoamW2Isx6RbhcWWEr5BjZkG6Lp75lNttE9rsOPadaDNXSD3qNUrBHs3gS2iPEoSLDwv4gAlomUpPn7LfdJLMtYKXrcAnaMn+n/1E2JRX6LFXdTla+XzmvuTsI1Cy6b7pNnZQ5m7QnQoD3NmkZze3DNqgs6YULkZbTlDojvfOq9avfMiFpFrmfw/3y0fwMQVUdBRe+Qqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f8cebd1c-1679-7b67-c43b-8c0cbe8ffa52@suse.com>
Date: Thu, 2 Jun 2022 12:25:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2 0/2] x86/mwait-idle: (remaining) SPR support
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0201CA0009.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b78ad57-170b-41c3-8b08-08da4482413a
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2521:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0401MB25211F48CF9604549A565D87B3DE9@HE1PR0401MB2521.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gh8Q41OkS5b7OjWrfkTpTl6jSmaI4KTi07RfDEgoPZZssCnTrkl3JxaHgKcDs4RxMSFM9KRvHMfx+76EatFy85KGR5lz94TPrX+RxBDWds+c6VThopKzWxIgkdErMAB7R/1GftTCuPtUM/8eaSyS1QolnQr+utJb5lRVW9rdqzrbK269shW7mUWKHCtx+qc8x4A0ucqyPA/n+cmf7bUKKB4Cxfm6iYXitfM9MPGRRaqQi+e+FZjo1mG/c+YzCnnyj3KB5TuO2DLzKhW8nTNtNzfDkGD5cVBaXGabQKVB0sCEw8qyVeNivWyoSyNxlF6sE4BAdvkciWiuZYdQWHrQvr5e+bzYBjX6+FyZddBKJ7NNXoiLRkVJq5Kb5iOARGMtXBYlwr8XNG+vV3JniyMdlyAMYFwJC9tS8iXAouJ7ZjMyc32awh9YFq3u+3UKa7JF4o1qre/NGs3bwO4eoH4v+VLmZhrRqpuB+o2tHexH8AMqPd4gTpsBAOzr36lPUQxiBOeL5/2XEQJWp8qGw8Cvr8UcIYVPtQsprXV0767FDtOq8/c3pIi6385RtLBec7e8521nD/jiRvRPvtzlx4KdGvN4jlpEPs93yEI0J4BedQk6qlu2Qvs1IwQrMrzo+I/vAqcZGwihKGZRz6cuUfaZH8zoURUmiPvqIpRx+Qt6shI8TnYGEaiJksYgZDRMR6KUfvemoNrCyxDEmIUkxb9kJygX1W2KtEnfdzXqH8heTK8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(8936002)(66556008)(66476007)(4326008)(8676002)(316002)(66946007)(54906003)(36756003)(6916009)(86362001)(6506007)(31696002)(5660300002)(558084003)(2906002)(31686004)(83380400001)(38100700002)(6666004)(6486002)(6512007)(508600001)(186003)(2616005)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUZqb1hyN2x1a0E4VUlDLzBJVTd2T2M1TWpXSFoxdE9nek56RTJQSElsanJU?=
 =?utf-8?B?SjlwWCtSbVR2RStjdFN0Tm9WTm1lcWludmo1alY3UDYxYmkrbVhqbnk0SmFY?=
 =?utf-8?B?Rm5NQ1lBQjRFdHZhUFlkZ0NJOWZWVUpEaHpvckJISVJ0Wk9rU2RBamJsWVlT?=
 =?utf-8?B?RXVldjZZYnQ1eEFpQU1ndmppUGJoSnA0WnFOdGk4Y1BDVXphaCtvditMeEFv?=
 =?utf-8?B?S3h5Zkhyajc1czl2WHNxMDNORkNDaW82NWFMUXpHRnZla0x6TWcxWjhualFa?=
 =?utf-8?B?VmtJVlUwNlpUM2dMRXBQRDFYdS9ta0NXb3hGaUgxc0h2a3FCaFpBMlF5N3BT?=
 =?utf-8?B?bC9OWmNmbytueG1FY2lsOHFSWlZQN3FMRHZrbEtkTE14VzBDdDh5eEF4SU5O?=
 =?utf-8?B?VDN2dVhCM3d6bDdPUkZNeEhqK2Y1RHdJem5iWWh0OEExL0NXWmxFTHQ4RURi?=
 =?utf-8?B?ajRHY1pjekJKaTBraFordXBFZTQ1Z1FvSURiWVZkd3d1WHNyaExqcUE4djho?=
 =?utf-8?B?RVJLUkJzSmdka0ZZcVB3ME04RUgxbkNJV1EreVFsWjZ1RzV2SllmR3pHYnd5?=
 =?utf-8?B?NHVaTEN1V0NxeXlaRVFzVkFmVHN3bXhyRW1GS0R2N3BNTU5GS1VycXhtbnAw?=
 =?utf-8?B?NTMrR3h5WEZYT1Voc1lxQjlES201K1dDUnBhUjgvbXB6OTRpbktKdmJaZ3Ja?=
 =?utf-8?B?ckk1VmdCMlBGcUVKSW1rMS80V2hPZzVXcnN1aXR4dU90eTM4bktrN3BiN1c3?=
 =?utf-8?B?MFZZd0Jwdm1YQVhQVjFWcFhQc255SzZUWFRHNVNnOUlIUmdlZlRSTU1VQ0pL?=
 =?utf-8?B?V3d0UjcwdFg2a2tCUVlPUnBycC9HSytHbkNrWHROODJqbnJPSDBlOWtsT1VY?=
 =?utf-8?B?SGgxWUlTSUFVVXdZZ2pLeWFJcTF5UksxcEgrS0lWYTFUa2ZLSzBodEJ0MlJq?=
 =?utf-8?B?RU9YM0pBSDFnWnBLc2pKYUtXQ2RHYk1KOUVrdHIvczVWKzN3dVlxeHcrNDdy?=
 =?utf-8?B?cGdKaUdNUFZ1dWdNSGZNODFYREtoT3NxdzNicUZuU1RPLytUeG1EeFBPMkk2?=
 =?utf-8?B?eTVsN2pDaFJlTWtBaHJFTGpIWEdNRk4rbEJPRDVTR3NIMERoU1ZITmRENXln?=
 =?utf-8?B?dGpJaURRcy9VajZhU2JwdmpuY1RtWFdtVUZOVnZHVTMyS1dYZ2MyczJ5T2s3?=
 =?utf-8?B?WmxuQitPaWp1YXlWMnF6dE5nc2pVeHpPTDY0QmxMMVQ1ZHhNby9FUVlFbXJ4?=
 =?utf-8?B?VFBZanRyRzRNb05CTUYrK1plUXVSRkp1aG9jOTMyZ01jNVJrR2RIbjdmT1NQ?=
 =?utf-8?B?eGZRUWhyNkdjeFRHUmR1bGVZaEZvU1VCRWFDTjB0SW84ZFB6TDN0aTB3aENi?=
 =?utf-8?B?Z2kxcFdtOGZ6am5oK1pOdTVHWUNZeWRXWGFQS1dnNzhUdmpyNjR1bnAxeWFT?=
 =?utf-8?B?QlpGK2Fla3BiUWt1cDl0S1ZYN3pDT0hRaTI3TjUrQnVCektzcTd3djFrdTJD?=
 =?utf-8?B?WlRuRm9yZjl2dlJ1bXJrc1poVWpwK2wrOUZ1NVY5Y0tkWDZmUVFuWWNJNGJX?=
 =?utf-8?B?cnVpK1N6aHBacXFxYVZnaVNteTZZbHNJRzVvV1I3WEh2WnVkVGFBc0paRndz?=
 =?utf-8?B?VVJ4U0pXak9xR21MUHNWM2EyR3d2YWZweGt6WGMrekZnWUtvNXFzcnhWRGRO?=
 =?utf-8?B?VE1wMnl2YjRhMTlVN1pXc3JHVGlvL0dWMEUyaTJPbWI1MURHcnFqYzFNSFpP?=
 =?utf-8?B?OTQrNjNoenI2SlNQUWFuS0NoVG54d1BUbTd4Wm96blJiZFVDaitTNXQzM2pw?=
 =?utf-8?B?YjM2UXlncExZTlFtdWtVNGlJazhnYVJhemxFSHlyNTFuNjdSZDg3MVN3TTRH?=
 =?utf-8?B?SW1HMHR3NTY4aEFJbXM1blFPQkZLeTR2dTFuNkFQMmZKRTk4bEJxTWtVdytR?=
 =?utf-8?B?WS9hZVJjaWVoOXFBOUJJZVdYZzdOTlFyMUVvalVmVEhENjFmSE9sRlhTWE9Q?=
 =?utf-8?B?dFgvUmNnbUJKelFHeHZvcDFtR29nRFpoLzEzUnV3Q0FsNUNjeFRNbVpxeXd0?=
 =?utf-8?B?WFVMRVJXOWJxaS93UXg1VmVhWUtPUmx6djR4Zmw0bjZKVUhHKzRmUFlieU9j?=
 =?utf-8?B?YnFMcTg2SjJma2xNblFBMTNZOEpMS3ZuSFEydFZZSDB2VjJ2ei9GaTh4cXp2?=
 =?utf-8?B?MTAwRjdTT3NaaWE3WnBiV2poSDZHUHdLYjlnaktDUjI2TEpOYTcwUXBnaGtP?=
 =?utf-8?B?UWw4a3ZGUk03dHFXVVRRSjdZWkZhK21PdCs5SGZTZG9QaGFaNHMwaVk3NGR1?=
 =?utf-8?B?RFBKQXpXQXFSU2lQWXY1eWZMSVVxeTB5S2xha3h6clUvcUxIYXpKQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b78ad57-170b-41c3-8b08-08da4482413a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2022 10:25:45.9170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Io0Uo48LeRPYF2qwHvpXHGUflznvIsbFhfIhqcuKaF/Gh/dZhP4irha/sGJKFtv/6wOYg3rqL38s9gYmu8a0Zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0401MB2521

Still pretty fresh from Linux 5.18 (and with adjustments to address issues
noticed while porting.

1: add 'preferred_cstates' module argument
2: add core C6 optimization for SPR

Jan


