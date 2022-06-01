Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C24D53A009
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jun 2022 11:06:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.340346.565362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwKJ1-0000le-H9; Wed, 01 Jun 2022 09:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 340346.565362; Wed, 01 Jun 2022 09:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nwKJ1-0000ih-DT; Wed, 01 Jun 2022 09:06:19 +0000
Received: by outflank-mailman (input) for mailman id 340346;
 Wed, 01 Jun 2022 09:06:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s3TG=WI=citrix.com=prvs=1441e74d4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nwKIz-0000iX-Dy
 for xen-devel@lists.xenproject.org; Wed, 01 Jun 2022 09:06:17 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 161d166f-e18a-11ec-837f-e5687231ffcc;
 Wed, 01 Jun 2022 11:06:15 +0200 (CEST)
Received: from mail-bn8nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2022 05:06:11 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by DM6PR03MB5178.namprd03.prod.outlook.com (2603:10b6:5:240::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 09:06:08 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 09:06:08 +0000
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
X-Inumbo-ID: 161d166f-e18a-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1654074375;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=7NF2P2dEtgcYL12pIWo5RhfgtniCV1ntUayzxzmxbpQ=;
  b=SUTjSTvhMQx3OtPIhQO4qhWCvl3fKrVc+SzZl0nW3sDcJmLd4lqE5K33
   g3Jc2f1hK9U7kATR5NgYbHys8AoQO7scjLZ97sepLP5pS8Z/5HUO8s9kg
   af3tix6L1hvtiWaZHDdfROj7oA6EzW//8Ig+1J+b1BN1HS6LVrK5lvkQG
   w=;
X-IronPort-RemoteIP: 104.47.58.170
X-IronPort-MID: 72596194
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:M9xvAaoP9nslIsbrfA2XQHq3gjNeBmK+ZBIvgKrLsJaIsI4StFCzt
 garIBnQOa2KMWLzfox1Od+y/U0OsJbRxtQxSVFurC8yFC9GpJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrdRbrJA24DjWVvT4
 Yqq+qUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBIJP0stYFbiFiQwZRE6JK3ZbbPkWeiJnGp6HGWyOEL/RGKmgTZNRd0MAnRGZE+
 LofNSwHaQ2Fi6Su2rWnR+Jwh8Mlas72IIcYvXImxjbcZRokacmbH+OWupkFjHFp2Zgm8fX2P
 qL1bRJ1axvNeVtXM0o/A5Mihua4wHL4dlW0rXrK//dmvTGCkGSd1pDnIdGSJ/eIYv5WxGfGn
 nzgo0vlMCAjYYn3JT2ttyjEavX0tS/jQ4cTCL2Q/+ZnmkGO3XcUDAAKVFy9ur+yjUvWc/hSM
 VAO8ywi64077lW2T8LVVge95nWDu3Y0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 ne3mNfuCS1qoaeiY3uX/beJrhu/ISEQa2QFYEcsUg8t89Tl5oYpgXrnVd1kDLLzgtTrGCrY2
 CyDtiw3jfMSiqYj3KWh/EvbhCqsq4KPRQo8/Ab/RX6s9AdwbsikYOSA8kPH5PxNKIKYSFipv
 3UencWaqucUAvmlliaAXeEMF7GB/OuePXvXhlsHN5s88zWg/VazcIYW5ytxTHqFKe4BcD7tJ
 UXV6QVY4cYKOGPwNPAvJYWsF84t0K7sU8z/UezZZcZPZZ43cxKb+CZpZgib2GWFfFUQrJzT8
 KyzKa6EZUv2w4w9pNZqb4/xCYMW+x0=
IronPort-HdrOrdr: A9a23:B/gjVawxWEg3EYiE96h3KrPxvuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvoRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirC2Dlymh5rLWGwWRmk52aUIF/Z4StU
 z+1yDp7KSqtP+2jjfaym/o9pxT3P/s0MFKCsCggtUcbh/slgGrToJ8XKDqhkF8nMifrHIR1P
 XcqRYpOMp+r1vXY2GOuBPonzLt1T4/gkWSvWOwsD/Gm4jUVTg6A81OicZyaR3C8Xctu9l6ze
 Ziw3+Zn4A/N2KOoA3No/zzEz16nEu9pnQv1cQJiWZEbIcYYLhN6aQC4UJuFosaFi6S0vFqLA
 BXNrCc2B9qSyLbU5iA1VMfg+BEH05DUytue3Jy9PB8iFNt7TJEJ0hx/r1rop5PzuN5d3B+3Z
 W0Dk1ZrsAxciYoV9MMOA4ge7rBNoWfe2O7DIqtSW6XZ50vCjbql6PdxokTyaWDRKEopaFC6q
 gpFmko/1IPRw==
X-IronPort-AV: E=Sophos;i="5.91,266,1647316800"; 
   d="scan'208";a="72596194"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i9sUl/rMwpq2VLFKLnuUDCn/dHkdR8PYXDvNno1sBjToQLV/teBnEu3AyiTJHNT9b+eWO8iMoHH+iLhS5G8etBcXqJ4yjHixp0N/xPM+I+HIjT1TSv33qk3r+m1KZFA15ENbDnzRO6OcbLRjgrR2D50zZOkBGJP7K/4xlIHv3JntOlwQAp5Yh9TLsRJ6KdTekihHcLK+n3QRcOUokedyoTCuDU80mT0vpIH8shHmAPd4cNc2DxOrISRUT+JLmtlJfEm8/URDJ+YKTMOu9M4h3z5U8J095SQKIh88fHafKZSNdhchFLTO+Qjv59e0M+PLbg/I3asBQjHOcl2/wG2j7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ddtxoi3oD3OEprzkBRW5NKojO3cSePqftt7ZJcrxUeg=;
 b=OkdWbMLB9CDw9gKXmGRhvJXZ8igZmVEKG8farMcP/NmJFKUArGvNJ0KplAfsrUj+NqWEBN6XrDEiDz04sXsTX3zoeQCrOW4UH80WtVRHKeaC7LwfYdLAICL+ao+pKIt1VfxXwATyjCWc623KfB1xAceB2S0d3d5qc/8K6pPoX8MLJkCoH7GpnhXS+SlSzY5WIdczRUGNY5Exj+X6LJ+YaGj0Ps6m/UaA5VdJ4/Dll2iikw5DgD5SMe/7ACgWAjULrhWFupWksEVKaDROkCYKeHJMKi7v2GcreYBbbESe6Meg3cq97cHXnV0LOfvSsx0OdaCXQwzlYRDWZEIn0TuzUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ddtxoi3oD3OEprzkBRW5NKojO3cSePqftt7ZJcrxUeg=;
 b=OhU5xgxMHQBGiu2byatentZTD0eECI8HeEpWzoUf6LLPBYku7q4i7Vmxtr79WgaCLpU1L+RiEwAeuX6hHzZfp0UcMyQxVVUWRbA8c7lVMrGczr73elmKqDUr4lEI5dBKk5UCYDuS1zTBm4l/HBRuWQvH1lirPVnRETKtf01kGaA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 1 Jun 2022 11:06:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: George Dunlap <George.Dunlap@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Bertrand Marquis <Bertrand.Marquis@arm.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>,
	"scott.davis@starlab.io" <scott.davis@starlab.io>,
	"christopher.clark@starlab.io" <christopher.clark@starlab.io>,
	"sstabellini@kernel.org" <sstabellini@kernel.org>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH 1/4] kconfig: allow configuration of maximum modules
