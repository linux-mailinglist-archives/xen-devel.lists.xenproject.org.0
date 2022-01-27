Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F357649DC77
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 09:23:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261295.452248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD03Q-0007CQ-7s; Thu, 27 Jan 2022 08:22:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261295.452248; Thu, 27 Jan 2022 08:22:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nD03Q-00079u-4d; Thu, 27 Jan 2022 08:22:52 +0000
Received: by outflank-mailman (input) for mailman id 261295;
 Thu, 27 Jan 2022 08:22:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9wmt=SL=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nD03N-00079k-P0
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 08:22:50 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b9cd2a3-7f4a-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 09:22:43 +0100 (CET)
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
X-Inumbo-ID: 4b9cd2a3-7f4a-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643271767;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=EJ7BMsDVn5BfVRvqTIlHUesTbdGl8VjwcDwNOTmq/jM=;
  b=Lfw9zOwnP49QzlF5HAS/7YDxCRtlXwYunaDXvnQ/v89KhNSixC7OuuwG
   kMk+PBK7qn9YmcYJu/RQhdrhoKmoXN8O/fnZyzX0K5wrT4wmm1CTk31RJ
   EMwXTivPW1j5++U4ws+1rUuPrHoof5H+mtdfAaVED+BNyHDtVMXKtTy6H
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: i2ytqYmjw/nn2ZfamQEBAYynoSlV3/6U0bU4HwSJNRia+YjD2VJp9LNlzE0h+C+sql24nwSSLI
 CHtAwc4gevaaBUKuNzFxBhY4w9EMDqFNp7ogygNMFk2FGKh8+iLf5PjVgfML3c7aK8TiR7eEzd
 lx5Fpy01ob6h0me8ky9VyndCnR9Mg4crpPPay0mF6zE7AU5ttutOjMYxqErQ+HrGT2PyW9v4VZ
 1z939l64hCXUCznZ5pM3LL0id/1zvLoe3Sjj0uJcR9l7GViK0Fpwp7r7QWI6Uh7mlILttRoTYC
 wp42GZeNqhjEFO7qWry11kL+
X-SBRS: 5.2
X-MesageID: 63277558
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TTnb76jyol1QSidi2O/ldu4EX161KhYKZh0ujC45NGQN5FlHY01je
 htvXj+HPf2MZzSke90lbom+oUME6p/cy4BhSAY+qSE8ECMb9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0GE/NtTo5w7Rj2tcy3oDga++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /13raaORDoTOpHOu8UsaxkDAn0mHL1JreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHxO4wSoDd4xCzxBvc6W5HTBa7N4Le02R9u3ZoRQquDN
 6L1bxJgMRDnWjZ/PGsII41ipdX3vnPvTmxH/Qf9Sa0fvDGIkV0ZPKLWGNjfd8GORM5Vtl2Fv
 W+A9GP8ajkQOcaD0zOD/jSpj/XWgCLgcIsIEfuz8fsCqEWa22g7GBAQE1yhrpGRlUqWS99Zb
 UsO9UIGtrMu/UamSt38WRyQo3OeuBMYHd1KHIUS+AyLj6bZ/QudLmwFVSJaLswrstcsQj4n3
 UPPmMnmbRRRt7mSRWOY562jhzq4MigILkcPfSYBCwAC5rHLopw3jx/JZsZuFuiylNKdJN3r6
 2nU9m5k3exV1JNVkfXglbzav96yjqLRdDA42z/TYmCGzzJBZNW0O9SJ+VeOuJ6sM72lZlWGu
 XEFne2X4+YPEYyBmUSxfQkdIF26z63baWOB2DaDC7Fkrm3woCD7Iei89RkjfB8BDyoSRdP+j
 KY/Uyt17YQbAnalZLQfj2mZW5VzlviI+TgIu5npgjtyjnpZKVfvEMJGPxf4M4XRfK4Ey/xX1
 XCzKp7EMJriIf47pAdavs9EuVPR+ggwxHnIWbfwxAm93LyVaRa9EOlZawHVNrtnsfvZ8W05F
 uqz0ePQlX2zt8WlOkHqHXM7dwhWfRDX+7iowyCoSgJzClU/QzxwYxMg6bggZ5Zkj8xoehTgp
 RmAtrtj4AOn3xXvcFzSAlg6Me+Hdcsh8RoTYHJ9VX71iylLSdv+t883KspoFYTLAcQ+l5aYu
 dFfJZXZahmOIxyakwkggW7V9dw7K0/z1FvQZkJIolEXJvZdeuAAwfe9FiPH/ygSFCun88w4p
 ryrzATARpQfAQ9lCa7rhDiHnztdZFARx7B/WVXmON5WdBm++YRmMXWp3PQ2P9sNOVPIwT7Dj
 1SaBhIRpO/spY4p8YaW2fDY/tnxS+YuTFBHG2T77KqtMXWI9GSU3oIdAv2DeirQVT2o9fz6N
 /lV1fz1LNYOgE1O79hnC79uwK9nv4nvqrZWwx5KBnLOa1j3WLpsLmPfhZtEt7FXx68fsgyzA
 xrd9t5fMLSPGcXkDF9Oe1Z1MrXdjakZw2CA4+40LUP24D5M0ICGCUgCbQORjCF9LaduNN93y
 +kWp8NLuRe0jQAnM4jag3kMpXiMNHEJT44uqooeXN3wkgMux1xPPc7cByvx7M3dYtlAKBB3c
 Dqdha6EjLVA3EvSNXE0ECGVj+ZagJ0PvjFMzUMDeAvVyoaU2Kdv0U0D6ykzQyRU0g5DgrB6N
 WVcPkFoIbmDomVzj89ZUmHwQwxMCXV1IKAqJ4flQIEBc3SVaw==
