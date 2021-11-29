Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3F1461CB6
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 18:27:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234770.407411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrkR5-0008Hb-8W; Mon, 29 Nov 2021 17:27:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234770.407411; Mon, 29 Nov 2021 17:27:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrkR5-0008FH-49; Mon, 29 Nov 2021 17:27:27 +0000
Received: by outflank-mailman (input) for mailman id 234770;
 Mon, 29 Nov 2021 17:27:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PMap=QQ=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mrkR3-0008Dz-VW
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 17:27:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cbcba49-5139-11ec-b941-1df2895da90e;
 Mon, 29 Nov 2021 18:27:24 +0100 (CET)
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
X-Inumbo-ID: 9cbcba49-5139-11ec-b941-1df2895da90e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638206844;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=/wd8qZLyn+BoZ0O2F4FMLLeQu5PyM3fJcAHlbdjVFBc=;
  b=fRpYbDkxnzxh8CE1oFdJGv3b2jA26u2npOF/M9Rrei5UP5iVxcFJtqCN
   Uwb2a+FEr6g+YWLR82UCQxwV10Lmv7bZb76tgm6H6wPLIZqUx4+JHwKNX
   113mMJzCS7axFOxFmofnInwKK3LY9llvT3+kjwlkvADTlq3T8f8UlbA1v
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: BCz/m2RYVLTKMLuC1Lc6NENofyOve4gNk2nxRPj/m+9iFY8TGh6UJ9wQkSTglQfBFiLsQAdVOj
 4l+J0DobNIx9BlozMh3+ywcTXJUc6kbjxcqAnH/5PGRpZOAZII5VjUYCE9fDf0fB3STB5sBuNV
 1JGep9fCtgDP5j+Pj6656A0FRCheoPTKCZkQcDmSDOfadH9TPU4MfAHaW4/KDoe+FHw9RL0eSy
 C1XXY3xOWSdF+9DNRF8DWzwNp3sIC4MiV3XkFYRTv4jEz7apC7p4hUJD8KdG5TTTnQKF/zPt6Y
 ejszlLl1VPl2GodhLMNzVBFn
X-SBRS: 5.1
X-MesageID: 59221656
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:txI9Ja18WdLfM+KAdPbD5Sh2kn2cJEfYwER7XKvMYLTBsI5bpz1Rn
 TQaXmHSa6zcYGv9fN8gYI3loR4OsMTdytYxSwpkpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es6wb9h2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhgPV9x
 4hAu4yMQiwgYJ/VudsEbR8FOnQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1EnMMsIdOtJIoCknph0SvYHbAtRpWrr6DiuI4Chm5u254m8fD2W
 vgFUTVxcFf6ZRRgaw0TOJFms9WTiSyqG9FfgA3M/vdmi4TJ9yRu1JD9PdyTfcaFLe1UgUSwt
 m/A537+ABwRKJqY0zXt2nCmi/LLnCj7cJkPD7D+/flv6HWZwncNThQQSVy9ifa8g0+6HdlYL
 iQ86ico6KQ/6kGvZt38RAGj5m6JuAYGXNhdGPF87xuCopc4+C7AWDJCFGQYLoV76olmHlTGy
 2Nlgfv2IDBg7bCbWU6W3b7KnyqTBjErKzIrMHpsoRQ+3/Hvp4Q6jxTqR9llEbKogtCdJQwc0
 wxmvwBl2exN0JdjO7GTuAme3mny/sShohsdv12PBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn0v55p0xWG2DaD+qXNEBz3pRaekXh4um0WGauQGp9slcXVS
 EHSoxhNw5RYIWGna6R6C6roVZ96lPK8So6+D6CIBjarXnSXXFXdlM2JTRTOt10BbWB2yf1vU
 XtlWZvE4Ykm5VRPk2PtGrZ1PU4DzSEi32LDLa0XPDz8uYdykEW9EO9fWHPXN7hRxPrd/G39r
 oYOX+PXmk43eLCvPUHqHXs7cAliwY4TXsut9aS6t4erf2JbJY3WI6OLnO56JdU6x/89eyWh1
 ijVZ3K0AWHX3BXvAQ6LdmpiePXoW5N+pmg8JisiIRCj3H1LXGplxP53m0IfceZ1+ep94+RzS
 vVZKcyMDu4WEmbM+igHbIm7p4tnLUz5iQWLNiujQT4+Y58/GFCZpo66JlPipHsUEy66lcoiu
 Ln8hAnVdoUOGlZ5B8HMZfPxk17o5SoBmPh/VlfjK8VIfBm+65BjLiH816dlI8wFJRjZ6CGd0
 gKaXUURqeXX+tdn+9jVn6GU6YyuFrImTEZdGmDa65ewNDXboTX/kdMRDr7QcGmEBm3u+aika
 eFE9N3GMaUKzARQro5xM7d31qZitdHhkKBXk1Z/F3LRYlX1Vr45eiua3dNCv7Fmz6NCvVfkQ
 VqG/9RXNOnbOM7hF1JNdgMpYv7aiKMRkzjWq/80PF/79Gl8+7/eCRdeOByFiSp8KrppMdx6n
 bd96ZBOswHv2AA3NtumjzxP8zXeJ3MNZKwrq5UGDdK5kQEs0FxDPcTRByKeDEtjsDmQ3p3G+
 gOpuZc=
