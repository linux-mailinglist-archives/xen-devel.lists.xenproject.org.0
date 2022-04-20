Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9165450857D
	for <lists+xen-devel@lfdr.de>; Wed, 20 Apr 2022 12:07:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309075.525107 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh7Ep-0001vM-Gu; Wed, 20 Apr 2022 10:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309075.525107; Wed, 20 Apr 2022 10:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nh7Ep-0001sR-DF; Wed, 20 Apr 2022 10:07:07 +0000
Received: by outflank-mailman (input) for mailman id 309075;
 Wed, 20 Apr 2022 10:07:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nh7Eo-0001sL-8S
 for xen-devel@lists.xenproject.org; Wed, 20 Apr 2022 10:07:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a02a7355-c091-11ec-a405-831a346695d4;
 Wed, 20 Apr 2022 12:07:03 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2177.outbound.protection.outlook.com [104.47.17.177]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-HDCpgyIWPzyKxXwxpjFVTw-1; Wed, 20 Apr 2022 12:07:01 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by VE1PR04MB7341.eurprd04.prod.outlook.com (2603:10a6:800:1a6::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 10:06:59 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.014; Wed, 20 Apr 2022
 10:06:59 +0000
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
X-Inumbo-ID: a02a7355-c091-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650449223;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tG+8vnyimSJzaLniMLvuA+E4J04g2IdKBWXm8WqWPpg=;
	b=MyN8fsj3SU5QGWYGitrUynXGPjrOBa5lJK1j7S7ot06jwYGzW/TmIscMiO04WqQdZ7kf0C
	rUf9xcPiHYlEUrjejZeb0jhjuTp9BhHvM5s0fHwnWU1AFsUFEF1JjdYaG7CMStoYLgVTgk
	9DKPs1/zrrZA6cKYKE09kfxS/LaOzdI=
X-MC-Unique: HDCpgyIWPzyKxXwxpjFVTw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Etby1JFuW0vzbDJDWrH8fFCPLB7S+rKpyHxNexmzGpL/H40Co3AW0yCdaIgL+UDukpBx6JzuuHW1eXqTt61mxwHna/08/0vvvM4zSyfDmyRRVdPrUPF01zERYbT7wFHu9n97dv8M6KiT5DXncrn7PymuahHcgz7J6egvKb5Xcpp/oglCxVpHzX0XmOHlgENFQciz8rhpUkbIQSeqlMfunR26zZHxbzztCiANUneH+mMstFlL8wyip3nAeLGNETqP47/kEZLmCvri9bvBPudM/ALqgCyzvdxshqmB50pSYOvYnj4lYWUJiqTm4U0deE0caVJxSzGLLUk5YOCeGqHQwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tG+8vnyimSJzaLniMLvuA+E4J04g2IdKBWXm8WqWPpg=;
 b=JhBJNYCSqRzUMQJuaLS4kwVnqrqLxKoY2DfaSU5DWopISmcgR4HeZCsJMyIuRERC5+QrYNY4J2XAfiVK+NoLwS1NGp6LcyEw2GpOzSbm2Jmh0+VlOlUVPwPxdKkseyz40bTRs3m/xpaPPPGmLFXV+d3vhJo4GnBXl9MCoSu+RyNbrEd4fdp9SDUHf2MqO5C05JVdlITA31Ge2ONb79Nyqgv9Qum+aEyxKYOb2XtPpz6Y2BNPWVpiF3PVnJnYUsB2Z909/hwTXHIx8xuNI2001Pc8ENs182Jyn4fM3b/8Ke3ydh1KpQ38/bTvMhPVlXy2I5tByPCpU3hrE0eC/oE7fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5f058541-821a-170e-2043-7b32beaf3b98@suse.com>
Date: Wed, 20 Apr 2022 12:06:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] xen/build: Fix dependency for the MAP rule
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220414162348.4808-1-andrew.cooper3@citrix.com>
 <20220414183548.19611-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220414183548.19611-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6P193CA0041.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::18) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ae04fcf-850b-4194-dd62-08da22b58229
