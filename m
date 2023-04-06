Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCE96D9753
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 14:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518890.805871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkP4u-0007Fx-Mt; Thu, 06 Apr 2023 12:51:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518890.805871; Thu, 06 Apr 2023 12:51:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkP4u-0007Dx-K5; Thu, 06 Apr 2023 12:51:00 +0000
Received: by outflank-mailman (input) for mailman id 518890;
 Thu, 06 Apr 2023 12:50:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=LuhO=75=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pkP4t-0007Dq-3Z
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 12:50:59 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20602.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab7799c1-d479-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 14:50:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB9125.eurprd04.prod.outlook.com (2603:10a6:20b:448::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Thu, 6 Apr
 2023 12:50:53 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6277.030; Thu, 6 Apr 2023
 12:50:53 +0000
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
X-Inumbo-ID: ab7799c1-d479-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3NtU0wWqoFjQARZxeccDknpYgzMHrdG0B/1uPOCX0xNEp4P9VYJw4YBNyJQfdSiXkkqZO9g0LV7V+fwhIwMC5MXo94tMOGqgC4RvbwnZP9myL4+Ns4Zp9FuESUF7eO2gSA1WDNUnmrSvJddJz85dJsoMcQVENj25Xc2CLNIf2QdOo3QefpvVGz3kDOwFEKig3cdRL6OP5S+lCGaah0YdRJrRZAIhi1237M/ieinJIQptLbyL8HWrkHqZ7mBkUPKf56fXcTte0NZANFokdF/YDDT9jX9PuagmNLIrzYKBZsZGkhrm39Uh4LflPH6djOFF9Cz2216URTWmQ3S0becfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xZejxViod/vAIC5FopSmY3XD32mS+AFSGh0OUJ3uR8=;
 b=mx+3+JedwpW4xdmYgJS62Dat4gcIJdBxqC9Zpr/Mzi9Wp3Atu9/vp6g7FDlV/6zJ1XXNwaUBU6GUD014z/lFMvbZw3F2nsF+jmoBNe3zxmKKnAGgYcNi88LC4ue4NbEYE6DDpUhycXgpfUD/NT9k9nggVP5YVh8jcmyLR6skQMrv7liSZcP+GMrPv2hdM+a/lN61pI8LTaVC4WY9Qoxshd3nr04+RDIpGjJHD9pG/S3eiOE9mkGt4g+mHrkO9X357cXGi35b7lrtVKTtMLUhgQPCD4OSsoha48HRF+YvqKbiHXq8fgEw6wE9Bdkya6eobi4eiwqk5i/0bjXyeMkZWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5xZejxViod/vAIC5FopSmY3XD32mS+AFSGh0OUJ3uR8=;
 b=ov/BG0ZooURQfQxGo0bVCoJvkcEhdSWHpPK92qyFFSo7qLZFvNEkzfPpWA1MjtR5+ClsMfJQsSJb/SknhbtK36B0Jq3v48eEkIp8xArUc3qU3nRwGDYzrLVNNNDTHrXPF/y8Jf6ucktOAnjtLtCiKkAqlubrFlm99FXP6/9Ob7QuMmcJJ7mrK3WVxo3CCwF2yVElwnQR7/f1N4zbBzgSA4ovsiH/qqCX2pyYkNMOcD5e9E475MlYZToe4wyezkShl5a1sSX9MzK1Of/QsbpLo0MPEwYotCtN57Abu/H6ULCgRdoWTTAM7y5/Q6tMtNfbr1WpPXfDO8T268WAdFmVYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <44079a26-4631-135e-6593-78f7c2d2319f@suse.com>
Date: Thu, 6 Apr 2023 14:50:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/emul: Use existing X86_EXC_* constants
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230406121753.2205968-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230406121753.2205968-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB9125:EE_
X-MS-Office365-Filtering-Correlation-Id: efc3b920-ae50-4b73-5ee4-08db369d8ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6agV14GSanjTleYQAtz2iOuZDBvEeDOCNol/8x2li+O1OoZ3Iqt9oqIbxjH3mthAGPGvkyFl3HV5oXRaOGDEDPGG6951fceclhfjAOubzM/DBDE4+RtfBjk0r8CJMx7E6L+yBCNSF/cqy+3h1qOgfUKVgV7PowjlqMXv3Y449uJl7sdp8Kv6rLCGkJR8yPCmLQDhT7JYZTpcjKvu9qq0PbOjQocAS7/y285Bh85qSozb/OUbA9LXx8Y9yCHeqzzuL9K7VOKC/mYX1N98Ig2jK5szGtkY7HeDXYWBvDLpQRVmaefGXk7QLuEuaVd6o51EO1sBSgwOZUW56B5WdUFMrDX5ee3xlbvHobXcJIZkYAhpRzLC+4BCRmycRZeDOov6p7atZUC0ca+Kyv/Vjga3sznVN/czTKTiFl7U6eHo4OQw0vgGh0Y+VBHyMldJ2o3ydXCqVcuXrGky55yMnHN0Uc5zxlw1bWHwHOnGaR6lA3JgETaEGr2fRqLwjo/IaRfwm6wTBPvED3zzU5WoJVUZZYYZX8vXWzPZUJ3M+r0yUZtv0ibM4wQINcd5kQx4GIazol5qFWFMTacOegrAi3v/2S8zJ80eApXqeKRnI8LXkxPM5j/1B/P+J3yDERhM2+z3ab9UAMoo4BHhpuQbnI5sFA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(66556008)(66476007)(54906003)(478600001)(316002)(86362001)(8936002)(36756003)(5660300002)(4744005)(2906002)(4326008)(6916009)(8676002)(31696002)(38100700002)(41300700001)(66946007)(6486002)(186003)(26005)(6512007)(53546011)(31686004)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3IvYW8rVVo2TTNKTkZxdlNJYnFPVVN3YmdZUDlPTElRWDhRYW0vY29QSEJZ?=
 =?utf-8?B?ZjByZ3VvQmt6TURldm1Bb1RDYmJGckdXUGEzV2JMb3hibzlqWHBoSEM2UjJn?=
 =?utf-8?B?SjJuSFFIV3loT092U1U4SlEzYTRPTUMvYnR2Yjd1bk9SaXZHMHVZUFRXM1Y1?=
 =?utf-8?B?R1U3VmJDNENYUmg5eDRmZzdKdkJQYWFjcldGL1I1NUVWb0hCZUhTVGFkVVo1?=
 =?utf-8?B?U2liSS8wTEZhNHNxNHc0YzZRbVdSdElKUFJUdWVMREhXSTF0ZUx4ZGNrbjhD?=
 =?utf-8?B?NVI3SDRnbGs2aTFvMlZ5bHpVNEtOZlZHUDNNWUNYN3UyaEJoeFRGaVh2M3Zo?=
 =?utf-8?B?NE5kcjlxMUNyRk1DcTYwZDFhZkN4a3dGSlZjWFRwOFZHU0NaQ3N3M2hqRmcv?=
 =?utf-8?B?QXJGSS9FWFlSM3ZJSVF3QmdUaHhGWHlVbk9pVUdHQStlVGFRRGQ3aU4zVnR2?=
 =?utf-8?B?MFVlc2YxVU54WlVYSDV3MjY1bVc5N1UzQ0NVU01BWUtobitjb0VLWmRaL0dJ?=
 =?utf-8?B?cDJDbDNTa1U0eVV1S0YvYlNuMWpZdmRHQnB2d1JRZW5tL2hPV1ViNUE3eFdG?=
 =?utf-8?B?dzFnUU9CRVNpOVk2L3Zmc0FwRTlJZE1YRGM2Q3RJWXZXenA3YUFzWG5kclN6?=
 =?utf-8?B?Q0NJZUR4TjUvM3NiVkQxaktadlNxcUtVRkk3WWRDcWlXOXNvT3RaclI1elhy?=
 =?utf-8?B?bHBJc1kzTXVLQlNzeTFsN0NWNCs0c2JGeWprb0ppNUpNbjUvaU56aEx5RDRU?=
 =?utf-8?B?TWpTRm1jM2JJOUpXNjNVQndXZC85ME01S0RyditWS0VneTgrMENFZ082dndl?=
 =?utf-8?B?b3dCTjlScTQ5MDhrdllvR2pMTzJYeGRDVkdaek5WZmh4ekN0dTB0dkVienJW?=
 =?utf-8?B?d1d0KzVCMnFtZkxEMW14Z2xjZ0h2WXhQcGU3ejZTbVovMlJHa0QxTnpLaExD?=
 =?utf-8?B?WEl0NlhFaVptOS91a0JKeXlRQ1BSU09NVGZKODVVbFd5VWhReDhFNDNNT1Qr?=
 =?utf-8?B?K3AzMlI1d3VGLzBnU1VCZklsMWNtZzlPYzZSM2pOeld0UiszcEdtcFBIejNT?=
 =?utf-8?B?R2c2cElSSmx5TGgzOG9wbFBoTTBUa2NJdDJZT3FBbkM0SXdkVjZpeURuYVZL?=
 =?utf-8?B?ZmRQem44d3lxc2UwN1pXZ0lpNEU1RWtldlU0aGMxSHhYZDNzcWdZeWlDNmln?=
 =?utf-8?B?Q0MrZnRoSUhGUkVsd2kwR3ZEdzdNclBFc29YcWxNRXhRY1RjcGhkbnpnWSs1?=
 =?utf-8?B?Ni9Gdlo5RUNvV0ZNaG9DQUZmL1lRNnBHNEtOUjJGMklVYXYvYmVEL0dWZ05p?=
 =?utf-8?B?VFdpYXlkTFhpR0lrc1FmRGVJdzFtYm9IV29NOXhtMzMrb3duRExXY3QzOE92?=
 =?utf-8?B?ZUNVeWNENFc5YVJseHllbThrYU5sUWZRWFNrRW9LZlN0MytZVHFpT25PSCtt?=
 =?utf-8?B?ODQvWDJpNkFiNll0SFoyRzI0VHdRR2s0Q2JoZFpSaW5MVHZRSGgzMzN2djZv?=
 =?utf-8?B?d2VRVVExSlpLeWlLMnhSRHRITE9HdHBqUnU5L2dZQUNrNkt1eVdOK3U2d0N5?=
 =?utf-8?B?RkNvMnNmdFJzTW5mdWRkUC9ZWkV1WDlUM1ZUWGZISExNazJsZ2Q5aEgrTFNK?=
 =?utf-8?B?bFpRNnM4bmg0L3pVNDJRUEpVVW5uUXNocjhzTHV4UytuZHZodHVYclNxaG9n?=
 =?utf-8?B?NlFWSWFLK3BxeTliMGJVTGhXc0swL0F2NWZHNFRncXhVVnZSdWJHSERGdGJV?=
 =?utf-8?B?ekZxd3hod1lTTklQMzNMdUJhNU5qdTR4dXhLNU9Vdm45Nk1waVpGaTlwVWtz?=
 =?utf-8?B?YWVnQ2taS1dCd080eVhOclc3KzFENGswVFd1ejdsY0FxTHJEOWdRWVB0bUsr?=
 =?utf-8?B?dDA2NFNJanRKcjVRS1ErdDV4S1QrSEl0U2duZXplT0QvUXUxL09LS09CTUll?=
 =?utf-8?B?eUQ2Si92aGdsK1RYOFkyUlNWaDMzU3ZnVmZ0WlB6VXpQb0hMaDVqaWIvcE1s?=
 =?utf-8?B?cGZiMTJRd3FRaFMzdTROK0JQMXZxZXdkWUlFNHFaNG9ZUjc4VUM1S2VvM1pm?=
 =?utf-8?B?OGdvNGYvZ25sNGFkUlovVjVpbXNZdnZTUmhjdkJuNHhuYjhJZCtmYnZkQU9D?=
 =?utf-8?Q?CcpNklaqO6tgeT7pMePgcO6lY?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efc3b920-ae50-4b73-5ee4-08db369d8ea5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 12:50:53.6372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: knpPdms6tQyIXLmdsi8OKpgWSKo55ZyXMo31l1j/DmCp8N+eHoX0TgmvyTCcuyHutd41i+M3nbfdQr4O2/QskA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9125

On 06.04.2023 14:17, Andrew Cooper wrote:
> ... rather than having separate definitions locally.  EXC_HAS_EC in particular
> is missing #CP, #VC and #SX vs X86_EXC_HAVE_EC.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Yet more re-basing for me to do ... But yes, it needs to happen at some
point, and I guess there never really is a good time.

Jan