IronPort-HdrOrdr: A9a23:jjQVPqAOh8+h/1XlHehCsceALOsnbusQ8zAXPh9KJyC9I/b2qy
 nxppgmPH/P6Ar4WBkb6Le90c67MA7hHP9OkPMs1NKZPTUO11HYVb2KgbGSpgEIeBeOiNK1t5
 0QC5SWYeeYZTMR4LeYkWuF+r4bsaa6GcuT9IHjJhlWPGVXg/YK1XYENu/XKDw/eCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8zOvcfCmp7KaQMPQ0dP0njFsRqYrJrBVzSI1BYXVD1ChZ8k7G
 j+igT8ooGuqeuyxBPw33Laq75WhNzi4N1eA9HksLlfFhzcziKTIKhxUbyLuz445Mmp9VYRid
 HJ5ywtOsxigkmhCV2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TtugPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4ckWUmxjIVLH48JlO71Gh+e9
 MeT/00pcwmPG9yVkqp8FWGm7eXLzYO9hTveDl3hiXa6UkSoJlD9Tpp+CUopAZ0yHsMceg02w
 36CNUaqFg3dL5sUUtcPpZ2fSLlMB2FffrzWFjiU2gPUpt3f07wlw==
X-IronPort-AV: E=Sophos;i="5.88,320,1635220800"; 
   d="scan'208";a="63277558"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfD0IS1KBUAzifJFY7qifaH02XfxzJVljTC6QmCaprmfY38zIsZhPH196rFJutqfyl6Xu2YhqiYhrKOnaSyBwfjdQ0hzCXDNuUPJTxNt7DWxFbBOykDb3IY9k42Bi3Q/IeGp0H8I2vMNDjX7sCf6IAGy8mA2Gmc/zuyf2CUkNew1goitW6KXa7f43XI4w2I/2GC3Ft+oxP1RrORHbpQ0z9CIK3NKtS2d+dES93WkIaHkmKy7V+5tnTmN/qjjItIgRFkOj665fK5op3ioPhPqzuRu2UtgUpwh37N9v+eurJl9mz5ZIY/DyXj9Ylb8Cn1w8fgSNdAGx8472GUWRn2YqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6tkCapznQWJ8ExDQRvBzeDu8ghGeLcH/K+PaPNmFKp4=;
 b=aUZRUZnJeFSP7piYyWT4L8LD9uvmsFHAT+moXahwC/ebxvmrfRuwFWHslNurUUW6FAEUldYboAgacoVbItNrN8PXNjAJGmzfheJ1JzeYFSzKvAibmBozOzvpLecgcuqDr2U4pWlcly2J/thhIqjf46A3gF/2Cd+rfJeqcAlhmKRxyGNoMJofpcWn3x6K+229pKPpNECiHcmiY/Y4pplgJdlAt7yUkOIFr45wSVlT63TMSkBXvOY2NPshYIZRLaOJzlGfuBBUDFpJS3siNmcU6xJltOSa2ULZVf3xK1XJer8CPyC4dQGdTOcDPjRlecwErb54poZt/XcNHHJpAPTr5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6tkCapznQWJ8ExDQRvBzeDu8ghGeLcH/K+PaPNmFKp4=;
 b=qhlR4VGLNQXf0C3w8BVP4gXYjGynbT/gstA72aJolTctqFbhphM0Bx1J6k+WyDtT8Ldubf3Syvy72veyYfdfTxyXSKvr1EhPIP60JRRXU1kR9lJiTyt8jc9F4htDfEL8XPKpcssvDV2/1FDNE4sBT1J/0oEPuOukElKKYUuqsSU=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: [PATCH v2] xen/pci: detect when BARs are not suitably positioned