IronPort-HdrOrdr: A9a23:SYJnkqmXfgZ6/ADMcpWwXOkr4QfpDfIg3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7wr5OUtQ/exoV5PhfZqxz/JICOoqTNKftWvdyQiVxehZhOOIqVDd8kXFh4hgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.87,273,1631592000"; 
   d="scan'208";a="59221656"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B0TE3dS2GqNy9FdlrgUmCXlSSnzWVTYzYU5xwwfcqSGuzA9b3x0htRKpdPt20JAZCRAAFeYU0wRwg73/hycty35oorFyVy48AryJciZlxQWbWFCjFf1+tcezEYtUxvHS7f7NMCWQIXj3Et8mzHj6L4f0zbBkMgxScbdJe7Tno/ZJdWKTdq6pVETJng5vqGTXtonlkq4tmS7od9U+6xc92wcVT8NYevhZy9j45UsWB61FWtVVieLE041ssayypnCEBq2O0GQlSgVDAQVV0CixjQPA4w/sb0PjAWIh+Cx/Kp9tS2unz9z2weKNt4bLLyVBBIWvUtBwB1q5yiUbD/S/Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVOPBGn2PEISvPbgB+SF1V5RBLA/Vzvk0b/Ik5e3xj8=;
 b=egdxCR2wYNiKIFMpXoT3rVY+hepunOU48Ru/IDcV4pZ3JK+3wDvBunHtTrRa18VzztLLxTFxhSNkodCyspIwZgSkQRrgurzfNtZMLO+Yc0T3+cGTtmpEzVAsLwlYYCDv5au8FY7zfRmMZiBVEep4kvjOUon/AOR2TOW0TykUASid/MptAJoCpP2gPPdKkyLhrwHbwa8wgGLto1eG/uMfr5rP6HX/E/lNcoXG0iymgUgoV/GQL/dHzzLEIYQ7BoutWpBBpCMMXLZQX4LNvC5BMLVCoT3mMrpVv4XQxSRYm5Df0PPGw53BdNrkAM2zdiV+BtyOtSGR3NDF4RNmAIoWoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVOPBGn2PEISvPbgB+SF1V5RBLA/Vzvk0b/Ik5e3xj8=;
 b=mrYLS6SpYvgoZ8/on8W1k4RinNWK+1J6i1/HhWw78IGtWbpAGd+0JDthLHLxUay7s0KQxZjSqlaynKirCwPQtUPlzP/x8GM9Zys2cVac42hnSrETibbFHY3VMFvycVaJBOnHYu/BxgijYKiGJFpRvazWvU2N5M1Vq2+tnB2fXj8=
Date: Mon, 29 Nov 2021 18:27:13 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Anton Belousov <blsv.anton@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Ian Jackson
	<iwj@xenproject.org>
Subject: Re: [XEN PATCH 1/1] Add suport for SMBIOS tables 7,8,9,26,27,28 to
 improve virtual machine stealth from malware.
Message-ID: <YaUNcV/KY7Tz43Ni@Air-de-Roger>
References: <cover.1638190663.git.blsv.anton@gmail.com>
 <3ad07dc366117e43a46004a03cdb963581b16fd7.1638190663.git.blsv.anton@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3ad07dc366117e43a46004a03cdb963581b16fd7.1638190663.git.blsv.anton@gmail.com>