Message-ID: <Ypcr/N/0FpxepyTc@Air-de-Roger>
References: <20220531024127.23669-1-dpsmith@apertussolutions.com>
 <20220531024127.23669-2-dpsmith@apertussolutions.com>
 <2F13F24D-0A55-4BC3-9AC6-606C7E1626E8@arm.com>
 <4ebbb465-00ec-f4ba-8555-711cd76517ed@apertussolutions.com>
 <YpYdqglsWIlsFsaB@Air-de-Roger>
 <8F3BD9BB-EC62-4721-9BD0-3E4CC1E75A22@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8F3BD9BB-EC62-4721-9BD0-3E4CC1E75A22@citrix.com>
X-ClientProxiedBy: LO4P123CA0258.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::11) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3918cf11-a040-403b-5ee1-08da43adf76e
X-MS-TrafficTypeDiagnostic: DM6PR03MB5178:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR03MB5178A678DBD6ADA6AF9111768FDF9@DM6PR03MB5178.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JBBm/v9T1P+3omcC3UbLprP//r/xAAt5RiWz9VlxI65KF2uWlf4L23Nr+opdiLYwC+sVjhnn29HqaXbkY5A9ZHNc9KLqWGAnE+jcnMAe7FhegREgI4oJPABGDy7atAK2Bt5NBdjvSNMc+y6se5FsvwaP//LIBegOcK/3EEWqKjkC8QTUYBFfZMrsuk1N80FiL0FIWOGej01fBUKRge/lLXAZdY6aJTLDX53ssC9ms2L2LkyIQ/UgbHjsYqsnDadRCMCLdsKFivFayrLaYcFYXSGU19+XtAzzlkIqMszdlIqT/Eh+BnbrY5PYN4WYjoMWoV1Ik8DUefI9J1+Dj5/cxOj+dzy02fFPtpE4wWTUcQChAWzWgH1153cOit/gfdOf31ZceICxJs7qFfZjZhLzdNnU6c6VpAq2wiEJjvTYWQUabE2yGheB3/FbUN7c/fyMDPgYoKZPLh/GED3XP5Ur/CQ25Ne+SKCxaXwBB9nNMm4ZHkmD90MuPhNGgqAzl5MISHnw4AUkluUBv4PQiQt6butFjby9RygT84Lvk0uuQgRyhWlWHiom4JUvGQjhl9L1DSzGk1DCV8o0Xh6wUjxrtA6NiF8SgJmLvPCYbc69SLB4O8a1VTn9zY//E2t8JIXrfc8i0eCYjhZO1xCjoMF6Xg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(4326008)(8676002)(85182001)(86362001)(83380400001)(508600001)(6486002)(2906002)(9686003)(26005)(6512007)(6506007)(53546011)(6666004)(316002)(66556008)(54906003)(66946007)(66476007)(38100700002)(33716001)(7416002)(6862004)(5660300002)(6636002)(82960400001)(8936002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWFFTldWNzFkVjBtd1pYQzdUcm9qTXdoRnVDMTZJRzdBNjBxbnhEVDd6MUU0?=
 =?utf-8?B?NnpQMk1yS3dtZEhhSmovZDY5N1BHOHp5UW1NYlZnUkJxZ1dQOXhJbjUycXJx?=
 =?utf-8?B?QkFiYTEva1NYN0M5SFBmcFBzekJleHNpc2ZYLzZJSTR0bWZybGdsQ3NiMS82?=
 =?utf-8?B?b3R3WDV3Zlh4cFNTTGUvaEN3V2lsMHUyUGhSeDRWVG5iUUlKUFMvQmZYYnBP?=
 =?utf-8?B?TjA2YWh6eXZyUldRYXByVC94dU9tbk80c0gwL1R1QTR3czRDY1A3V1dURjVw?=
 =?utf-8?B?K2w4K3BOcUxtclFxL0F1UndKR2htMU9wQWMvcXY3ZHlPeFI4Y2lGM2wzWVpT?=
 =?utf-8?B?WEdsQTRWanVOdWVIWUhJNURjZUtTSTRheE5LQ0dicUoxS0FWT3dPbzJia2Vq?=
 =?utf-8?B?ajFaOHV2Sm1QZmszdDcvVHE3WW4waXA2ZVhnSklvM0N0OFpYK0wyQ0Y2MnBH?=
 =?utf-8?B?eXF4STdHaFhDd3F1ME53Ry9qaUJraTN3N0wzdzRkVTF4d2pxMlNCSGUva2Jk?=
 =?utf-8?B?ZTF6NTB0eTFnY1lGbmJ5RWF2WjhwSnJoU01MUVp1bzhvSEUrSDNjZ2ZQbnBQ?=
 =?utf-8?B?bmRsSGk1TXhkdWM0NjdHa1lwdXpLbWFqOENIdjV2NGxPNVpQd0ZxQlJmWEFX?=
 =?utf-8?B?Y1NXVVRlb3RBajhPMzJzRXgzZ2g1UFdNSC9oRTdNZmF3bHVKZng4QVhGVHc2?=
 =?utf-8?B?L3Z6SndIdWRpcG9kR0lpLzBNb3FIelZUS0lRZlZmcmtKUGRHOTFod3U3UkNj?=
 =?utf-8?B?allzbFFYcDhkNGN1MlZDS2tVdENQa0w4L3Fab2pjV2YzK29wTTRuSmNCYm5w?=
 =?utf-8?B?em1PZWVBd2ludGt6ZHBsTkJzVjkvbzY5VUY4MitEdkwxVm80Z1ZvcFRsazdw?=
 =?utf-8?B?dklqMkt4cGFwVUd4VjYzaEgzOVNhdDdyQnQrd3hLYjhmNW54MDBUQ3RPR3Br?=
 =?utf-8?B?UUUvZFhKM3VPODB5MDNrVGNXYmU2NkN2QllSL2hORjlmOHhCY29lcEF6M01n?=
 =?utf-8?B?UWRQU3R1VnJBUkNuUTJ4dHdFcFVVUVZDVmhNRjhQQ2I1aFBwU1FudWhVU0lP?=
 =?utf-8?B?Z1hUNXIxM2NFTGdWWmcwVmZ6SW4wTVRKUHgyemJmMjVQd1pGazRkZzNYSFdW?=
 =?utf-8?B?c3ZsbzVYU2tuQjJBU1ROZDFqZkpGei94UzVhd3lMNnFLYjBpOVg4YnZjYkdi?=
 =?utf-8?B?K0dUa2RtK01LN1hhOUs5MGtNQm4xVEpTNkRNMWZ1YlFVZ0FHUU9SaVd2SVRW?=
 =?utf-8?B?aDN1bnJDVFVPZXJjTFFVWGNvV0NVcEJvTFJybGtWdGZvKzVOKzZKdHFVbzJS?=
 =?utf-8?B?YS9XbmUwbGs2cXJCeVluNW5zK1Y5M1NFL2FOT1gyd1hwdzRTMzlIWHBLZS9p?=
 =?utf-8?B?eWdFejhDVWk1aEp1dk93bllFTmVhZ1lGT1c1cnU4UURjU0V6enB3L2I3RlZU?=
 =?utf-8?B?VHUxV0FZSXhuWENjQ0JSZ3daNUVxd2xXeTNaUEFZNkNnZ3c3WmpQa2Jqa2F4?=
 =?utf-8?B?MmxSUzhjakJhVkttNzBSdDgrV0NmLy82Qm8zbndZK29XWFRjeCt4ckR6VWt4?=
 =?utf-8?B?bmh4ZkVGY0l6eEE1RTBadFpka1lmS1lnaTZ4QkZuVERjNlBuQld4SFQ5QmJo?=
 =?utf-8?B?VmFnWVBWbWkrdWJxWEwvazVKWGErZWxFRGdZeWVORS9pK3BxT1Ntak5XZnB6?=
 =?utf-8?B?cVhFd3k2TUdZdjg1TWp2MTNFS0tMUVJJL0lFNUlDcDFEZ1o0a3VtSk40TnFy?=
 =?utf-8?B?TGxLRDVhcThZSE9hS09LaUlJZlhxVFptK2hCYjluZDB5MGxOMFhzcDhMOWVV?=
 =?utf-8?B?Q1czeW5WRkRqZkF1MjhuWm52V0dTc1lhSmtOWlNpektFS1pkOERhYU44VmRl?=
 =?utf-8?B?TU4vZjdYbEFjWjdOT1ArNE5Mc1oydytzcDRNV3JuRU5VSk5WendUMjNJOWNH?=
 =?utf-8?B?MXR4azRnT1kwUCtmTS9od29ZajJha2JMN1JsNzU4UEZYSXJFbnF3cHJ5VEJa?=
 =?utf-8?B?VDhUY2Z1eW1YTnBFNytFVWorL2N4Y01CQVZSWXZiS1JzbDNPR1hGVDlWNDJB?=
 =?utf-8?B?R3NqNHZhZXpheGVyQllCd2tPZnZGSnhjR3Q5VkQzY3NON3B4YVNXdDk3NkMz?=
 =?utf-8?B?U0RSZXlzQnVtR1VQZ1VVZkxQQ0xFaFV3OVZsRDN3OStES2FTNmVTb0tUejJE?=
 =?utf-8?B?QUNQL29yZFU4clpEN2o0NHFVekEzcnMxV21QNStVVDVYa1JPTTJ6L09mS0JK?=
 =?utf-8?B?VmJZVEZtZ29xaEc1aWhFQjFBT1luQ2FMTERGU0J6cWs0bHl3WEJKWVdrZjBF?=
 =?utf-8?B?SlhkaVo2SW54NitZQmxwdkE0WFlaU1VKd0svaHlYKzhmVHkvYjVoWTdVSm5F?=
 =?utf-8?Q?mraVk9zePV3nsFEs=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3918cf11-a040-403b-5ee1-08da43adf76e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 09:06:08.7048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j8XviSKXNeIioZseUSB/RPd2uDKtkYzS5m/5jqKGjn0fspo5GmcizYOAVWEQ9OEplxCpjdmJVFuOwp6FukIkaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5178

