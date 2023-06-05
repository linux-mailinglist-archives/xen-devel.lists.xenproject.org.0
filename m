Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F35C6722548
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 14:11:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543692.848873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q692m-00037P-D5; Mon, 05 Jun 2023 12:10:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543692.848873; Mon, 05 Jun 2023 12:10:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q692m-000356-9w; Mon, 05 Jun 2023 12:10:40 +0000
Received: by outflank-mailman (input) for mailman id 543692;
 Mon, 05 Jun 2023 12:10:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wlJc=BZ=citrix.com=prvs=5133c6164=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q692k-000350-Gf
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 12:10:38 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f942e53c-0399-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 14:10:36 +0200 (CEST)
Received: from mail-dm6nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 05 Jun 2023 08:10:33 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by LV3PR03MB7522.namprd03.prod.outlook.com (2603:10b6:408:19c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Mon, 5 Jun
 2023 12:10:31 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 12:10:30 +0000
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
X-Inumbo-ID: f942e53c-0399-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685967036;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h6E9FCrxv7CGPytZwVDRbCAwF3a52avXdKjd6SoE78Q=;
  b=ZKs5JM/n7UQ2o1H5w0+peK3N2AGoksdFCSdM/CgMuZJUNw2mSGHNvT8F
   Kb27b9FKOGjhpN6eWohY/k07b21FHROBwVsuFC/fb0/nc0QE2ulFcOksi
   dKt/qXLoFJ7ue7mTWdPzlN6nWaX0Uk9txcprK+d5e6y9ANH7cuWlBOTIf
   o=;
X-IronPort-RemoteIP: 104.47.58.101
X-IronPort-MID: 111502450
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:OF49fagesHH7uDlbjz+owueoX161TREKZh0ujC45NGQN5FlHY01je
 htvWGiPPfbcNDCge9hxPYu/9EkG65WGn4AySAQ5+StgEiIb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4geCzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQ2DQwPfkjZvNid67WiF8BK2d4GPJTSadZ3VnFIlVk1DN4AaLWaG+DmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluG1abI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeThq6Yw3ADLroAVIAMVW3W4uMuVsR79cvx8L
 30F1g0Po4FnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakc5oRAt5tDipMQ/i0zJR9M6SKqt1IStQHf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxode51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:ut7PkameudEeODdou3RxfXtEmnzpDfOSimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcIi7SdW9qXO1z+8Q3WBjB8bcYOCGghrmEGgG1+rfKlLbalXDH4JmpM
 Vdmu1FeaDN5DtB/IjHCWuDYq0dKbC8mcjC74q/vhRQpENRGttdBmxCe2Gm+zhNNXB77O0CZf
 yhD6R81l+dUEVSSv7+KmgOXuDFqdGOvonhewQ6Cxku7xTLpS+06ZbheiLonys2Yndq+/MP4G
 LFmwv26uGIqPeg0CLR0GfV8tB/hMbh8N1eH8aB4/JlagkEyzzYJ7iJaYfy+Qzdk9vfrGrCV+
 O85CvICv4DqU85uFvF5ycFlTOQiQrGoEWSt2NwyUGT0PARAghKU/apzLgpAScw5ycbzaFB+b
 MO0GSDu5VNCxTc2Cz7+tjTThlv0lG5uHw4jIco/jZiuKYlGfdsRLYkjQhoOYZFGDi/5JEsEe
 FoAs2Z7PFKcUmCZ3ScumV02tSjUnk6Ax/DGyE5y4Co+ikTmGo8w1oTxcQZkHtF/JUhS4Nc7+
 CBNqhzjrlBQsIfcKo4DuYcRsm8DHDLXHv3QS+vCEWiELtCN2PGqpbx7rlw7Oa2eIYQxJ93g5
 jFWEMwjx96R6qjYvf+q6GjMiq9NllVcQ6dvv22vaIJyIEUbICbRBG+dA==
X-Talos-CUID: 9a23:9tOjm2NwYW92Fe5Ddgxb9l5MQPsfWVba1Sr5BRCiLHY0cejA
X-Talos-MUID: 9a23:pFhg1wlrSox1CB9tHj2qdnp8N8lG4L2cJHtd0rwomM21JABXGjm02WE=
X-IronPort-AV: E=Sophos;i="6.00,217,1681185600"; 
   d="scan'208";a="111502450"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GJkbfLDBPvvK/z9U/vtE4zVKYX8kDU8Bc2AHLBZnNiKA+lBU+ia/frzh3Tgn0ziQi4/kGlHgMT/hIUaed/x/5JtsdbSx8N42Lm8gJKPR1UcWfTVfDW7vrEOpJeG2o8IdnrfzNk/M2Cr1QBKkdGWZUfq9KOYa8Fshrzpth0nvShPqTclLpWQeiC1LStl1WB8uz57hB1vH7BClVkpR9y29Mtjkqmdf4cdne24Sf/i87bWSSUGgNUQ4t8kaET5bhAeEpGU5m1FrIrI8yNfjHtAzAUn1wzmM7HPJfHql+9/fLTY8/LgfIzrckACzyPK6ix6nnvHCqnOvlqGRmaJmLZZAug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6E9FCrxv7CGPytZwVDRbCAwF3a52avXdKjd6SoE78Q=;
 b=iU9KNazCwCp5hKfEQOlxKUWm7oDuE9awAbFQkyxZbM7W0tno9Qxl4vq/NTl6xzZ7iyGXbMAQL9xyGpDUu0S+hvWWYgGt3hMIZ9BNSbADlg+qficrBUS9gLhZSg/K0S1CYt2F84dCK9o8kr/H+FHrkJ2Vtg1xY8nvRVePF6NriggQwB0aEss7DWCSXCmxlHyNN5Ie+K1y7FbYSQd3kMnMAXRlWCbXu8pRqCTXPq8PLrrq4yb95E7dK8EGrurOP4t+E6GidMnQlqYjU55LEhRJDLXOQEkGbr/OBfnCN3TQ5K7ugKSMixIKywquLBt83ZJHNnTDmh28vNyj3J24s4jMlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6E9FCrxv7CGPytZwVDRbCAwF3a52avXdKjd6SoE78Q=;
 b=Wy4KghpwY1jNwhz5WWs+L0GOLQqJgkvXmA2xA/7NUL0ATGXYmjR1Ejr6D6rXpgZ9qsbCW44fyprk3DI0lrRn+ZpP/hkKgcaQSW9VO4SZcVGPp7NuLBTV2Cb2Q+SJCH1WJCxXzGAr3jFkYEWMfCu5vqiooeXYOUAMBmiekO5Lf+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <163dc02d-321b-3288-9831-601c49f1c186@citrix.com>
Date: Mon, 5 Jun 2023 13:10:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 00/10] x86: support AVX512-FP16
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <8cbbab55-d670-5632-30ee-3e8ca352f048@suse.com>
 <d6aa8dee-49e2-1493-adb5-2adb474af067@citrix.com>
 <fc1aca4e-c333-957c-d0e2-bbb4edc7af72@suse.com>