X-ClientProxiedBy: PR1P264CA0030.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4ada1b6-da13-4ad4-8e51-08d9b35d7f01
X-MS-TrafficTypeDiagnostic: DM5PR03MB2554:
X-Microsoft-Antispam-PRVS: <DM5PR03MB25549830D895260D5840A8738F669@DM5PR03MB2554.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: muxyBkFlnnTBzKdwVjlz1Y0uuybIj0ziIk43rGNx64LXEogVplgtYifdYrlYSO/ejpg1M9+5YuMaUsJwxyDE0Jh/UyiSXtq9juRUAaD8VdC1F5DqvJyN5p1rYTGdXS9oZg5WBsV4LRvPbWPCrXwp2swv15U5I0kJRBqNmDRSU0u3BNFULpfATyvr94+vGGqcNhR1Mq6ZQGxeBqD0w4kgzSD0JNgeUOj8oUhMAOe5t2j0/wKE6D3SJpuXalxFi2JjBOy5qOmMcvmNCpDyDwBLgUWz1L581y6oa9FIYtjDNKJg7+fyx/NjG2nzA2RExSjQ+LsnbCyAsso4fZpFJkPowOwxGpaIPtzTp42l8SajJ8EZuR87F26xs9bseNdyFYc/pxWIcxiKp2KlWRMbav1u10D9w09KlbNAEPYttIFA1sG6LtAPtT2WL3u27ne0szMq7A5alE+2NagtKnNFg0gkXUKXkhoQliMa7+vkdyT3lN+uAq9toKzT0Kqcnc1MsWA/5ilL3iD6OTcTSKWsrsr5qdxwIqjELkzeDwUXECCAIx18HYDGk9C9WoyfYJDq/mk76CexDkmVXp0VPxvZ1JWmbiKnb9cOKfAkzQSntib4qwUs3b4IvE2AZwd0WR05HOYADGR0U1Hr+DIp7rGhFE1ZZAFNEJ1n3WTtvfMU9scKLhQUbnOtxLCDlRtBKbJmomazO0zTcBSRLgYv4eqYJ4QsFuq1uw/URo3IeTk9HiDL7YM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(66476007)(5660300002)(38100700002)(66556008)(6666004)(33716001)(54906003)(8936002)(4326008)(316002)(66946007)(83380400001)(86362001)(508600001)(956004)(8676002)(26005)(6486002)(186003)(6496006)(2906002)(9686003)(966005)(6916009)(85182001)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1p5VHZ0c2NqYmhydkJKaUUrUHJqcUhzbjdpUUh5cDMrblBVdTNhcWI0SzdW?=
 =?utf-8?B?TzR4bXd6djZYR3QzUHBidXBBQmRIcmxNeUxlSVZMM2JIVUdPcDZBdXExRG1R?=
 =?utf-8?B?bS9DV3l0M2VGVWhkZGpWb0dweHhYNTcrL1RpTForUWZDMFNneUt2WVFzWWJn?=
 =?utf-8?B?NG9sQkxqVW5WTnF4djk4OFBZbDdLT3ZOOGFCUGdTTUlDY1hXcHJwZzFOQ3d1?=
 =?utf-8?B?VTdwUUR4Zm82TWJaYTc1SkwzeGJmTnQwbWUzdXMybTlobTJPY0xsZjJYNDBZ?=
 =?utf-8?B?eFp1aVAwcW5wNktBZWhmSktINWJjUSt1VGpOZ0dWdHBsZjhNYjBwQ3VSYS9I?=
 =?utf-8?B?MVltYmxhQUcwTWNZYWFVZE42OHF2L0VvVGk1eVpPcU5UdzAxUXVlWGRRRjdW?=
 =?utf-8?B?NkJ3SE1aT1hxK0JxcXZCcjlqQzU5cVJkeWJ5QmtHWHFoUkRuRERsQXljaWtS?=
 =?utf-8?B?SXBwVW1qd3hSajV4TitETm12YjNzRGRKaG8wWk1KTEJFNi9GSldLTWxFSEhC?=
 =?utf-8?B?WXpWRXRINnYvZzMrNXMyMEJvSlFPREU1cGl2RkVDcy91aExtTVcrVmVYVnph?=
 =?utf-8?B?UGI4VVRCN3VQRDZ3QnhIZmY2TmRNWWhrZkNlUFVUelI5amlEMlp3cFJHMWZx?=
 =?utf-8?B?YjkrYjZ1N21BVEtaSExkZGx1UjEvcVdXZzhIMVdQUkExamlRMExWd1AvUEdH?=
 =?utf-8?B?OE9tNFBFczZtWXlqTTA0emxaWlIxRlBpQUszek9JRGlJUUMyaG5YemJGOUhE?=
 =?utf-8?B?YWpIaTNCaHdJV1dIOFd5NGxxTzVwTlIrUXFON0tQOWRUMVBUeDVMMUY1N3R6?=
 =?utf-8?B?enE1dmdrWE84dWhLa2VYR1dEakFrVnNHTzE2Mk00N2RWZ3B1emNSQ3laQ3M0?=
 =?utf-8?B?QTFXdDN3VE9BTEdGQmRCaGE1bHZZeHh6cW5yTldQQVM4RUxlN3N5Z2UreHlo?=
 =?utf-8?B?Um9ldHNwOFJuYzZUQ0h3QnJaeGpKU0g4Z3U0c0RvOW1kQldBcDZrcW93STkr?=
 =?utf-8?B?bGtTaStJNXhXeGM0MG83SXdQRStrSDV6SDFKMUFhY3UvMXNsSnhUNDhpaFRG?=
 =?utf-8?B?M3VhVCtBVHlnOU5CWnZ2T21YaGxweHJpMCtMWmg1NnU3cEVaeGlmVWVDejIy?=
 =?utf-8?B?UEFIWnFKMEN3MTdJTVZWaWRXSmJobCs0TFpHcWFIRWNQNnZFcGtnSmJzMGYv?=
 =?utf-8?B?YkRZZm1QWjlxdTFpa0YvYW9BVE5hRG9CalFMc0hmSWFxVGtubTVkOEFqSzgw?=
 =?utf-8?B?c2c5eDVjSWlWSWh5Z1N3RTl6eDZsd2F5Mmhud2QyYzlNRFl3ZnZzSzRlRWkv?=
 =?utf-8?B?eFpqRjhybTFXWGcrMkVuekJEbTd2bGFNNzN6ZUtCeThRcjBPaW5wTnlRcHJv?=
 =?utf-8?B?blh5UnpnTzBRUFpEeGpDZERydkNReWI2WUF2OWJDOEFodktzZ2lObGdrV0lm?=
 =?utf-8?B?V0pWV3p2NmZDTnh0QTFqeU1sYUVTN1R5MzdJTTN5Z1hvMmlqV0FFN2hyei9E?=
 =?utf-8?B?cTJ4ZHRKSUY5OVZ0ZzJ4RmY4RXBJaHVEcGhFc3JKajVvb3dyd3R4SHNVMGp5?=
 =?utf-8?B?WVFiQVU0d1hTZWliZkFBWW4wd3VPR1V5NDJ0b09acVlNL0crU0hmSFYya1Zo?=
 =?utf-8?B?ZEtUYUgwZ09HR3h4Sm4yZlNIajB4alFvd3ZXMC9DcjdIUXYwSXJOWnZkT3Qv?=
 =?utf-8?B?RWQrcGF5WkU3QTQvTE1VdnBpNlc2V1R2R3daM1kxeW5PVmVJUHRua2MyVExG?=
 =?utf-8?B?Q1lMVGtEY0lDTEU0VzdLZFZRWDdTeG02WVZwYVZrU0thTmJVakpad0hGWThU?=
 =?utf-8?B?Y21CRjdNNG5OYWFlUDJhZG1OZ0YrcUtzY2lnQXBXTitueVZyT3FxS2Qzbjlm?=
 =?utf-8?B?NHhVRm1xdDZEZlc4QmwvWDNvZWh2clZYL2JvUjEreG15WTB1ekFlSU56SlVS?=
 =?utf-8?B?MUlHQkpIUUsvZnAyVUJJdERRT3ZERWRkWHRFSTJJWWJOaHRuejhyWDJ5azZE?=
 =?utf-8?B?bHdIb3p0K0lUYmVPRVRWNjJsYUpFM2sxWGNUcktIV2hIOTlOZVo3VU9Fd0Ey?=
 =?utf-8?B?OEFnRzdsejZtbC9rUHZ4UjJtbGN6UXZDd2RlZys2RVo4NkFvc2l0RGJvWkFi?=
 =?utf-8?B?STR4c1pFaGVoK0hzb0g1Qmw2YzRMZG4rYlJLSnNMWTBJbngzVjVmb0llUmtM?=
 =?utf-8?Q?0J0wmWEUPM1wKMJqgna/4gs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ada1b6-da13-4ad4-8e51-08d9b35d7f01
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 17:27:19.5367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xvwxmOwE1gP7li9g8KC03DqYIaylGh2P07a2TMsqgkptCZoPx4S7DghKbbybT6kPDlBza54pTRe2oEEm3h97Bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2554
X-OriginatorOrg: citrix.com