Date: Thu, 27 Jan 2022 09:22:18 +0100
Message-ID: <20220127082218.57902-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MRXP264CA0007.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e9b2002-b88d-4d92-982f-08d9e16e29c6
X-MS-TrafficTypeDiagnostic: BN8PR03MB5140:EE_
X-Microsoft-Antispam-PRVS: <BN8PR03MB5140E353425F017EDFAFB7398F219@BN8PR03MB5140.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:248;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6lsUfyYCNK/l4R4TvvjHDWJMLRjcI6jXsOetdB00YAcSGzpcJNYuJJLIMREPcxp2q+x4K3faZlFF1AR2gwupdiz41BQAKJZiExGnyGErIxmB5GVBqQ5sqPLXf5wmzEnakx6qyfvzirfJIMoXoWu/QIOzs7CiXnjAzZMcA7wHotyEo74PvbZxn54XVbqdCokavJ9VORL/MvL+04MVnOTbTxRHEJdJkN9sWogtFV8VO9B01sw1DubDdeAoylIFyNGCLmlTj27HDL29IKTSZuAKXhYqGYjxNk9GCDMooy3zs0cZvmcf4CY+QGLbsWzG2h5Mn0Ebr/jE6oIXuqBIhm40JxRIsvEXdSGhD8o1lcduV274Ct1cswHvaLPcpi9Xwt3PcYe1pBEQpb3qZLFwwArpynFDNaPbesGDYx5S+aTFNY33c2Ec2SH45Oi5xrJXGETwz8eI0gGJpztxx90Dd/NkIKjXtZRvZwdHL4Sc1iokb+QbtqdeKWIK6wfzlFXSNVCI6ous+BqzbC18lI0T82FZkaAqKsbemamYFG0/TerKQu5ovrCHVEKmycCLRR1/m4cW7e8HEAtG9NuSk0fGJIwxPq2fD2GCORePIbvyvEyQ5ZZEU1/70JO1OLDu4dWK0NxqIuU6GCepSc8R+PHpg3goTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(86362001)(2906002)(8936002)(8676002)(316002)(5660300002)(4326008)(1076003)(6486002)(6666004)(6506007)(6512007)(2616005)(186003)(26005)(6916009)(508600001)(54906003)(36756003)(83380400001)(38100700002)(82960400001)(66946007)(66476007)(66556008)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVUvYU5oQjM5UXlwUzhWcGxKaFJSVFpucC9KRFRxZjJUQndSR012SEdxOER5?=
 =?utf-8?B?REZTbys4MFg5K2hMWjB2MEtoS0FWdGQwT2I1OThlYTV1L285MS81UXkyM0dZ?=
 =?utf-8?B?NzRzbzFFRlZGSVdxd0lpNzZqS1dpL2VBTTBHb1RLMlBuRTN6SnA2bVhuMjlv?=
 =?utf-8?B?Vit3MnFyNEZvUm5NbDdBN2VFTkhnbG9ISDZGQWZuTllHMnhVa2NtblI5QVFv?=
 =?utf-8?B?UTdjajVuNlRMdW91TDRtU1c1SEhHb09RM2l2WS9sNE8xbFZWemV6VVBkYnRR?=
 =?utf-8?B?T1hDTjVYSGRwNXV0MFA3aml5MjY5ampzYTA5d1VNY2RPN0o1YXNKbzVvNlZz?=
 =?utf-8?B?RVoxZjVZek50ZFdsTHdEVVVGL01pcWh5aTJkVDNHOSt0MHZaWUNoK3NsV0ZU?=
 =?utf-8?B?eElsK1JRU0k5WkFzNlVNcDQrYVY4NTkyMFVSZlB3L2pQV3hoaDIxZzZjVHFT?=
 =?utf-8?B?QXNKaC9WVG1IZS9vb1VXK29hUXhmVzNDUEZNR1Qyc2FzNUhoOFNlRTNOdThW?=
 =?utf-8?B?TXJFOURiY3NNNGU3R0ZrUWJCRDR5Tkh5SVA5NUVGTWhpYWdZcDVyd2laeHNY?=
 =?utf-8?B?Yk40WVlVSExrbmEwaVVvMWp1azZYcDVPNU0zend0c0M4UGVzVnZTQy9kelNi?=
 =?utf-8?B?dUwwVUxuUTZkOUl2a3BlVzMzZkxLb2xzMWRyNUJUQmNNYmVCT2Z6Z3NGczEy?=
 =?utf-8?B?REFsUmZUOG95ZlFZU0JMY2NYWWZ4K3hCc2tvaWVqemFsRGRvL21DUnU5UGpP?=
 =?utf-8?B?VFVpQU53dmtJYzE1bmFFWGk2Mnkrbkt4WnRhaTcrWWlGQWM5Zk0zZ1RhWkxO?=
 =?utf-8?B?VkR1Q3gvWHE2WlAxb1djR2w0NExnRFV5ZVNXN1dreTQreTlEVUJsUFFyb09m?=
 =?utf-8?B?L21JdlJNZ1VuTFNQSW1xalFmdWw0TmdCOVBCcGRldU1tTlpZNDh2ajM0MmNk?=
 =?utf-8?B?OExYOE53WFhGR2pDMlNmSmdLRGRGeFNhcTJ6TS9zZ3o1S2Rzc3VaRm9ybEg3?=
 =?utf-8?B?V1FXM2RLNXVzOE5qT0oxRGl3a0owRXMyd3k3dXJkTzVFK2grRTAxT2Rndmc2?=
 =?utf-8?B?RjM2YXVQRHpUUXluRXJFeXhSZU14UXVEQ3NyRmRXdzVrcS9RU2ZuUEdWcGJM?=
 =?utf-8?B?c0JYb2puSVk3WWhvSEF6dyt0Zk1nakg1QVY5OTF5YUNoWmFvY1lycUNiVjly?=
 =?utf-8?B?RlZqOWQ3YStEWWVlZnVYZWgrOC91TkJnamZKZmVnT0NWeVVhbHVmRVMrN2RR?=
 =?utf-8?B?Sm8weXo3ZWxQK3h6RCtOekZZQjQrWUgzOEZyeFVJbGU3d0ppbDI0eFEwOXlj?=
 =?utf-8?B?bmZiUUo1dUE2VnBSN0lOeDAxV2EyL2FaS3VmUHA4enNBcHROYzR6K3pMRjMr?=
 =?utf-8?B?dU1OSWNTWCt4eHViTWVGNThVK0RHa1hCbSt5Y01YN3JicU5MOEdZS0g0SWFW?=
 =?utf-8?B?eWx4SGRiMmdtVXlJcXYxalhXSnhzZ2gxa3ZkMjdxbEQzeDEwVlZpcG9xUVVM?=
 =?utf-8?B?UHZDNGVRMEpReHZ3VXowQTF6Q3NmbEQxU2xGMHVmVmRhenFWb214S0dyNEs5?=
 =?utf-8?B?bVJYalJTZC9XcERLMEYzbEV4N1JUUHpYNmhRMHJ1OVVSMk9hQVRITS9iWW9m?=
 =?utf-8?B?ODc2M3J0Q3hlWTlleE81NGpxZXM3RHc1bnZEZjZpOHdwSU1nSDJsMDJSWDB2?=
 =?utf-8?B?dE5mWis2d3R6Qm9zUVQ2Y1FhdmN6OTVyK05OeHc5aGF0LytjNlF2Q0owNzhL?=
 =?utf-8?B?cVlZaitvN2xDYWIzRGdrTjJ6SzN4MHpLNkZsVlVuNEQ4WUxOUzJlQzlVcnlz?=
 =?utf-8?B?N3FVL1ltOXZIVktDVEdyU09hTmdiZ2UwaXVNZk0ybmJSQTYxR3NjOEpRUWNM?=
 =?utf-8?B?Umd6SGI2dEpsZmpXZzVXNEYxbXowdG9zSDBVMnVIbXJINXBscGM2Rys3NlhD?=
 =?utf-8?B?bkpLN3ZFNVNBdFNFVDJqMHNIeTlNK2k5a2tzYk1XUi8zemF1aVAwZWVlVFNv?=
 =?utf-8?B?UDA2Y1VHc1g0Kzg0aExVUHQwZjhrUUliUDBScm1BbkNONURZT2drNDVxZ0l5?=
 =?utf-8?B?SHVlazZZbkRyUko0Q2FMK2FhVCtyejV4V0oybGpYVXlld05Lb25semNoMzdN?=
 =?utf-8?B?QmZCSjZXalRZRG5YQzJKNlNSaWR3OWZjQXlPbkJET2VyS3dzWHljdWtrZnVs?=
 =?utf-8?Q?0xOZUD8JCjrfwA3xlIfU5VA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9b2002-b88d-4d92-982f-08d9e16e29c6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:22:31.5512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ukt0wKS6QOb/w/1uaT8BNTp18HgN15j4/In88h5QSd89Rm0H3Zo5HSP/C45LmwmKnD43Bu1xnsI6IjihS+E8JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB5140
