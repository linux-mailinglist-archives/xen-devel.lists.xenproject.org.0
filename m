Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7CF51A141
	for <lists+xen-devel@lfdr.de>; Wed,  4 May 2022 15:46:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.320761.541668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmFKa-0000CL-F3; Wed, 04 May 2022 13:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 320761.541668; Wed, 04 May 2022 13:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmFKa-00008a-Ai; Wed, 04 May 2022 13:46:16 +0000
Received: by outflank-mailman (input) for mailman id 320761;
 Wed, 04 May 2022 13:46:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XlRM=VM=citrix.com=prvs=1169e63e3=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nmFKY-00008E-Rn
 for xen-devel@lists.xenproject.org; Wed, 04 May 2022 13:46:15 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8ee3a86d-cbb0-11ec-8fc4-03012f2f19d4;
 Wed, 04 May 2022 15:46:13 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 May 2022 09:46:10 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BN7PR03MB4514.namprd03.prod.outlook.com (2603:10b6:408:36::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.25; Wed, 4 May
 2022 13:46:08 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5206.025; Wed, 4 May 2022
 13:46:08 +0000
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
X-Inumbo-ID: 8ee3a86d-cbb0-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1651671973;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=snpqByTeNhnkshO6Ej7j8drnkDQJ6eOt2fBCEgmQIog=;
  b=AE1/b+q4mu1s3LJgRs4/M5Yv40GcEAw0Xj0T5fvrQDZ4kSz+WDAwS5Vk
   c+O5jNTrlR8ybF7K3EyKxkq1bQm9ZFezZZwIBhmpD2R0SzpDdUZaFscoW
   FRSfi/Vlj7YWtv/nWgA6bg9H47IKyq/cxxNwXLFQeQUKGuiZaxBS+xNXT
   I=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 70554396
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:148p7anvNh2uVYbW1E8SLNbo5gz3J0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeUGGAOKqCZmHwfdhwYYXn/RgDvpOAzoQ3TVdopSExEiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EsLd9IR2NYy24DkW1/V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYDjsuEorGh+IhTRRnKgxVOfIY07L7GC3q2SCT5xWun3rE5dxLVRhzEahGv+F9DCdJ6
 OASLy0LYlabneWqzbmnS+5qwMM+MM3sO4BZsXZlpd3bJa9+HdafHOOXupkBg25YasNmRJ4yY
 +IDbjVidlLYagBnMVYLEpMu2uyvgxETdhUH8A/I+fFmvQA/yiRe9ZLhNfreWeWLavcIg3+0+
 mPKwmPmV0Ry2Nu3jGDtHmiXru3FkD7/WYkSPKal7fMsi1qWrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdwWxvXqsrhMaHd1KHIUHBBqlz6PV50OVAzYCRzsYMdg+7pZpHHoty
 0ODmM7vCXp3qrqJRHmB97CS6zSvJSwSKmxEbigBJecY3+TeTEgIpkqnZr5e/GSd1bUZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:uzp7/qjblVEsrUCjM6B411XSL3BQX0h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJ/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Sul
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A/eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wga7VBaM0ot
 gsCZ4Y5Y2mfvVmE56VO91xMfdfKla9Ni4kY1jiV2gOKsk8SgHwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.91,198,1647316800"; 
   d="scan'208";a="70554396"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdRE7OLD90ay9o3cw37Xy4AoFZZR01i8LEGICk2Q19VLUQ5fm2OOd9egRnd1krTbH8VFiya7DEhBzN58ZOvRcOL1CTNcNdhK0pdtZMoSn1lTzuIjW1uI9lce0VlxrcjdBox6I/r3pBFORPKAfhTg6BylD8wsSt7NW2kpiEjDjJte6G2N86nRhWJWAIzblKkSrsFitqSBcO/BEqC4OR1lMixgYnRPMifbtsdSVl68g3LyxkBIFbCLFtJEEBg0+nVYv3Cx6Cc245fHk80g/2br9mcIpzm8I5Jr8k+lQkV+GWRWYprCG6L/M/mXi6FmSEbnqcxZoS9jzkV9olkKxNNQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYz58vCxxnV2QVO4SVjnndTHHlvJr9hq45F/UFYdlAs=;
 b=hY1YOVuyFvq5H2cSoc68PBI+g6h/vT58X28EhYfpGeUVOnRoJ5Bmlys56OaxBdOgnWEBJItvOnmg331OrIwC9iXufVj70tw5Ib7nz0J6kaSiPXb4qHU8WmDTvL2OG3eCA9VQQyR9xfdBCxAY8ybgVwb/UrPmjDWRzZEmEBeM2v0Nnp+zNb07sKwthjjcBSGspLF2b6xBl4nYvX27OjZMRUIa82PcXfUS4yAm5GCNHKNrr5cBZ66U/mhxOd7282DAEcxXVvsALQbOe7d7G0sW6xrEfgnlprbxCSF68DIreKLvCeAIZAIDomBh/aKf+DelXVi2xnO3n/1OaosCHBj2eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYz58vCxxnV2QVO4SVjnndTHHlvJr9hq45F/UFYdlAs=;
 b=eEZBml4bKpAKuNWEVHoaVKylhnB7hfXS7hMcxK76WVufA9dmHjNq7+e2CItmqu8DtENW0GolSOijwqm6X7swfRBA/11CWFh3vhvi2+T8hvJRcAipIxJC13IU7P2bdswjKqe/pVtcdI/G5EI5KOP0uCWPHRAcrRiASz7vXkK6qqU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 4 May 2022 15:46:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v4 05/21] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
