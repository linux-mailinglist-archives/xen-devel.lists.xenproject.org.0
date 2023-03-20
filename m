Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8A26C0CE0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 10:13:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511787.791040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peBa5-0002h9-OP; Mon, 20 Mar 2023 09:13:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511787.791040; Mon, 20 Mar 2023 09:13:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peBa5-0002fG-Jw; Mon, 20 Mar 2023 09:13:29 +0000
Received: by outflank-mailman (input) for mailman id 511787;
 Mon, 20 Mar 2023 09:13:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peBa3-0002fA-Mr
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 09:13:27 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78104ab9-c6ff-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 10:13:25 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 09:13:23 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 09:13:19 +0000
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
X-Inumbo-ID: 78104ab9-c6ff-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oign8SiP7/ak1FrFl4wXxrytxu/OrIj3AVgEglzD67oc67i4i/VZg7nrKG55oUnU7kyIMr2UQi88xb4b85DUT3ypO8xLcy1LPsXe6uNyY0mJhMqZ/FiRAakeNpB3oCyYPVYyHTkCvBAVJuAWPK1V7kH7uHTbavDBBOBLdU1l08MRZkU6r4yIQcFsj7g6fuFWxfloyB2C3jfRaMIv9lr6LoUqNzVspmdQAIHkJUdozCJsUmQ0uZkgQM4Pkr0wmaTsMeYASMGAduE8jo7bYyXMCyV9aUfqreYFQK/7wXBE2RPYKEwmaW1/GvlbCKwYimKklqQOOFsFDK99H56VhlR1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrUxzXV+t7HTO0ZihCi4ZmO2sYxa1tTkGYaNHBQvbEE=;
 b=dW/9216O+WjetjlU6nA1XGwgQRtZ9BVNKQl+bzCWaAwxnQPIY54FFXBvj4WYAnjIjbYuuEP1TJahr7T3SEAyLzFyXjaYxPRP76eyzeAid9XxV6WfTm76VsmBjlgpYfwxhabyUQghO3LuX2ivzACo5Xc3FZDOLWd/Ixvft3HbMWTPToiDWecZP8Z/ioV5/IY6FCHtz3fXbmwhkL0IKB8D4ZxcLeueM4HiLb1FLh/yajCXEM/2+bCNKm9DGF0URhhnAX4PxKh8CC6qWwj60xPu2G/UIf1IfXOLDtZ8sZ/vyzjksw6S/7wAKe3/DODfcBNbxnd9Ai+Kj7eH13GCsl4Fow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrUxzXV+t7HTO0ZihCi4ZmO2sYxa1tTkGYaNHBQvbEE=;
 b=wyi1xJ2HvWgT9VPM98n6eOhAzelOlG2ji6R37cbhfXHvYOje2oaWs59F7faTMU3rn9nlEfO+fkpAqeaDyM3PuCZby+KD/kywtrxEa3yFk9mXFYCd7N8NWy8fYdXhPDgthcvzKzLN35h4KcVA8eoQ1b7TFJIKV48WQ0igaMrdPQ1jxCxGYyTuTu3mMtxsIImbkjwZBVbKzBe2I0IrRoc1oq2S4JwoCs84C4kz8veJWWEJXqaPaqHINk7bG+JNpc20dhQTKDimpFwhn0l5tjq9ncjyh/k97xtipnbBhM8HdgJFCjk4+dXU3sv3PrH8PnjFPs2yeLznjVsz9HeZPpAb3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bfe68fee-dc22-dcf4-c4fa-d30ddc95718e@suse.com>