X-OriginatorOrg: citrix.com

One of the boxes where I was attempting to boot Xen in PVH dom0 mode
has quirky firmware, as it will handover with a PCI device with memory
decoding enabled and a BAR of size 4K at address 0. Such BAR overlaps
with a RAM range on the e820.

This interacts badly with the dom0 PVH build, as BARs will be setup on
the p2m before RAM, so if there's a BAR positioned over a RAM region
it will trigger a domain crash when the dom0 builder attempts to
populate that region with a regular RAM page.

It's in general a very bad idea to have a BAR overlapping with a RAM
region, so add some sanity checks for devices that are added with
memory decoding enabled in order to assure that BARs are not placed on
top of memory regions defined in the memory map. If overlaps are
detected just disable the memory decoding bit for the device and
expect the hardware domain to properly position the BAR.

Note apply_quirks must be called before check_pdev so that ignore_bars
is set when calling the later. PCI_HEADER_{NORMAL,BRIDGE}_NR_BARS
needs to be moved into pci_regs.h so it's defined even in the absence
of vPCI.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Add comment regarding pci_size_mem_bar failure.
 - Make e820entry const.
 - Move is_iomem_range after is_iomem_page.
 - Reword error message.
 - Make is_iomem_range paddr_t
 - Expand commit message.
 - Move PCI_HEADER_{NORMAL,BRIDGE}_NR_BARS.
 - Only attempt to read ROM BAR if rom_pos != 0.