Message-ID: <YnKDm3fHHyjQ8vV6@Air-de-Roger>
References: <5cb4dc1b-f6b0-89cc-e21c-a27a5daf0290@suse.com>
 <YnEngsDG9BiiyzXj@Air-de-Roger>
 <6ffd48ee-9356-2f22-415e-03e172eabb55@suse.com>
 <6f45248b-2f49-0834-e801-d298ea680a33@suse.com>
 <YnJV3EYq7E+4ajPN@Air-de-Roger>
 <e40d5b56-e52c-34fc-fcfb-ebf136135271@suse.com>
 <YnJrBNkGl8Em0gTN@Air-de-Roger>
 <fa6e35ac-66f9-76f2-1dd7-f1175c65e3cd@suse.com>
 <YnJ5AeB0k4SQ4hhI@Air-de-Roger>
 <66587a43-02b8-20c6-2663-4a6fc3e010e2@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <66587a43-02b8-20c6-2663-4a6fc3e010e2@suse.com>
X-ClientProxiedBy: MR2P264CA0177.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501::16)
 To DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bd5a18e-c9de-49bb-36f3-08da2dd47106
X-MS-TrafficTypeDiagnostic: BN7PR03MB4514:EE_
X-Microsoft-Antispam-PRVS:
	<BN7PR03MB45148BFF4E9B5C561DDCBCDE8FC39@BN7PR03MB4514.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fxTp/neBKMYSu1f9jT5yoc2wiJI/GOZd/Blh6ffz0yoW0YLlYwuXe7YUvG0mmKMZW1XgzcTmYsHJVqDsSqIY6R8RjitYPyrmnLeo0KZbUozYTA4ZQw1L4SLogWh7xU7JfKoRx4pFvpGuxMVj4UlzTIFLEFsbvFW+kabR7/tOroO8BvDICXTeODP8fk79lPT5kuo/o+cxtjwhFJY+bFXnTJyZ6jlg+2dSh8umUwyt/0I33Xeitxanhaz1q6qOLH8kYo2Wk5hInfT4DEVn/itzUU0LdGX2+xB9Q2uCpGb3uIumiEaHVGXpoRem4xz5+KZRs4Z3zmgK4Yye2zAjDWojhKvdhvNRJ2Ue8EhNg95BhbtltboHGRBNIJvddGRM0/bDVGsWERHyvKYYAoeDdEvIA+TBsIyTTOZb3fJIjU8TA/lmY1LjyrOfhqagqXV8WumPoJwGf4gu5QqGpl1MA/fBzaA6DHRfjqqpzuZdJy7QNMteE/lhU0DKEmkcjs6AsFFbdBujbqAw/y9OeHpkp2nYLXFbb1D4xRceZ3+shIfvagjycAtx5JFvoD2oM4CqoCOeW2gglRXRWmF2pLzRjmPal11APB8saRQmvP8SPSMwtzB69wrvl2hJQZ4D4s/JXbAIIOL3YguIW+gAYHRv8reMnA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(508600001)(5660300002)(54906003)(33716001)(83380400001)(6486002)(66476007)(8936002)(2906002)(85182001)(316002)(6916009)(8676002)(66556008)(4326008)(66946007)(9686003)(6666004)(186003)(26005)(6506007)(53546011)(6512007)(38100700002)(86362001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUUxMm5sd0VYMzNBT01sNmo3c2FxV1IvZ1hqelZRemh4ekwzNTEyWGtYNTJr?=
 =?utf-8?B?clBjbml1WjFxRkJCYnJqYy84WjRYdVhTZ3BoOWhFdWx1Z3dVdGMvS3JYOTJC?=
 =?utf-8?B?NlpuaHFPRGw4bW5GcjM1TnVsQ2JUek1NNVI5VjFYWUVQS0pVZFMxc3ZuOUl2?=
 =?utf-8?B?bEhPTm5xNzJrdXR3VUhwdlkyYlh6K1lNZUxDeGYwaXJLRGw5Zjd3VXRRMFU1?=
 =?utf-8?B?NjlqQ253QkpvZWs2M1J3amhPSS8wM0ZFVEZDVE8zdGdzTUprc2o1Tmd6MjhS?=
 =?utf-8?B?TmdjYmVKMFpUMWdPYllEZnFaUmJZb2ZpMEVlOEhSU1J2d0dHUDhQb0xXcE83?=
 =?utf-8?B?TStndHFVeDJWUDFyNEJLMlZ4Uk9vM0MwOFlhMVliNGRoZVR5MWVBOXlUVTMz?=
 =?utf-8?B?dU0xQ0NKKy9iU2F0SDJJS2l0QkNQYllKN05FdFlPU0lpaTN4MnVQYU9aMmNM?=
 =?utf-8?B?TmpMa1JMdzFrci9iZ0xkdk9ZdkZsSC9heUc0QlBJVmU1dnh0ejlDamtNNFBK?=
 =?utf-8?B?cXdUb25oakxmdS9hMGg3Tm5RTWc1cGM0V2hNQVp1Y3RiSXFwQlk5c0tjL1BY?=
 =?utf-8?B?NE1XSG1CMGlmSjg5NlZZNUFPbjBjM2ZLYWFPZjZOcTZNczVDckMvNSs1ZDNH?=
 =?utf-8?B?QkdvRkNVVmNSRlBvTUdFTHlWSlYyMHdxbXNCM080RGMvVkFrcVBzbVVvWFNh?=
 =?utf-8?B?VXZTOGZBR3JEdmtZNlN1S3lCRVpFemZCb2ViZGlvODZXTEtQZ3NtSkc4UmpY?=
 =?utf-8?B?dTBiOVlZSXdHYjh2b3d6emhEbllxbll2eHR1a3JKdkFNejdSZUVrSE81QVNv?=
 =?utf-8?B?c1lMR3JkMkxoQ1FhKzJOQ0Q0ZmRMQ1RhYUVKdUhFbU1uN2V1QTBIbmdFZHlh?=
 =?utf-8?B?azM3cWVyRWNDU0l1TzVwTTU0RGVxNEMvclhpMFYwbWFHZC9CdXVVb2x3N1pu?=
 =?utf-8?B?UUcweG9TNlZmOVI1WmVNTllBeHVVUGNaRTlHRFR0b09pcGkxY0l6dUpOem96?=
 =?utf-8?B?U0RBNjN2Skg3b1pGbCtDNmQ2dVI4NEh0dit1a3RPTkQ3RW5lV1ZsSmQrQlA1?=
 =?utf-8?B?RUNTckxyVk9wNitUOERiOUR4ZFVPSHVFdG5PYzBCdEhuY0djeFJyYlNQbWJH?=
 =?utf-8?B?RFljV2FFeisybGMwMjhkYVgxeGFLWEhMT1FTKzJUVFkvY3c0SmoyRndHUi95?=
 =?utf-8?B?Vm5PNURLS3M2NE5qR3ZVZjNjdHJJZ1lydjBpbjNOeUZHNjVTN01mYXFQRUZ3?=
 =?utf-8?B?WkdrYlE5clhXZjB0cXVyc0IwcmlOK2lwaGM3QTlBK2plWGFzTDZKVm1MbmNP?=
 =?utf-8?B?czJCc0k2WG1oa3NVUE1DdzQwdTNSejRHanZhQXp4dFVtd3RUU0hjZ3dQL1hN?=
 =?utf-8?B?UzNZL0dvZHBZQ1BpZnVGR2hQT3gwMzR1dXdKTm0ya1Qwcmt0ZFRROTFwb2Yz?=
 =?utf-8?B?U0w3Q2NsVDc4M1BNb2tqOVl5emlheUk0TkgvT0FyRjdlTXFxWUlBV2FkRDhV?=
 =?utf-8?B?K2V2TVRWaHpDR2orZXlqamtFV0tPdFJrUFJyL1B0QkVMaXgraHdYa0xycFA2?=
 =?utf-8?B?aStqNFloMU04Q3p4dGtwUU1GblYxMTBkeVovcThOYng4TXhjUk04U3NHNVNq?=
 =?utf-8?B?MWYzRHNMbGJ0U1BRN3RHOG5QdWlRM2NqS2ZqY2hZSVV4Rkw0WWpJcmtqV1JF?=
 =?utf-8?B?a2NHY2pMaUdIc3B2bnM4aTJ1b2orRDQzQTNYWUp5Q3dvaGVSRDJVRGdmYzBE?=
 =?utf-8?B?Y09jWWQ0T0N5SnNJT2lQZHk2dWpGSjZiREFhVi9LclltREcyUm9XclNJYTg2?=
 =?utf-8?B?NG1EN0ZjTXBBYld5b2xNUzNyRnQ4L1BpeCswREwzaUN1cHBRVUVCcDZmMnF1?=
 =?utf-8?B?UGNPWnlaSGtDcDMwL3pFMENuL204L0pXWUo4dHVCcGgwZnl6TkxTamRxL3ln?=
 =?utf-8?B?S09STnVZRStNYXhyMlZEZGhDYzhiZEJ6czNqeW5YQ3hvQUtkTy9hcXRXK2dn?=
 =?utf-8?B?UFNla3VFdkNNYnBvN0xIUEdvMzhGNlVyamsxQTVoYnhhc0FsUWloWUxpN05X?=
 =?utf-8?B?eHJCNzF2S3pMYkQ1eFRqWTgycVZ5K01SWGVPbEhUM3RyWjdITHpoUFYycFB6?=
 =?utf-8?B?Z0dEeVg1T0g3TURCR0dYVlBGVyszdUhPbEVKS1duUWw5VklrUDl3Q0FxZjNZ?=
 =?utf-8?B?L0tnTjhLS24rVVpBdUx5dGxNMXA4Z1hKTUlmOWFIaXNuckg4aDNjcFBxVHBM?=
 =?utf-8?B?T3BaZWhBMzZGcjFpR05uWGd3eHdCTnpsMEEzeEJheERGMXZtQXhyVHlnNVBV?=
 =?utf-8?B?SitiQUsvMEw0NWI2OVcrZTUxU01KLzArdkdFVGduNGU4T200dVlkZTl5cGI2?=
 =?utf-8?Q?hY/yjbmf36AaXr/M=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bd5a18e-c9de-49bb-36f3-08da2dd47106
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2022 13:46:08.0145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WCBZKOAe0BCMxHf/gQQnCJ8XTWzYmHi9AZzJiQFI9BVz5xm2vrh8SCkgFi1brS5IR6cFj7ZNTpF2TZqN4grFRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB4514

On Wed, May 04, 2022 at 03:19:16PM +0200, Jan Beulich wrote:
> On 04.05.2022 15:00, Roger Pau Monné wrote:
> > On Wed, May 04, 2022 at 02:12:58PM +0200, Jan Beulich wrote:
> >> On 04.05.2022 14:01, Roger Pau Monné wrote:
> >>> On Wed, May 04, 2022 at 12:51:25PM +0200, Jan Beulich wrote:
> >>>> On 04.05.2022 12:30, Roger Pau Monné wrote:
> >>>>> Right, ->iomem_caps is indeed too wide for our purpose.  What
> >>>>> about using something like:
> >>>>>
> >>>>> else if ( is_pv_domain(d) )
> >>>>> {
> >>>>>     if ( !iomem_access_permitted(d, pfn, pfn) )
> >>>>>         return 0;
> >>>>
> >>>> We can't return 0 here (as RAM pages also make it here when
> >>>> !iommu_hwdom_strict), so I can at best take this as a vague outline
> >>>> of what you really mean. And I don't want to rely on RAM pages being
> >>>> (imo wrongly) represented by set bits in Dom0's iomem_caps.
> >>>
> >>> Well, yes, my suggestion was taking into account that ->iomem_caps for
> >>> dom0 has mostly holes for things that shouldn't be mapped, but
> >>> otherwise contains everything else as allowed (including RAM).
> >>>
> >>> We could instead do:
> >>>
> >>> else if ( is_pv_domain(d) && type != RAM_TYPE_CONVENTIONAL )
> >>> {
> >>>     ...
> >>>
> >>> So that we don't rely on RAM being 'allowed' in ->iomem_caps?
> >>
> >> This would feel to me like excess special casing.
> > 
> > What about placing this in the 'default:' label on the type switch a
> > bit above?
> 
> I'd really like to stick to the present layout of where the special
> casing is done, with PV and PVH logic at least next to each other. I
> continue to think the construct I suggested (still visible below)
> would do.
> 
> >>>>>     if ( rangeset_contains_singleton(mmio_ro_ranges, pfn) )
> >>>>>         return IOMMUF_readable;
> >>>>> }
> >>>>>
> >>>>> That would get us a bit closer to allowed CPU side mappings, and we
> >>>>> don't need to special case IO-APIC or HPET addresses as those are
> >>>>> already added to ->iomem_caps or mmio_ro_ranges respectively by
> >>>>> dom0_setup_permissions().
> >>>>
> >>>> This won't fit in a region of code framed by a (split) comment
> >>>> saying "Check that it doesn't overlap with ...". Hence if anything
> >>>> I could put something like this further down. Yet even then the
> >>>> question remains what to do with ranges which pass
> >>>> iomem_access_permitted() but
> >>>> - aren't really MMIO,
> >>>> - are inside MMCFG,
> >>>> - are otherwise special.
> >>>>
> >>>> Or did you perhaps mean to suggest something like
> >>>>
> >>>> else if ( is_pv_domain(d) && iomem_access_permitted(d, pfn, pfn) &&
> >>>>           rangeset_contains_singleton(mmio_ro_ranges, pfn) )
> >>>>     return IOMMUF_readable;
> >>>
> >>> I don't think this would be fully correct, as we would still allow
> >>> mappings of IO-APIC pages explicitly banned in ->iomem_caps by not
> >>> handling those?
> >>
> >> CPU side mappings don't deal with the IO-APICs specifically. They only
> >> care about iomem_caps and mmio_ro_ranges. Hence explicitly banned
> >> IO-APIC pages cannot be mapped there either. (Of course we only do
> >> such banning if IO-APIC pages weren't possible to represent in
> >> mmio_ro_ranges, which should effectively be never.)
> > 
> > I think I haven't expressed myself correctly.
> > 
> > This construct won't return 0 for pfns not in iomem_caps, and hence
> > could allow mapping of addresses not in iomem_caps?
> 
> I'm afraid I don't understand: There's an iomem_access_permitted()
> in the conditional. How would this allow mapping pages outside of
> iomem_caps? The default case higher up has already forced perms to
> zero for any non-RAM page (unless iommu_hwdom_inclusive).

It was my understanding that when using iommu_hwdom_inclusive (or
iommu_hwdom_reserved if the IO-APIC page is a reserved region) we
still want to deny access to the IO-APIC page if it's not in
iomem_caps, and the proposed conditional won't do that.

So I guess the discussion is really whether
iommu_hwdom_{inclusive,reserved} take precedence over ->iomem_caps?

It seems a bit inconsistent IMO to enforce mmio_ro_ranges but not
->iomem_caps when using iommu_hwdom_{inclusive,reserved}.

> >>>> ? Then there would only remain the question of whether mapping r/o
> >>>> MMCFG pages is okay (I don't think it is), but that could then be
> >>>> special-cased similar to what's done further down for vPCI (by not
> >>>> returning in the "else if", but merely updating "perms").
> >>>
> >>> Well part of the point of this is to make CPU and Device mappings
> >>> more similar.  I don't think devices have any business in poking at
> >>> the MMCFG range, so it's fine to explicitly ban that range.  But I
> >>> would have also said the same for IO-APIC pages, so I'm unsure why are
> >>> IO-APIC pages fine to be mapped RO, but not the MMCFG range.
> >>
> >> I wouldn't have wanted to allow r/o mappings of the IO-APICs, but
> >> Linux plus the ACPI tables of certain vendors require us to permit
> >> this. If we didn't, Dom0 would crash there during boot.
> > 
> > Right, but those are required for the CPU only.  I think it's a fine
> > goal to try to have similar mappings for CPU and Devices, and then
> > that would also cover MMCFG in the PV case.  Or else it fine to assume
> > CPU vs Device mappings will be slightly different, and then don't add
> > any mappings for IO-APIC, HPET or MMCFG to the Device page tables
> > (likely there's more that could be added here).
> 
> It being different is what Andrew looks to strongly dislike. And I agree
> with this up to a certain point, i.e. I'm having a hard time seeing why
> we should put in MMCFG mappings just for this reason. But if consensus
> was that consistency across all types of MMIO is the goal, then I could
> live with also making MMCFG mappings ...

For HVM/PVH I think we want o be consistent as long as it's doable (we
can't provide devices access to the emulated MMCFG there for example).

For PV I guess it's also a worthy goal if it makes the code easier.
PV (and PV dom0 specially) is already a very custom platform with
weird properties (like the mapping of the IO-APIC and HPET regions RO
or no mappings at all).

Thanks, Roger.