On Wed, Jun 01, 2022 at 07:40:12AM +0000, George Dunlap wrote:
> 
> 
> > On 31 May 2022, at 14:52, Roger Pau Monne <roger.pau@citrix.com> wrote:
> > 
> > On Tue, May 31, 2022 at 06:45:52AM -0400, Daniel P. Smith wrote:
> >> On 5/31/22 05:07, Bertrand Marquis wrote:
> >>> Hi Daniel,
> >> 
> >> Greetings Bertrand.
> >> 
> >>>> On 31 May 2022, at 03:41, Daniel P. Smith <dpsmith@apertussolutions.com> wrote:
> >>>> 
> >>>> For x86 the number of allowable multiboot modules varies between the different
> >>>> entry points, non-efi boot, pvh boot, and efi boot. In the case of both Arm and
> >>>> x86 this value is fixed to values based on generalized assumptions. With
> >>>> hyperlaunch for x86 and dom0less on Arm, use of static sizes results in large
> >>>> allocations compiled into the hypervisor that will go unused by many use cases.
> >>>> 
> >>>> This commit introduces a Kconfig variable that is set with sane defaults based
> >>>> on configuration selection. This variable is in turned used as the array size
> >>>> for the cases where a static allocated array of boot modules is declared.
> >>>> 
> >>>> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> >>>> ---
> >>>> xen/arch/Kconfig | 12 ++++++++++++
> >>>> xen/arch/arm/include/asm/setup.h | 5 +++--
> >>>> xen/arch/x86/efi/efi-boot.h | 2 +-
> >>>> xen/arch/x86/guest/xen/pvh-boot.c | 2 +-
> >>>> xen/arch/x86/setup.c | 4 ++--
> >>>> 5 files changed, 19 insertions(+), 6 deletions(-)
> >>>> 
> >>>> diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
> >>>> index f16eb0df43..57b14e22c9 100644
> >>>> --- a/xen/arch/Kconfig
> >>>> +++ b/xen/arch/Kconfig
> >>>> @@ -17,3 +17,15 @@ config NR_CPUS
> >>>> 	 For CPU cores which support Simultaneous Multi-Threading or similar
> >>>> 	 technologies, this the number of logical threads which Xen will
> >>>> 	 support.
> >>>> +
> >>>> +config NR_BOOTMODS
> >>>> +	int "Maximum number of boot modules that a loader can pass"
> >>>> +	range 1 64
> >>>> +	default "8" if X86
> >>>> +	default "32" if ARM
> >>>> +	help
> >>>> +	 Controls the build-time size of various arrays allocated for
> >>>> +	 parsing the boot modules passed by a loader when starting Xen.
> >>>> +
> >>>> +	 This is of particular interest when using Xen's hypervisor domain
> >>>> +	 capabilities such as dom0less.
> >>>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> >>>> index 2bb01ecfa8..312a3e4209 100644
> >>>> --- a/xen/arch/arm/include/asm/setup.h
> >>>> +++ b/xen/arch/arm/include/asm/setup.h
> >>>> @@ -10,7 +10,8 @@
> >>>> 
> >>>> #define NR_MEM_BANKS 256
> >>>> 
> >>>> -#define MAX_MODULES 32 /* Current maximum useful modules */
> >>>> +/* Current maximum useful modules */
> >>>> +#define MAX_MODULES CONFIG_NR_BOOTMODS
> >>>> 
> >>>> typedef enum {
> >>>> BOOTMOD_XEN,
> >>>> @@ -38,7 +39,7 @@ struct meminfo {
> >>>> * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
> >>>> * The purpose of the domU flag is to avoid getting confused in
> >>>> * kernel_probe, where we try to guess which is the dom0 kernel and
> >>>> - * initrd to be compatible with all versions of the multiboot spec.
> >>>> + * initrd to be compatible with all versions of the multiboot spec.
> >>> 
> >>> This seems to be a spurious change.
> >> 
> >> I have been trying to clean up trailing white space when I see it
> >> nearby. I can drop this one if that is desired.
> > 
> > IMO it's best if such white space removal is only done when already
> > modifying the line, or else it makes it harder to track changes when
> > using `git blame` for example (not likely in this case since it's a
> > multi line comment).
> 
> The down side of this is that you can’t use “automatically remove trailing whitespace on save” features of some editors.
> 
> Without such automation, I introduce loads of trailing whitespace.  With such automation, I end up removing random trailing whitespace as I happen to touch files.  I’ve always done this by just adding “While here, remove some trailing whitespace” to the commit message, and there haven’t been any complaints.

FWIW, I have an editor feature that highlights trailing whitespace,
but doesn't remove it.

As said, I find it cumbersome to have to go through more jumps while
using `git blame` or similar, just because of unrelated cleanups.

IMO I don't think it's good practice to wholesale replace all trailing
whitespace from a file as part of an unrelated change.  If people do
think this is fine I'm OK with it, but it's not my preference.  Just
raised this because such changes make it harder to use `git blame`
IMO (have to remember to use -w, but that won't help people using the
web interface for example).

Thanks, Roger.