---
 xen/arch/arm/mm.c             | 11 ++++++
 xen/arch/x86/mm.c             | 17 +++++++++
 xen/drivers/passthrough/pci.c | 69 ++++++++++++++++++++++++++++++++++-
 xen/include/xen/mm.h          |  2 +
 xen/include/xen/pci_regs.h    |  2 +
 xen/include/xen/vpci.h        |  2 -
 6 files changed, 100 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index eea926d823..4626e9eb8b 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1625,6 +1625,17 @@ bool is_iomem_page(mfn_t mfn)
     return !mfn_valid(mfn);
 }
 
+bool is_iomem_range(paddr_t start, uint64_t size)
+{
+    unsigned int i;
+
+    for ( i = 0; i < PFN_UP(size); i++ )
+        if ( !is_iomem_page(_mfn(PFN_DOWN(start) + i)) )
+            return false;
+
+    return true;
+}
+
 void clear_and_clean_page(struct page_info *page)
 {
     void *p = __map_domain_page(page);
diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
index 1397f83e41..3f451134c6 100644
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -783,6 +783,23 @@ bool is_iomem_page(mfn_t mfn)
     return (page_get_owner(page) == dom_io);
 }
 
+bool is_iomem_range(paddr_t start, uint64_t size)
+{
+    unsigned int i;
+
+    for ( i = 0; i < e820.nr_map; i++ )
+    {
+        const struct e820entry *entry = &e820.map[i];
+
+        /* Do not allow overlaps with any memory range. */
+        if ( start < entry->addr + entry->size &&
+             entry->addr < start + size )
+            return false;
+    }
+
+    return true;
+}
+
 static int update_xen_mappings(unsigned long mfn, unsigned int cacheattr)
 {
     int err = 0;
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 0d8ab2e716..07753109e0 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -233,6 +233,7 @@ static void check_pdev(const struct pci_dev *pdev)
      PCI_STATUS_REC_TARGET_ABORT | PCI_STATUS_REC_MASTER_ABORT | \
      PCI_STATUS_SIG_SYSTEM_ERROR | PCI_STATUS_DETECTED_PARITY)
     u16 val;
