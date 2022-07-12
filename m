Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D59572055
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 18:06:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365831.596168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBIPB-0007WL-2J; Tue, 12 Jul 2022 16:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365831.596168; Tue, 12 Jul 2022 16:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oBIPA-0007TK-Us; Tue, 12 Jul 2022 16:06:32 +0000
Received: by outflank-mailman (input) for mailman id 365831;
 Tue, 12 Jul 2022 16:06:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n9Yz=XR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oBIP9-0007PE-JN
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 16:06:31 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2057.outbound.protection.outlook.com [40.107.21.57])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97457bbe-01fc-11ed-bd2d-47488cf2e6aa;
 Tue, 12 Jul 2022 18:06:30 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB5312.eurprd04.prod.outlook.com (2603:10a6:803:54::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.26; Tue, 12 Jul
 2022 16:06:28 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::60ad:4d78:a28a:7df4%4]) with mapi id 15.20.5417.025; Tue, 12 Jul 2022
 16:06:28 +0000
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
X-Inumbo-ID: 97457bbe-01fc-11ed-bd2d-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0MN7PLS2AmEUQyyfCfJ8K1kq43lsXZXzjP51VHcKZXe1OqdYkZy2vxAuwniwXCHj4U01RTfAh1P+HoLdhTf9JVnTA/2yWk3bq7FCupLZyu4nNDX62irPp7IzchuTR84w50OsjAq6ybAif6BR7Ri2EaGSaNFnA0LSiTMYkZA05cowEmGI/xJjAXdkmpGXH1YmPaT5vLE8vzim4fEhMasiThkkaUItPakIbTUxPiGmdLy8N+Z8Nlvskvb+p8mxnSBVdRYnXksIGpXN4JR9CTXq/uSoCkWpgFLMlIKBYMbP0J9BLymnlZzc/qJpaC7JMQuXoCViEaaJ6Q9fapxByKsRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZP6fa15XvoEgGF6rY28POJi8BYMre1S+CRD4KJ5VnmQ=;
 b=CXT56dJ6UtWqa1cyuYzOu/qYPilD3ZdoNjAZ+HGJNaK8pfARB+shZnJyHzLGK0ED34H6qC79LaksjABBlKIV8YOiwql41fMrAZE2e5qrFxNMH5unONNPaxe/oco12WxG2s7KC94oYKnuwmN1XczZhwEejXw+iJoG/PO1Al3xn53t+3k3HrrTmGuFQKfGDHIGyjDF4ECsyvW8k4epV/vr52KuweFf1jztfvKSjK/h+4FkW/fkdk09cPfqVeqxlaz8ub1AtAMNC2JCxoDFUQVggJNsUg12uBJ4dFo/ef7gmnq9EFMybhn4Uxkrua6K5XozNFk/A1nN2SRAFTQ/IH09UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZP6fa15XvoEgGF6rY28POJi8BYMre1S+CRD4KJ5VnmQ=;
 b=hJRWmDTzZ3QfskTqQlQgUO455Bp3IxLbFxbDJwg6c9itbJRgphuiTTKTGb0KBM0it0/kADCCoMI4fMuiiu1I33g3ShnpGHhPkaEh9wWZ/KeCZNyUhUcn63Z+eNLvljFQDECeVS+bbxErnAkiTfpvetlAZsqb2eTvT8gt653aSCaEzb/10IrHf4tJpNg8u5gPFiU47TdAKPaB486nqd5j/rWGRx26olGlhwZTn/bEov2GBRY4Cot7g1GDvWXLa3S/b1dG2+yJYMfA/GqvitlqDv9C2OajUTPo+qbZRAxkfDto1wJYPzRumKWpQodYKzfipNENSMFVw1iOi0NZMXk99w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b383f67b-33ae-671b-9eea-4ae11c26884e@suse.com>