Hello,

On Mon, Nov 29, 2021 at 12:59:29PM +0000, Anton Belousov wrote:

Than ks for the patch, I'm afraid this requires a proper commit
message and a Signed-off-by tag. See:

https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Title_and_description_of_the_patch

> ---
>  tools/firmware/hvmloader/smbios.c       | 146 ++++++++++++++++++++++++
>  tools/firmware/hvmloader/smbios_types.h |  76 ++++++++++++
>  2 files changed, 222 insertions(+)
> 
> diff --git a/tools/firmware/hvmloader/smbios.c b/tools/firmware/hvmloader/smbios.c
> index 97a054e9e3..f5e61c1159 100644
> --- a/tools/firmware/hvmloader/smbios.c
> +++ b/tools/firmware/hvmloader/smbios.c
> @@ -33,12 +33,18 @@
>  #define SMBIOS_HANDLE_TYPE2   0x0200
>  #define SMBIOS_HANDLE_TYPE3   0x0300
>  #define SMBIOS_HANDLE_TYPE4   0x0400
> +#define SMBIOS_HANDLE_TYPE7   0x0700
> +#define SMBIOS_HANDLE_TYPE8   0x0800
> +#define SMBIOS_HANDLE_TYPE9   0x0900
>  #define SMBIOS_HANDLE_TYPE11  0x0B00
>  #define SMBIOS_HANDLE_TYPE16  0x1000
>  #define SMBIOS_HANDLE_TYPE17  0x1100
>  #define SMBIOS_HANDLE_TYPE19  0x1300
>  #define SMBIOS_HANDLE_TYPE20  0x1400
>  #define SMBIOS_HANDLE_TYPE22  0x1600
> +#define SMBIOS_HANDLE_TYPE26  0x1A00
> +#define SMBIOS_HANDLE_TYPE27  0x1B00
> +#define SMBIOS_HANDLE_TYPE28  0x1C00
>  #define SMBIOS_HANDLE_TYPE32  0x2000
>  #define SMBIOS_HANDLE_TYPE39  0x2700
>  #define SMBIOS_HANDLE_TYPE127 0x7f00
> @@ -77,6 +83,12 @@ static void *
>  smbios_type_4_init(void *start, unsigned int cpu_number,
>                     char *cpu_manufacturer);
>  static void *
> +smbios_type_7_init(void *start);
> +static void *
> +smbios_type_8_init(void *start);
> +static void *
> +smbios_type_9_init(void *start);
> +static void *
>  smbios_type_11_init(void *start);
>  static void *
>  smbios_type_16_init(void *start, uint32_t memory_size_mb, int nr_mem_devs);
> @@ -89,6 +101,12 @@ smbios_type_20_init(void *start, uint32_t memory_size_mb, int instance);
>  static void *
>  smbios_type_22_init(void *start);
>  static void *
> +smbios_type_26_init(void *start);
> +static void *
> +smbios_type_27_init(void *start);
> +static void *
> +smbios_type_28_init(void *start);
> +static void *
>  smbios_type_32_init(void *start);
>  static void *
>  smbios_type_39_init(void *start);
> @@ -205,6 +223,9 @@ write_smbios_tables(void *ep, void *start,
>      do_struct(smbios_type_3_init(p));
>      for ( cpu_num = 1; cpu_num <= vcpus; cpu_num++ )
>          do_struct(smbios_type_4_init(p, cpu_num, cpu_manufacturer));
> +    do_struct(smbios_type_7_init(p));
> +    do_struct(smbios_type_8_init(p));
> +    do_struct(smbios_type_9_init(p));
>      do_struct(smbios_type_11_init(p));
>  
>      /* Each 'memory device' covers up to 16GB of address space. */
> @@ -221,6 +242,9 @@ write_smbios_tables(void *ep, void *start,
>      }
>  
>      do_struct(smbios_type_22_init(p));
> +    do_struct(smbios_type_26_init(p));
> +    do_struct(smbios_type_28_init(p));
> +    do_struct(smbios_type_27_init(p));
>      do_struct(smbios_type_32_init(p));
>      do_struct(smbios_type_39_init(p));
>      do_struct(smbios_type_vendor_oem_init(p));
> @@ -700,6 +724,66 @@ smbios_type_4_init(
>      return start+1;
>  }
>  
> +/* Type 7 -- Cache Information */
> +static void *
> +smbios_type_7_init(void *start)
> +{
> +    struct smbios_type_7 *p = (struct smbios_type_7 *)start;
> +
> +    void *pts;
> +    uint32_t length;
> +
> +    pts = get_smbios_pt_struct(7, &length);
> +    if ( (pts != NULL)&&(length > 0) )
> +    {
> +        memcpy(start, pts, length);
> +        p->header.handle = SMBIOS_HANDLE_TYPE7;
> +        return (start + length);
> +    }

Here and below for the added types: would it make sense to fill them
with some default information in the absence of any data passed in?

I'm afraid this requires some commit message in order to properly
review it.

Thanks, Roger.