+    unsigned int nbars = 0, rom_pos = 0, i;
 
     if ( command_mask )
     {
@@ -251,6 +252,8 @@ static void check_pdev(const struct pci_dev *pdev)
     switch ( pci_conf_read8(pdev->sbdf, PCI_HEADER_TYPE) & 0x7f )
     {
     case PCI_HEADER_TYPE_BRIDGE:
+        nbars = PCI_HEADER_BRIDGE_NR_BARS;
+        rom_pos = PCI_ROM_ADDRESS1;
         if ( !bridge_ctl_mask )
             break;
         val = pci_conf_read16(pdev->sbdf, PCI_BRIDGE_CONTROL);
@@ -267,11 +270,75 @@ static void check_pdev(const struct pci_dev *pdev)
         }
         break;
 
+    case PCI_HEADER_TYPE_NORMAL:
+        nbars = PCI_HEADER_NORMAL_NR_BARS;
+        rom_pos = PCI_ROM_ADDRESS;
+        break;
+
     case PCI_HEADER_TYPE_CARDBUS:
         /* TODO */
         break;
     }
 #undef PCI_STATUS_CHECK
+
+    /* Check if BARs overlap with other memory regions. */
+    val = pci_conf_read16(pdev->sbdf, PCI_COMMAND);
+    if ( !(val & PCI_COMMAND_MEMORY) || pdev->ignore_bars )
+        return;
+
+    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val & ~PCI_COMMAND_MEMORY);
+    for ( i = 0; i < nbars; )
+    {
+        uint64_t addr, size;
+        unsigned int reg = PCI_BASE_ADDRESS_0 + i * 4;
+        int rc = 1;
+
+        if ( (pci_conf_read32(pdev->sbdf, reg) & PCI_BASE_ADDRESS_SPACE) !=
+             PCI_BASE_ADDRESS_SPACE_MEMORY )
+            goto next;
+
+        rc = pci_size_mem_bar(pdev->sbdf, reg, &addr, &size,
+                              (i == nbars - 1) ? PCI_BAR_LAST : 0);
+        if ( rc < 0 )
+            /* Unable to size, better leave memory decoding disabled. */
+            return;
+        if ( size && !is_iomem_range(addr, size) )
+        {
+            /*
+             * Return without enabling memory decoding if BAR position is not
+             * in IO suitable memory. Let the hardware domain re-position the
+             * BAR.
+             */
+            printk(XENLOG_WARNING
+"%pp disabled: BAR%u [%" PRIx64 ", %" PRIx64 ") overlaps with memory map\n",
+                   &pdev->sbdf, i, addr, addr + size);
+            return;
+        }
+
+ next:
+        ASSERT(rc > 0);
+        i += rc;
+    }
+
+    if ( rom_pos &&
+         (pci_conf_read32(pdev->sbdf, rom_pos) & PCI_ROM_ADDRESS_ENABLE) )
+    {
+        uint64_t addr, size;
+        int rc = pci_size_mem_bar(pdev->sbdf, rom_pos, &addr, &size,
+                                  PCI_BAR_ROM);
+
+        if ( rc < 0 )
+            return;
+        if ( size && !is_iomem_range(addr, size) )
+        {
+            printk(XENLOG_WARNING
+"%pp disabled: ROM BAR [%" PRIx64 ", %" PRIx64 ") overlaps with memory map\n",
+                   &pdev->sbdf, addr, addr + size);
+            return;
+        }
+    }
+
+    pci_conf_write16(pdev->sbdf, PCI_COMMAND, val);
 }
 
 static void apply_quirks(struct pci_dev *pdev)