Date: Tue, 12 Jul 2022 18:06:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/9] drivers/char: Add support for Xue USB3 debugger
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Connor Davis <connojdavis@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <80051b9dc5c99532e18a10a941c3523945d77698.1657121519.git-series.marmarek@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <80051b9dc5c99532e18a10a941c3523945d77698.1657121519.git-series.marmarek@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9P194CA0013.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6b44fe5-c127-4d70-d3a2-08da64207a3b
X-MS-TrafficTypeDiagnostic: VI1PR04MB5312:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B8e/GYklWWiwvKTia6oBPhJDKNBUMh1j1VSVyIxiu5NgH3l7msq5twhZGNKBWnArJa9GlLkQDZOoGJiXLQ3hzFHRxj1nvl1I0bt3DlGA7LV78Lzz4Xcr386I9QjAdbQzdDZgpZKfCVEL8e77vRpTlEvXVVW8DZtMTyxChadmtgRR5twGjLq3ZuGRtAvgobnQjqpopYUFnosr5VLvftGnOMcxJglx5KIBQXRoKrpQqQu/k5hcquCCH3SJPb22+pJo1pwoNQONP5yvmFvvDAnG2w8E6Qml9+Nn2qYtffKsfl16SjCpVKV+wuegFMGd8r6msboGSVbCfaSN1Baz702EJz/KoB9jlXeNLl46nF9tfecRj9JFDbnfPBsJTn/7ATirGB8g6AGoSmiWSIWkzQew4nKh4F2XS3Vm01GmVPB04zXRNexCCpb12QjvOKYNB9CqKhFiEW/H/scwYGtdcMkIM9N51FV5v7tZRuSzlcsWN5MAiBLCWWwlUw7lRxD9RGZFic77foyF1E8E5f6hfNwYddoUa5LMusDQe1AKmkC/ZRHcZohzBqq+k8iwtTSS/X9aqo4SK1AwtTpGRtZj4yN0YqhUonxg65UDZir0DlKsmA2pYRU26hYRHi7jqseioJzrLbeoFoOWVng8/RLhtR52CLtBHG0kG+K27GppKjNREG8apUM1UfTxKSYgYBQr8EpPCaS5ZjSGnBu7IgSjuhZcrYjKFMKTSYamcds97QzVkWuaxuD5Ih/m6N94VMTebhjq9W7O8zbJJ5gKD3C1gX1mYThJuPtb7ZI9JV5hMXoDOL7SG+6+kI5RQ2h8ZhUJEdsNJAhzvVsH7Dym27dSgyxipOWuP6HlVayBbfYhay3TkotTH9O2z8zQpDwrFiY94WXd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(346002)(39860400002)(136003)(366004)(376002)(66574015)(66946007)(186003)(6506007)(2616005)(66476007)(66556008)(4326008)(6512007)(31686004)(8676002)(83380400001)(36756003)(54906003)(53546011)(6666004)(6916009)(26005)(31696002)(86362001)(316002)(966005)(5660300002)(6486002)(41300700001)(38100700002)(478600001)(8936002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWNBOUNuUXAvZFJCR1pMdkF3UEEwRm92SXJPdXluYkU4TFpwem5HYkV0VnZa?=
 =?utf-8?B?bHp0eFFQYm1QZFhpbHRPcEZtU0hHUnhPc0VQRFFkbHV6T0lrVGlac0xKL3VS?=
 =?utf-8?B?UCt6SmhzaVR2NjMrQWpuaXhzYmV0NjErMWEyRHhQTW9UWHlndmRTd0xQN3I4?=
 =?utf-8?B?bjJORzc5MWQ4YTE4Y3ViOE9ia2N2a0M2eXlQMzRCOE5ZTXpnd21NTnR2VzIw?=
 =?utf-8?B?K3lXd1laUm0xaDFiTktMaUFlZFR0QWM0QjZLUW0zdGdZYkxWSW9zeFZucm5I?=
 =?utf-8?B?Q3pBZ01WMUx4MDdvaEwyS2Q2eXE1RmpJQjNlQW1BNWJkVFgwdGNERnZWRGdk?=
 =?utf-8?B?Z0YvVTFnNHF3UGJVSlNCV3F5azdiTE1wMWZaeTJMYzBISm5ranQrYVB4Y3hr?=
 =?utf-8?B?WmkyRGszRGxKZHJzSXIyZDY5MURKTUp3NEFId1k3MlJ4OUl2OFg5ayt0RWND?=
 =?utf-8?B?MFl4bzJublRCNmZ1NHFYTjhpVFB2Tlg2OExkWU5EVDVuTEJqUmpuQkNJeExR?=
 =?utf-8?B?UWIrY2FULzFUbC9YTjVmVWMrSzVCeVoyYUxPMWhkSG9GSWpXOGFNV3lMS2Fz?=
 =?utf-8?B?TWxxQVovNVJYaC9ybmRoTG00NnR4RXRpajFteDNkTU41ektZSlRQRVA4eW9a?=
 =?utf-8?B?NUZacTFlRmpBTEdwdW5aMllnWTRPVkpIWkg1cHJkZUJXczZQdWdWMGlkWllD?=
 =?utf-8?B?S0c5bHpSenc5aVNjOFZzWnZWVWNreGJCdUpZaEprdGZ5Qm1FdkloRGJybFBG?=
 =?utf-8?B?THdjN3lxTE90ZVhvN1ZhNTNKK24vc2hpSVhwQkxTNVhwTEVPcS96MGtsc2lj?=
 =?utf-8?B?VlJnU0orWjNtQW1obm4rUzBTOFEvTWNKbXZ0RDdVRkR1cTFHeU40TWZLNXdH?=
 =?utf-8?B?cXBFWi9IY0hqejlHMWdPdy9ROVU5bUxIZ1ppS0VES2FVU054alBOMjJTZFVQ?=
 =?utf-8?B?S21VL3ZYWXBDenZhazJnZXgxWlVJRFZZc2dQaWlqdHR2ZXpvVm5UV3JYTUZH?=
 =?utf-8?B?NVM4K3RKbFE1WHRNZmsyTTRjaTRtVXJuMFUvNVZTUUpUYlhJUWNWek9panQ2?=
 =?utf-8?B?V0MzZHBsS0lFQnhVK21pMFRRNDI0TUM1ZFlIQ2M0UnFEL2VPUDJBdS9BVVhM?=
 =?utf-8?B?M2h0MlZRVDVtaTFTWW4vWmpRSXdWWHVibms0R2xxRHpTTHZkM0QrY0FNQ2tG?=
 =?utf-8?B?WXhZTnhBcng2NXQybHhFZHlVU2xXMzFNazlmSUxyNHJYMVNPaXNLK2QzS0ho?=
 =?utf-8?B?bCtFaE9ObnZUbXJBR3BORTlwWWQ5cGYydFRxWU9aUFRvK1ptVm5GNFVaRXNF?=
 =?utf-8?B?MlZPMk05QlVFdWV4RFR2TE9sV0l5NjdsOGx2TnFzeEVTMCtzbUxPa0JaMWlP?=
 =?utf-8?B?NE1TcW55WkNEWFBtNkpENm5FUWUra0Q3K0d2U2VMSlpaRXIyL21pTUhobXA3?=
 =?utf-8?B?WXphc1VWYUpxalJKTkdZSmdPYmFvK0hCK3hybVg5SldsZno1VzZ2RWFraWp6?=
 =?utf-8?B?UVIwNkFjRmdFcFRsazZvVEF0TDl3aVdQT2NXakNjVjJmbVFhU1JhY202STRD?=
 =?utf-8?B?cERFbjY2akxSZ0ZLZkkxMm0zQzgwSHV1UnhBdE94VGtmOHFNRUlnOEY5VTJs?=
 =?utf-8?B?WnlUNmlWSTdLKy9UTjlvT0xTdm9hMEUzN3plU0dGK2pqS0ZKZmFNdFYvVSsx?=
 =?utf-8?B?eFgzczJSKy8xV2JtUndQcEZSQzlJSUpoL0tNL2xvaXk1YjJtQjFwdmYvam8x?=
 =?utf-8?B?N3FnNTM4OFM3YlNnaUs3QXR2dnBZYWxaeTd3RzFmYzliNzBRVTM3NHNtYXN6?=
 =?utf-8?B?R2JISDRRbEpmV1YyM2lrQ0dUVXV6bktqQ2xGeXZCdWRBTnJYWE9qNkxYTnR3?=
 =?utf-8?B?aXlVQXhib1RCT0NUS3RoNjRDaVhNajFNY2RWYjVob2s4MHNUYzdqbXZyVlVW?=
 =?utf-8?B?VGdwZmhkZU1aVkc4a09LL3Nzc3dDQ053Q3JNSnVFMHpzbXppL3Zic3g1VFQ3?=
 =?utf-8?B?c1VHRldVZ0xITGR4SDN6RmdrQXlQbHVaOWU1QmNEbFhDVHdYSmZlazc3QkRV?=
 =?utf-8?B?MjFNanpLNjExKzJVVWtBL2I5U3Q4SXowY1BDWFMyamxiZ21RUUlGLy96L2ti?=
 =?utf-8?Q?UBH68Hy4cCosWD3+3T6P12Y6A?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b44fe5-c127-4d70-d3a2-08da64207a3b
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2022 16:06:28.0068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bnj2K6cte+KfdFr2EWwhOuyhxyyNXVskZD2g1qjWUxHtV4ccHZ+m0o03WYsXsnGBJF2zBsMsPhacr+XA1J0TDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5312

On 06.07.2022 17:32, Marek Marczykowski-Górecki wrote:
> From: Connor Davis <davisc@ainfosec.com>
> 
> [Connor]
> Xue is a cross-platform USB 3 debugger that drives the Debug
> Capability (DbC) of xHCI-compliant host controllers. This patch
> implements the operations needed for xue to initialize the host
> controller's DbC and communicate with it. It also implements a struct
> uart_driver that uses xue as a backend. Note that only target -> host
> communication is supported for now. To use Xue as a console, add
> 'console=dbgp dbgp=xue' to the command line.
> 
> [Marek]
> The Xue driver is taken from https://github.com/connojd/xue and heavily
> refactored to fit into Xen code base. Major changes include:
> - drop support for non-Xen systems
> - drop xue_ops abstraction
> - use Xen's native helper functions for PCI access
> - move all the code to xue.c, drop "inline"
> - build for x86 only
> - annotate functions with cf_check
> - adjust for Xen's code style
> 
> At this stage, only the first xHCI is considered. Later patch adds
> support for choosing specific one.
> The driver is initiallized before memory allocator works, so all the
> transfer buffers (about 2MB of them) are allocated statically and will
> use memory even if XUE console is not selected. The driver can be
> disabled build time to reclaim this memory.
> 
> Signed-off-by: Connor Davis <davisc@ainfosec.com>

Btw - iirc this email address has already been bouncing for me when
replying to v1 patches. Interestingly enough you did Cc the cover
letter to Connor Davis <connojdavis@gmail.com> (which I'm using in
replacement for the other address in this reply). And I can only
assume that the address did bounce for you as well when sending
both v1 and v2 ...

Jan