X-MS-TrafficTypeDiagnostic: VE1PR04MB7341:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR04MB7341A58EC418C51C0B732334B3F59@VE1PR04MB7341.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mxjbC1DzP+zc6bjexK5rp851/ogkdlm9V0YPdPrMo4Civfk43dUt+IBwQlRAdfzN+aXZzxPMlAPZTNRO4qWTPJhecE8p8dnNx9Z60i0vNoF2lmRzu3u80Mb0rRpR2ClbQQSEavwnAxmaEBcuqu4AMa8bybYLF4tzVFbIGjrWFkBJX1f9KQCoHlqOvujrxx+Rka0OW/03e+crsQ/LRXU6IwVrTQrRb+9M2PjlnGLhZoG8M4rJawnAgbx9TkodPmwFnH7Oo+pbyvDzAyNLkLHOUijrYV7Woi0SdRDOlIXEGcpSmTv17/rdYQf4l2+DKPY5CU4OEjy9qPa9hBgxphGoRhNZ/94XdzRwxRhtbDP4EktzG5ytGTE5KQN4FYWis6uUjTBp4qKIdN50cprCTBicW4hRWRXRBrFdKxPoI4RI1IGh1Tuik7+NGcKnVtD5nFpmLVM+3aVrx3HSQiwAqpaRCp2p8FrqDUE5ipvBGX6pmyAaC4rpeweNyro7f4ZkVlPWPsefh9DNMHuCKWVd8N0Os8J8rM4qP46FoPNWE+mLl6UGR6woufjFjlba9ApAkETVWv04xmySFRhUUucdHDip/Mly+MajxgidVNO/+wotAfKQVjyLeaH9177uzGgW6+iFwzq/GWOsqkx9Za662vTZ+ejovEtizec9BXuqaNexVBO+Ocl7Rpx9q/jPA8rj+ayY4UCdlIfi9/SRetH7JFXbLkm8cj3tuv/i6Kp2VAVCYzk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(4326008)(558084003)(31686004)(186003)(31696002)(316002)(26005)(8936002)(2616005)(5660300002)(2906002)(508600001)(6506007)(6486002)(86362001)(8676002)(66946007)(6512007)(6916009)(54906003)(36756003)(66556008)(38100700002)(66476007)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkVSNzQzSTJmVTJuVFR6bFJHOHB2Y1ZySHZObndMNlZ5WE52Y285bmpUZkZO?=
 =?utf-8?B?MUpNRkl4T2p6VHpJWm5rODhHMnRsRDNOeEtCamxkOHVxL0NhRDJoYnFIaXo2?=
 =?utf-8?B?cVlHNCtRb3VPSWFHMDdUYmJCUkYzSXhuQTlmeXUwbjdIdnhDR0Q0ZmwyblBt?=
 =?utf-8?B?UkV0NndWYmtuQ1ZQeEV3aDBrRzlxLy9EWGk1MWhQMmkzWWRZQ0grYjlXb0k0?=
 =?utf-8?B?aS9EZ3dTblEwSXk4Q2Z5TjVzeDdicHRXV0lJUmI2TkFVWmU3RGJqK3FBSUd5?=
 =?utf-8?B?cjBEcUxxYTVPK0oxQ05Qa3RWU3FsMDJPcitrOWR3VHRsKzN2YWxpZWFWMVFH?=
 =?utf-8?B?S0dPRXlpQlE1ZVlrazNIamdqYTBjcDJtREFxNU5uL29CZTRHNEtuNWhXZ1l5?=
 =?utf-8?B?d1l1Q1pnVElRLzk0aUp4elJ4aFhsMDRhWm95bEJ2OGJORDZHN1NmMW1ueHQz?=
 =?utf-8?B?OFd3N243eUpjZDRxUkZQbDJlOGdZN3BydWNqYlYwaFZpeHEvaW04a3VyLzg1?=
 =?utf-8?B?bEg3aExnS29rUHFLK04zS0FZUU1EVDVUOTFBKzFyb1RPTEJBVi82dlNkRWg2?=
 =?utf-8?B?enZ3TE05ZTZHMERLZ3M5NUtzSVgxMHk2WlhkNmpqcmFxaXY3amh6S3RBNE8w?=
 =?utf-8?B?ZjdrUUdLOUtJV0djVFRpb1J1THVyR0ZqZUpCTEJwSFo3QjNmYU5ucEc5d3Ay?=
 =?utf-8?B?Z3NuM1A1KzRxOE5Fekt5SUxqR05uYURpN1FrcUE0UVMzVFdLbFZDWVhjd3RK?=
 =?utf-8?B?RHRLUEdjMHdqaWF5UjNrRGs2bzhYejJqZWlkM1lGanVHeGdHUTZrRnlUcDlT?=
 =?utf-8?B?UEtKZTJOL2xhSTFGUGJhaHJrK29NUldtdkVwZVBYZzBzam5DTWpMMDV2TzNz?=
 =?utf-8?B?TFRXVVJZYnU3ZVpmc3dMeXZOQWRzVWpNc2tSTmdSNDF3VFVjMFhOek9POUty?=
 =?utf-8?B?TE11Y21mbXllQlVkaE15b2hyQ3Blc3RzU3c4djM1czFJUjI0anNLSFBkQ1c2?=
 =?utf-8?B?TkZQNm9DdjVtSTh0YktVaUhjNThra1FqZzFqdTA2V2tPL2ZSUlIyMXhRbW1J?=
 =?utf-8?B?b0tmT0FBcWpRMnFlNnlIR0RmYjlOSnNvSWRBY051RUlVTTBwbVhzQjJ0bitE?=
 =?utf-8?B?UW9SL3pyUGV6UElTUlV0amtTU2tFL0hjYzliVVdkTHhic0J0YUswanZJSkZK?=
 =?utf-8?B?VE9PYUd5SDBZN0ErZWJkaFhkTmFlMVBWcm9rR0lOV3I3eXZPSSs5L0piN3I4?=
 =?utf-8?B?cm4vekpXblZSRmNQMDNKNTE4U2RjV2RlR25HeWd5N2xnSjgzb2hVdHIvcmVx?=
 =?utf-8?B?eFF5eWtUcnh0cFAwQUpTcDh2OHdTcXhJczNHZStGdklBUjVycit1VkpVM3Fl?=
 =?utf-8?B?MFRYaTdTangvNGYwZWFvUERRWVQxREw1Z0hsSTdlR3FNbGNXNGRrSWczYTVh?=
 =?utf-8?B?QTNWOVRtaHdZRyt0QlYrS2NMUXhLRXpiRE1wSXI4bXR4QzRGV0ZrMkhhRkVG?=
 =?utf-8?B?cGRRcml2eHI2MVFtRmhvelBDY2ZpWi94WElXeUw4ckRtaVMrSnduSlFKdmtJ?=
 =?utf-8?B?amFCemZyWE5KS3FDSGM3Z2d4UXJnRllGSGh2ek9hR2hCZUJMZlYzMFVZaFBW?=
 =?utf-8?B?di9FUkorZ3dEVVpScHI3eUZLZWM5S0hSVUZTRW5NZDNkRUlqaU0yNWZyNzk0?=
 =?utf-8?B?VUNuM3gxa2RLMTVPVVdzaHNPa1hCREYrQTMzSmc5cUV1ZENsWG9SQWxpd3Nr?=
 =?utf-8?B?Lyt3elZkb09sNWsra0RkZzhjenlEYWVYS0t4UVhYTS81WCs3NEFoQStvT2Nx?=
 =?utf-8?B?dDVUL25IeXhPMnFPbWF1Q1gzdUhDT3JIWENMWmF5V0FmaTY3eG5UNUMvdHVN?=
 =?utf-8?B?NlVaMUV0NEt2RlNJOFMvYVhMSmZSSmdqQnBXMHZjUHNoL3NkeDdmYUNIV3VQ?=
 =?utf-8?B?OG5kNG9LUjRYV2x6aXZ4Ry9SQytOR3kybXF2VWZPNUhUQmtzZi90QU90NklT?=
 =?utf-8?B?OXgxakZMRUtjN0dkM2F5Uk5NeTVlaXlZTll6NWtNSE1HdVZjTHlkaWdtZmtD?=
 =?utf-8?B?VU9zM3lmMEtrSE15Zk5qVlZ5dms0Sjh1aXM0NjNtYzJyUnozZ0xiNnpXT1RY?=
 =?utf-8?B?ZDV0ejRKMHViR0xpTEprNEpTU2QyTWRNWUNYWklLQktYNkd5aGdjUHlOSWxI?=
 =?utf-8?B?MnJwSU1UM2ZDcFJCVzV1bFBWYVQvMVlRczJmdjdrbnNOVEN0TlhIK1NFOFRj?=
 =?utf-8?B?SVBWa3c3QjEyalVGSEdPMVdhVGQ3c0pHSFE4SDBZeWNVOVNiU1U2ZytPcTh0?=
 =?utf-8?B?K2hVOFJiS2g3WmovWWdkeG1Zand5UWhqeXVvN0NlWHZCeG9XN2FlQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae04fcf-850b-4194-dd62-08da22b58229
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2022 10:06:59.8302
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 89yQWgMqzqCHY1c4gxYkMgvMcM5o2ovJR1fqjE2wqc3qsekpvZupw/FlImHYD+IVld5n6lEAm0l61DQNezX/9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7341

On 14.04.2022 20:35, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

Needless to say that the generated System.map may not represent reality
if xen.efi is what is in actual use.

Jan