@@ -399,8 +466,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
             break;
     }
 
-    check_pdev(pdev);
     apply_quirks(pdev);
+    check_pdev(pdev);
 
     return pdev;
 }
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 5db26ed477..4801811bb5 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -554,6 +554,8 @@ int __must_check steal_page(struct domain *d, struct page_info *page,
 int page_is_ram_type(unsigned long mfn, unsigned long mem_type);
 /* Returns the page type(s). */
 unsigned int page_get_ram_type(mfn_t mfn);
+/* Check if a range is in IO suitable memory. */
+bool is_iomem_range(paddr_t start, uint64_t size);
 
 /* Prepare/destroy a ring for a dom0 helper. Helper with talk
  * with Xen on behalf of this domain. */
diff --git a/xen/include/xen/pci_regs.h b/xen/include/xen/pci_regs.h
index cc4ee3b83e..ee8e82be36 100644
--- a/xen/include/xen/pci_regs.h
+++ b/xen/include/xen/pci_regs.h
@@ -88,6 +88,8 @@
  * 0xffffffff to the register, and reading it back.  Only
  * 1 bits are decoded.
  */
+#define PCI_HEADER_NORMAL_NR_BARS	6
+#define PCI_HEADER_BRIDGE_NR_BARS	2
 #define PCI_BASE_ADDRESS_0	0x10	/* 32 bits */
 #define PCI_BASE_ADDRESS_1	0x14	/* 32 bits [htype 0,1 only] */
 #define PCI_BASE_ADDRESS_2	0x18	/* 32 bits [htype 0 only] */
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index 3f32de9d7e..e8ac1eb395 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -80,8 +80,6 @@ struct vpci {
             bool prefetchable : 1;
             /* Store whether the BAR is mapped into guest p2m. */
             bool enabled      : 1;
-#define PCI_HEADER_NORMAL_NR_BARS        6
-#define PCI_HEADER_BRIDGE_NR_BARS        2
         } bars[PCI_HEADER_NORMAL_NR_BARS + 1];
         /* At most 6 BARS + 1 expansion ROM BAR. */
 
-- 
2.34.1