In-Reply-To: <fc1aca4e-c333-957c-d0e2-bbb4edc7af72@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0057.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1::21) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|LV3PR03MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: aa78864d-5d51-4e9c-721c-08db65bddb51
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6f79Ws+sm83SQf7SQ6uHbQ1ardeC4NJbN/FQaqNzM6ayp7X0RmvT9U6ED8X6VmvogIgAHD9164+YFUfPt5Q5K0jLxJmbFBHr1JED1wmyNXH4YeyW1+SMBBP2wjrkMHeGCu5BRyNlrycwZ/s8Mq9ZKPeDTm0mo4dwN/Jtx8t0SAN9NcmzfMGvN2dJJX6yiqODEgs83qxWBo9YOJkeDP0Qh5Z7/I/cDjSWPqcFbrPJ7hm4LaPHk1ZNlOqYI/TPV7AThU6MSpJ3HVt++ViAILBoXVOcY6ruQBL+jS4m8rKCU2BcCVR5XH/9QPmKnJKTZb3Son0wOvbykwcM+CILa+JeW1JV7GsYLSXvvL7QaabZXizOawzSQtdTghcg6zAvyfzb5cDU6a0bYNsW9NUfmnwXGNUPOXcx7hy3XtFagd5U50jMJSCMdAxVbkv9HAzLyOOzhE1bfqZxPFy/PY2VAYObE4fTVRKbIwQ+gZj3YroZuwihhg7NY5yvMvAWq3/+yL99AeSMVDoyIruQ1sAq8uSuvhNV3Wa+O7v5D6xAsndoYfQqylpkonl7W4UtIEJiViWDd4VOONxJSABcweMs+whBjZJrReYxKZhQHBCY+QrpH6gs2ZjnmjHGKZy1UfTXhIu1DHKo8vX1H/r3yVIZEVPoOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(451199021)(83380400001)(966005)(82960400001)(110136005)(54906003)(478600001)(8676002)(8936002)(41300700001)(316002)(66946007)(66476007)(66556008)(31696002)(4326008)(5660300002)(38100700002)(86362001)(6486002)(36756003)(6666004)(2906002)(31686004)(6506007)(26005)(6512007)(53546011)(107886003)(186003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3Q4VHR1M0dCOEd3SWNKaHB3VnlYZmV5eklCblNkU0tUQmZ1TGl2WWdNOGxs?=
 =?utf-8?B?SkdndUdwUlg3MStBaVBxa0hJQWlrL2Y4K3FDRWl6RUFsUm1nd2owaHdVVXhH?=
 =?utf-8?B?a2RSYTluVkpLaEVWWkl1cU5wUGdkUklTZDZuZTR6SllVYmdpTVk3RU00SHpH?=
 =?utf-8?B?NVlwYTNOdHJDczl6WWxVUjRRTStpTHdtSG9vRzl4QWxsOUNaWEtDRmhaUVFY?=
 =?utf-8?B?RWlBcmFMZEhlWXpRLzhKcmc3bHVKVTFFNHhhTDlENFZJUnVWd1ZTdXNSSU9n?=
 =?utf-8?B?K1BZVFFlV0p3d0tjemQrejFPODJ3aEFFL0FvWEt6VDNjUk12WG9aZjdPVmt6?=
 =?utf-8?B?ZVFOdlRpSFJ0OGMwVnBNK0MzaFBCcFdRaTNENWNmVC9BWHFjTGI2T2o2YStT?=
 =?utf-8?B?cjR4OE1BRVNKaWh4Lzg0OVp6ZitBUVY3ZE8zekxNSTd5V2Z6TEVhSVk5QUE2?=
 =?utf-8?B?aVhEMjVHeWR3dlozL2Yzemdja1FxQzNYOE1HZlJXMTZpaUNmOTlRbGgrU0U0?=
 =?utf-8?B?K0tDYXA2dXRxcmdRNlJZZkRHdFhNd25yNlBzdkpSNEJidm5HK2ZlTGdta1gv?=
 =?utf-8?B?cTJHQTRGRTBtSTcyY2c0STNtWnIzcVhsSjVOK1ZRZnpmZVVHRU9wTjE1L0FI?=
 =?utf-8?B?NDBEOCtRV2NWMmhZVEUvdzI2aFppQnk2S0UydHZqMDV2bTA1UEltY2UyNEVy?=
 =?utf-8?B?aDE5bGp2YlhnM0d2V3lmaWpVY3ZqRmdITTh5VlREaG8yOGJaU042dExkbE1w?=
 =?utf-8?B?WTU3UDV4MjBteGRMM05MQ2hMVVZTOHJFM3ZYSFFBTW9IZEJqZldUVXpsMG1h?=
 =?utf-8?B?dndCdFRObFVPWmpVNVJQdDd6TjJON3NWS3J2bEtGbnlhWGV6dVlLbjFHVUh0?=
 =?utf-8?B?WlFMRFR0bGRWZG14VVh2aVFaSStNMGZ1bVdqd0tqNmNBb3hyRHZ5czRoakhI?=
 =?utf-8?B?MVFnZ3dOSFJhSFFHTnBDYnlWOUNNNVRCbHJvUmxseXdMN2pWOG1RVTlPZ2xG?=
 =?utf-8?B?b3p4UUozdVc3VE9sNldHZ0RCRzRKNHNSTUdOTlMxNnNwcnJBL0g4SFlCY3E3?=
 =?utf-8?B?Tm5JSGdGd29mRXdydGp4eXgwRnp3UWx3N0VPVGpmbXV3VmdyVGorcTFQeGtZ?=
 =?utf-8?B?TXZXQVdXVzVXaURNWWNyNWg5NjhwOHVzVVdjS205eDJBUWtzczFTazFGdEV3?=
 =?utf-8?B?YTZhZmxIMmxpampPVElFbWhOOHRvbUlFSEo1cFpJbDZyTEQxaVVKclZSeWhp?=
 =?utf-8?B?WlJuUzZPbEZ4RFFkeG8wdlNMekZaR0x0M2JqaTFCL3ovZW1xT1FJQmo5L3B4?=
 =?utf-8?B?RmVXSUdrZ2VCeVZEbGo2OWQxUE8rT0hIUWw3S3J4dnVLN21Qekpta2V4WmJL?=
 =?utf-8?B?UWJ4dXoycnlpVHlLRU14QVB1SEpWNnhEZmFDdWNieVVTcE9JVlZWenBnemRK?=
 =?utf-8?B?NHBjNkZNMTNtVkllQkNWL1NQcmhwU0JRL1RQQ0xFdW1wWW80YmJyVHR6Q2Fq?=
 =?utf-8?B?YmszY1NCV1F3dkp1WmFlemlFWnZvYjRTVlNsVzd5Q1JXTUpiSTEzYkt2TytL?=
 =?utf-8?B?NzByY29LVi9xNFVzbm85RFlWNVE5NDlVTVJFZFh5RGJSbnIyL0MxV3VCcFRX?=
 =?utf-8?B?Sk15dCtqK0xKQU5mYVVEdWxCMnZmejR5MCtSVHRUdmgvZWk2TTRZNmY2ZkhV?=
 =?utf-8?B?NGU2ZWxtM3gzbWdVYWdxS3RvLzEreXB0MllpdzFzRGVRYWlwSjYvQk9iMWFh?=
 =?utf-8?B?OW1TbXJIeE1xQmVBSHk2ZFJWcVdnNXd0QktybzlxVHhFQm42WkE5SFphcitK?=
 =?utf-8?B?T0NzZnJqUnVRZlpmNWxyK05aMC81aGhPRTlFMFV5WVA3NC83c0VHWHFha3lv?=
 =?utf-8?B?a29qeWlub21XbmVPVUlaOWZGOUN3QmsvU1FuMzZmR0wya1Vmb2htZDRCcWhl?=
 =?utf-8?B?dTBTcUhDSVlQc0tlTjRLQmFscFVjOE04ZktaMkZKQk9hT012TjhXOGhtRWg4?=
 =?utf-8?B?T1VYcVBRYk85ZkpCYllNVTkwT0Q5K1hETEhldktKakErUHZBM3BlOC81M2lu?=
 =?utf-8?B?RVZOeU1PWXREQ2cvL3psc2wrR1RvbDdqWGpKZTZmN0VYeElyMEhtbE5scnli?=
 =?utf-8?B?T3F0YTRsWDJRKytsV3FyMHpQKytWWjZqeG9wSXZJWGtmYXEzRzVBZlU1MmhD?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NtPIx3kO4mnKWZ7WSI3ooJAnmdRvFhX7vKOVcPfCuyKiSUy31GzAukjybjjIGgEYXC1HpU9j+hODW3FtB456d/eGlOSNe3RAbYwNQ5+KBlZflk7mxuGVqemeWy0mXSFGa+Ps1ve6emF1+uVb7HNyjLDP+U+OP5GX4gd1vZYCv9EOfQuu8OevksiD3QN4IGMxJVQ9kwfA6YOTAzln3x3vS/AT/0PruZ8jRvOCLhIafDG3C0+l5Vil/w1knQC76aizAEfc6hlpuUfT43xcbudykn6TXfP6FhVdIS2FmiPIapxXqYHIh/5KGEuEROzQGYINt86nP5hHR043/Aovso7LUOvqByspqNRy9SAuYn+vnjWeQsBotcE6hN+j/45Q2VUp6tlGVNSft9Cj03vckb3GaS3Dm8ZrAkjBObkzmJ4pSEFnDcC/m+1vGOnoUUfRg/JyLA4osBMB1Ei1kVzJ1fZve1qq0wS9FJs29lX8owkCpc5Tv84LiG6HSKN8vdydqb2lz2zJilR6lnSPGwdGbWRcKoC34mlmNsq429kqdwlaaWw0kIspMC6d1sZrmxyZK6qZhbuY4F67L0MHRrVZPohUGKX2h0G18RwsLAbJyMv06RUxAxK084pzow6q6EMEKDyQ7oss7q98bFR928d8QaJQVZKBVXWVUyANAWMqkOtwpRhdhss0nhNZHt661Vi6GGRC5ZXYW8tgn3PoEcO5/7ksN6ll4+JNZE4wCI5fdkVTy24oO+xOl3l3q/ODhOTVugkBxOakXCJ7BHl2icnkuRBzE7mpI9M8vAiqBOGScBiSI0f15Jg+NWl+opEktW822n46
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa78864d-5d51-4e9c-721c-08db65bddb51
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 12:10:30.8475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/MvU8p3UChy18PYAxMfTexoCOdYXg43DtHfCGr3p/pbZT5J4J2yLRzVfn5mX8HeI5xCI1qt2DelbGCTs9v6EmT5I037YYnXt2ByQtT05ng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR03MB7522

On 23/05/2023 7:35 am, Jan Beulich wrote:
> On 22.05.2023 18:25, Andrew Cooper wrote:
>> On 03/04/2023 3:56 pm, Jan Beulich wrote:
>>> While I (quite obviously) don't have any suitable hardware, Intel's
>>> SDE allows testing the implementation. And since there's no new
>>> state (registers) associated with this ISA extension, this should
>>> suffice for integration.
>> I've given this a spin on a Sapphire Rapids system.
>>
>> Relevant (AFAICT) bits of the log:
>>
>> Testing vfpclasspsz $0x46,64(%edx),%k2...okay
>> Testing vfpclassphz $0x46,128(%ecx),%k3...okay
>> ...
>> Testing avx512_fp16/all disp8 handling...okay
>> Testing avx512_fp16/128 disp8 handling...okay
>> ...
>> Testing AVX512_FP16 f16 scal native execution...okay
>> Testing AVX512_FP16 f16 scal 64-bit code sequence...okay
>> Testing AVX512_FP16 f16 scal 32-bit code sequence...okay
>> Testing AVX512_FP16 f16x32 native execution...okay
>> Testing AVX512_FP16 f16x32 64-bit code sequence...okay
>> Testing AVX512_FP16 f16x32 32-bit code sequence...okay
>> Testing AVX512_FP16+VL f16x8 native execution...okay
>> Testing AVX512_FP16+VL f16x8 64-bit code sequence...okay
>> Testing AVX512_FP16+VL f16x8 32-bit code sequence...okay
>> Testing AVX512_FP16+VL f16x16 native execution...okay
>> Testing AVX512_FP16+VL f16x16 64-bit code sequence...okay
>> Testing AVX512_FP16+VL f16x16 32-bit code sequence...okay
>>
>> and it exits zero, so everything seems fine.
>>
>>
>> One thing however, this series ups the minimum GCC version required to
>> build the emulator at all:
>>
>> make: Entering directory '/local/xen.git/tools/tests/x86_emulator'
>> gcc: error: unrecognized command-line option ‘-mavx512fp16’; did you
>> mean ‘-mavx512bf16’?
>> Makefile:121: Test harness not built, use newer compiler than "gcc"
>> (version 10) and an "{evex}" capable assembler
>>
>> and I'm not sure we want to do this.  When upping the version of GCC but
>> leaving binutils as-was does lead to a build of the harness without
>> AVX512-FP16 active, which is the preferred behaviour here.
> Well, this series on its own does, but I did notice the issue already.
> Hence "x86emul: rework compiler probing in the test harness" [1].
>
> Jan
>
> [1] https://lists.xen.org/archives/html/xen-devel/2023-03/msg00123.html

Ok.  Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