Date: Mon, 20 Mar 2023 10:13:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 06/10] xen/arm: enable Dom0 to use SVE feature
Content-Language: en-US
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230317131949.4031014-1-luca.fancellu@arm.com>
 <20230317131949.4031014-7-luca.fancellu@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230317131949.4031014-7-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0002.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::12) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8616:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de356da-99b7-4153-ac85-08db292358f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yep6Wmg0D9OAGV7jMw+iUE/swCMmHIjex+wekdQnBUdNvuDAC7RWr8pGB/BI4EfMsaxVt95n1Qw7KpCPOf0q1OVVbHVTtO3DG9iE6gMuYqqmtolgJATvfpWjVScr8Vyiwf+6SfqSso/Pny2HAM3TGjrqJyX2UbWsGIY85hGNCAj1qqDja5kaxbBMB/qFZPx6bXxqx5fxoNlZjs4W8CHJ0RAxYmiQZiwyGWJhVUwcdjw0iSIyXWU/9COSIF2taeZqhir+LX537TFfIRCw2KTUykRb+YhCVX+tLMBUMb3nUotPpRkFKBdsQqSohDZUB2B6L1wYbWsROoox8HrqHHnMgBZ+c6y4RN67pA/w5YA/oGoarj32pf3jdFERi+L9qqni6YElV2m5ipErrFliDlwTsa3/+Df96bksT/x6XbK5Y71FUofb1j1zZbLHbF4AwJJgnyIl7esFwPRj2rhyjZnWE94384awTV/xtS+XKGWq3TdSKkY1HkAqy5mmfIJftwnYRZM4JtMutR24IkbPHRI9MwnzZD5DBjPx7AafOANDXKiWgbSyzivxVzF6uxcLIwL2fresazAuiOt/oavV0I3Jw7EbTxHrC3nj25DiuqR33uUgRos2057oweYn6AiF5agDAocrxrel+16L1MQgiJySBr79tpko3U3mYmFt5kybFmpvalkdFaq8+bIQwCglvd+P+zY3Y8Yi/ZIggV06j1gAom0Wopf+DsecckgWewJ5yok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39860400002)(396003)(136003)(366004)(376002)(451199018)(2616005)(6506007)(6512007)(26005)(6666004)(186003)(6486002)(31686004)(316002)(53546011)(4326008)(8676002)(66556008)(66476007)(66946007)(54906003)(83380400001)(478600001)(5660300002)(7416002)(41300700001)(8936002)(2906002)(6916009)(38100700002)(86362001)(31696002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXRCMjhQMmlnYWl2c1hzSkhSckpVcDhPNHdocEt1bG11d3UvQ0ZYcXE1Q2NH?=
 =?utf-8?B?WUF3RTgyejN5UmxPenkyaVVaUVAxemRna3JFbVpnZlZadWd0VitFekI3Q3R5?=
 =?utf-8?B?a3ZFU281eXk0VC9UcnMvMnNETFprZ05uNTR4cmVjMmZ1bkZpRlJqb2d4cEdD?=
 =?utf-8?B?ZzFISVY1bS9IQVZvcE9LMmt5OTRnRGtlcG5ZelE4ZUpPRTBHYVVCUzgrekN6?=
 =?utf-8?B?R1VoZExpL3VHYXlYVlFYcXhpR1FtQy85TDUxenQrbVdJMGlSSTJuZ2NRZnVB?=
 =?utf-8?B?QVp5ZmZzTWdDR3JoeXQvc0gzQ1ZYRWdxdXlFcVNIVE9UMkdBMFpnaFl2V0dk?=
 =?utf-8?B?NjBmdkI3dFV2KzE5T3Y4eE1wTlZGVlZLWWxRTmE1UFphUFFNcm1CZkw2MTFC?=
 =?utf-8?B?UHBnNTZEeVRaUVlMcDdlcEVySEFaSkFaa2hVN213OTNSLzA4TlJ0eWZyRmNI?=
 =?utf-8?B?WWpBL0VUR3F5OG4vajRzcHMyMUhvRDArZUtwbVJCVlcxN1VscmFpRXIxRDBV?=
 =?utf-8?B?MmljMGUwNHA5bDI3Ui9ORHY1a0hVZ1AwQUtQYzNDZkowdVYxL2JQQ2VOMytS?=
 =?utf-8?B?RDlqbkpZSVJPaWkwL3UxMkYvT3RsSzB6TnIwdytWVjVuSGJoemovZzNKaTM3?=
 =?utf-8?B?VE5FYkZSOXlxMXZYaU5uSVF0T2l1MUlsT3hpbWlCOE1jWTBOYlp5bXhFMW5y?=
 =?utf-8?B?VXJqS2hTckF4SWh1NWlVUENKZFNUaVJaTDlrOGw5RDhuMkhldlFlam8rdEFH?=
 =?utf-8?B?U0pnZThxcVlWVDBMZHo3OTJMck5kQkxFN2luRGZJVm5HMDdXMVo3aUJUTmJv?=
 =?utf-8?B?dFNibmFMUVlIMG54YVhxQWFSYVpxTEUvNGJMdnlHVGV4RERETEt5Vm95NjNV?=
 =?utf-8?B?MlNmUTlzRVhvNXRrSUtpVG84OVRLcGhnVEh3Yk5yNlBPQXJVL2xuZStiOGR2?=
 =?utf-8?B?Q041Tkc3c2tqNHdLRmx2YXduajlBdDJaVkdIYnhVUTl0RENmZHJaR0lDank1?=
 =?utf-8?B?YlNlSDBOa25RNjMzUVJmdjR2VWZUYXR4WGNBd3ExYnRUck8wcFBta2ZUU0lL?=
 =?utf-8?B?dllkMDliQ0x1MFhCbFlpQ3MwdDZORlJZMFJxdTg0RURWc3dKdElwem45K2JD?=
 =?utf-8?B?QURHdVpxL1dIODlWTGZJV2dNNlNNeTFqM0tuL0I3R2Y1TXcreXhpeHdITlBt?=
 =?utf-8?B?bDFhc0t2Q0R5LzFIN3ZwWHRibTdIL1RJVGExb0xieExlR1lwbVZNSkVST2lk?=
 =?utf-8?B?U2tVNVpzbUJ1b2RkMmVGdnhkVlRtalE2Q3piV2JNcGw5d0xnMjhpOHRMVnFM?=
 =?utf-8?B?endCajJ3NUhkdjhhY3QwT21ldUpYc05qMEQ4dnFLS2Vzc1Z5Z3JzZTNtUlYy?=
 =?utf-8?B?QUR1VFMrU1psRlFIN3JJWUJWTnpUSEVEZFVRbGJZd3ZBRVV4dlJyTU1YcHZt?=
 =?utf-8?B?TGVIQ1ZVWHVuUVhQL05kSC9VWDAzbXA0N3IyQlpFaGRsUnppdDJaV0lOWGdQ?=
 =?utf-8?B?Y1VZamE2RDk3dkZ6akVtWUpKVklqNDU4UGZwaGlKcC9INGc4WmVsVktFd29G?=
 =?utf-8?B?TnpoVzVOMUlHSVV6emJ3dUpRZ2tvVlBCblVWZ3VMLzFWY1o5VnNWbVVsaGFw?=
 =?utf-8?B?ZjVCYmZmcU1xcmFVVGdJYWIzalBucTBqbWZqTTdwdDNMRlIyYzhmVDFFaStZ?=
 =?utf-8?B?bzlKdzlseEJ5TmhObWVFMVVkbUlaeHBRc2FrT3JWV004ZGVIUHB1bzJ4b2pt?=
 =?utf-8?B?UmoySnRGamptdFBKQ0pqYTEzU3VoZWNFNFdGLzJuWEMyRFJERDh4cjcya0Nh?=
 =?utf-8?B?L2VNTWo0ZlBhek5hcjVGQlpjUElZaHRYOFlRUnd5NUFQbTlsYURGNUt2K0xI?=
 =?utf-8?B?YlpMdC9TeVFYWEc2OC90Q3ZJSU1ydW9kbWE4VXVoR3VVQkRQWU0rWXVaZkhq?=
 =?utf-8?B?b2pTT3lvMFRRTFpvWTR2NHFUQ29iOE1QUHJzM2x3Y1RRUi9RL3VCV0RhNTR6?=
 =?utf-8?B?SmdseklDeDQ4emVITTZlWko5VmQ3VTB3TXZuZXFjdzZTajVmU29GYXJFTlVD?=
 =?utf-8?B?YXllK1J1NGdNM0c1SGZRNytRT0NjaFVQZWNza1FTMm9kdXNoZUtDZ3Y3ZlBh?=
 =?utf-8?Q?FgmHIoaqdsPNuRpWOegmHgY20?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de356da-99b7-4153-ac85-08db292358f2
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 09:13:19.8293
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJZugLcOCkugegm+/H0PUsRxMp4tJ3ERdCUVpRlC4iY0ECc53Xtly4RZI0l+KBDdYRh4R+cZlr26ZK6hTXVP/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8616

On 17.03.2023 14:19, Luca Fancellu wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1005,6 +1005,19 @@ restrictions set up here. Note that the values to be specified here are
>  ACPI PXM ones, not Xen internal node numbers. `relaxed` sets up vCPU
>  affinities to prefer but be not limited to the specified node(s).
>  
> +### dom0_sve (arm)
> +> `= <integer>`
> +
> +> Default: `0`
> +
> +Enable arm SVE usage for Dom0 domain and sets the maximum SVE vector length.
> +Values above 0 means feature is enabled for Dom0, otherwise feature is disabled.
> +Possible values are from 0 to maximum 2048, being multiple of 128, that will be
> +the maximum vector length.
> +Please note that the platform can supports a lower value, if the requested value
> +is above the supported one, the domain creation will fail and the system will
> +stop.
> +
>  ### dom0_vcpus_pin
>  > `= <boolean>`

I'd like to raise the question of proliferation of top-level command
line options controlling Dom0. In x86 we've specifically started to use
"dom0=" as the one top-level option where almost all new controls should
be added as sub-options.

_If_ a top-level option is indeed preferred, then please avoid the use
of an underscore in its name, when a dash does fine.

Jan

