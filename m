Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E184670DE33
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 15:56:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538494.838459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1STX-0000uT-1p; Tue, 23 May 2023 13:54:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538494.838459; Tue, 23 May 2023 13:54:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1STW-0000rn-U3; Tue, 23 May 2023 13:54:54 +0000
Received: by outflank-mailman (input) for mailman id 538494;
 Tue, 23 May 2023 13:54:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YHTC=BM=citrix.com=prvs=500ef747c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1q1STV-0000qv-Dh
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 13:54:53 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61e0d436-f971-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 15:54:50 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2023 09:54:47 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DS7PR03MB5638.namprd03.prod.outlook.com (2603:10b6:5:2c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 13:54:43 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::192:6bdf:b105:64dd%3]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 13:54:42 +0000
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
X-Inumbo-ID: 61e0d436-f971-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684850090;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=MQI94l6oUzrg/Adl6XcIVElAggxEE0jHT4ZP2Slxbt8=;
  b=BJCddEDScc+YpPMYLu9f9AtnP6K33+7QDbVabVwOoY8iT+Aip3vkruMP
   H/ufs1flv1FR+HQuZjhwkvkVeC6Oi3GcPBalcdpoONWxXkSDwuTIIT2FO
   4iLX612eLWy2u0pQTIk3702nTPxFc2OyDH9ZMGrjjOCVzxm84nGS2J72O
   w=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 110085792
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:HkMaxKCVGPKNPBVW/+Hiw5YqxClBgxIJ4kV8jS/XYbTApDxwgTADm
 GUbDWnTO6yPNGTyco9za9uy9UsB7cfVyIBhQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G5C5QRkDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw9eh1OE9i0
 MwjLh81XA/SwOCI6baAc7w57igjBJGD0II3nFhFlGucJ9B2BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+OxuvDK7IA9ZidABNPLPfdOHX4NNl1uwr
 WPa5WXpRBodMbRzzBLcqyr01rKQzHmTtIQ6GbCl6vkpqkKqn08iVTM/bQGcpqG3hRvrMz5YA
 wlOksY0loAp6EGlR9/6GQakqXSJuhodXdt4Gug2rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIVqf/LqJqTK5OQAOMHQPIyQDSGMt89TloYh1lBvAT99vGa2yk/X8HD22y
 DePxBXSnJ0WhM8Pkq+9rVbOhmv2ooCTF1FvoALKQmii8wV1Ipa/YJCl4kTa6vAGK5uFSl6Gv
 z4PnM32AP0yMKxhXRelGI0ldIxFLd7fWNEAqTaDx6Ucygk=
IronPort-HdrOrdr: A9a23:xRyWJ6r0RxmHCcx4UTgwtRcaV5oleYIsimQD101hICG9E/b1qy
 nKpp8mPHDP5wr5NEtPpTnjAsm9qALnlKKdiLN5Vd3OYOCMghrKEGgN1/qG/xTQXwH46+5Bxe
 NBXsFFebnN5IFB/KTH3DU=
X-Talos-CUID: 9a23:34jeNmzkMUkdoS6OJV6uBgUbFMIcXFH4/EzWDHeKFjcuSoO8TWSprfY=
X-Talos-MUID: 9a23:ugmiFAo5xXsDTP46XXQezzxvKdtvoI6xMRkuoMgokvHeEisoNTjI2Q==
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="110085792"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FlxEvfeRhh6aUlQBwsXBARyxqyEcUJg5sQqgJlc3PI0GAQdkOix82tgGTCgJoFS6tE46AAZUtTtSO7f6ttSW6JWcYsQTkDAo0HRwiNATRz5A65QkFG0HPDVmO3P+jx8UbgKpxDsqJ6qC+oVhnfKeZ6oY/PbMxzbZRKtf792OL5VY0EsPdWr8XJnUCEli13zoxnzyVOqzlS9HpGtHu3Mfy23atDkMVKLV+8psukslRXGv1r+4RYuouA+Q4vKI1xpwQbdqZy9e6Hw5uJ/M1Y8q/V1Ggkn1hgn/Emo9Bfo/gecReIwkBsrKO0V1GgT16tMYww3dJ6sTahCEVEciurYBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQbcCiDxSWHvhUxrrc3j4cucKK+/8BcO/kM9Y/HecYI=;
 b=POxvFr0YHSICreFWYwJHGWRjzg6qLptP58kT6pcmQFv+aYHft8sSYbtw70XmXmQSmrStIbHg5R1qFXiEe5hqRGC6pCNGnVj5kOwoDW0DLulQwZJURBzWC+EVi62J0Ty41z7lRHqii1BoNdA09mGPcLjHNI2urOO/y8vSiUBVy+U02a1xUqsDv2OpiHY+FukCO3k7UKTnU8ql4MOymb9a/n44+IygR0to/UCO4nGNQHZWp0thLAMk45Ja7UdR/bFvcH69i+k0N8a8QtA/65KKgoO+GJpo9oapHN0Soi3/Ei03S8aLU+V4FBq3szG0Na75toxg2H2tpXwWIgFfgf91RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQbcCiDxSWHvhUxrrc3j4cucKK+/8BcO/kM9Y/HecYI=;
 b=EzSizDhFfp/cckl9i6FORJdDFxwx1COE1khLoIOyHqwWAjgx7XwDBjrUih6ArlwL1m5mqVFv0/1Tq6BqFwNBTGIcxsxibdYY0z6DsnwMZySb7a8yGQ91oVrs9CvWs/gl27+3K/d5uho3fgIh6Ax/XMrm30LT9i0cOVX4+vXdgPU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 23 May 2023 15:54:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <stefano.stabellini@amd.com>
Cc: xen-devel@lists.xenproject.org, jbeulich@suse.com,
	andrew.cooper3@citrix.com, xenia.ragiadakou@amd.com
Subject: Re: [RFC] Xen crashes on ASSERT on suspend/resume, suggested fix
Message-ID: <ZGzFnE2w/YqYT35c@Air-de-Roger>
References: <alpine.DEB.2.22.394.2305181638390.128889@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2305181638390.128889@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO4P265CA0220.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::18) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DS7PR03MB5638:EE_
X-MS-Office365-Filtering-Correlation-Id: a89434d7-edf8-42c5-1801-08db5b95424b
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	l9mJBj8LC2IJR5BfphSdhVjokq0H4u4YSGNJBlsiSvpte1LK2bhGsVZGIJe4AmyayqMdweYa09Qdr71+wlM0lFGd833jBtqfKQoZKPxsinJtXh1gVgqXgoKhsghq3c3sdxzUdRU7/uRxclpb93Y8/IrReU7vPc6kBw06xRqqO/IjKbP3orgUH8pPDBOeHN4zS1gQk/X8slK9oiwKzXZODL2RYHtMw/r9q5EGw2t8rjBIN8SKOmnX0m20bGDF467Lk6aSHFueXsNHpgC4QZ/FJq6n2Sa7jiFjRMAbk0mFDvQbzWeL11qFysX5dRum8xfQSLF/gDWXplLv2RNGWSY5yPLCN36XcdCoTYW2t+RPW4+aSPDemhY7Bl80UeYTv9Ma+uFqqckLgEL7U0p/IEIzn+/bItTEOev3fY+zpRTiI011JeC7jg+hl++4YzjgQfv9vkpF93A/rMEICa8j+4r0H9RMkD+DHTrdlxj+ZsaOLhGEs1CfMojvmYySfdyy3jN8ZPf36WbPvvxfG2fpDPtTm1AbIxD4ffGQPHFWO/yMsgOiVkVyys8uQigYW9zQm62v
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199021)(41300700001)(6486002)(316002)(66946007)(66556008)(66476007)(4326008)(6916009)(6666004)(8676002)(8936002)(5660300002)(478600001)(86362001)(33716001)(38100700002)(82960400001)(15650500001)(9686003)(6506007)(6512007)(186003)(26005)(2906002)(85182001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0R0MW5Gb3Y3QzVVUkZ5WitnVlBCdCtvUFhPOWk0TTJXWWFBRG5TT3c4Z3Jy?=
 =?utf-8?B?UkordjNXeGl0bHA1ZkM2RHVGSFEzZ1ROL3d4dkNpVEQ0ZnduUm5pQWppbkFM?=
 =?utf-8?B?MkhyQ3BRb1lGZnlsYUZzaGRTNHI0eGttQ3hqUVRCd0VHNmZvRUhVaDhITis4?=
 =?utf-8?B?QlkxTGpyb1AwbldWNVFtVkQzRUZHcWoxSUtkU3YwN2VzREdxY0NqWHNwbUhq?=
 =?utf-8?B?STdZZDFqcGs1dkRodGZES0hjV0JMK01NL0wxOUJ4Y3NwWk9TN0JlMDRHenIw?=
 =?utf-8?B?d1R3L25UeERTaHZqSjJ5cExuTjlSZ2ZrWHV1S1l1UmVERkxYRk1IOWp0QlNp?=
 =?utf-8?B?ckRtamQxOXhzUVR6ckI0STlQV2NvRzJsMDV2emF3ejdUQXdLUjFueVdRS0Na?=
 =?utf-8?B?UytleXdMbjRYUVdRMzR2eVptNUhVR0ZSejk3Y2w4RlBrbUFvMWkxakR3MlFE?=
 =?utf-8?B?bjV0ZTJnbEFucHpkQ1Mva0UrMnFWdllqcE93QW9yRDJWQWE4dzFzYkFZZk1t?=
 =?utf-8?B?T2dOUCtOQWpmL1FYMFhZcDFGMjAyZ1JTbnpsZFJ2WldIVTcvNE9LSjluTkhk?=
 =?utf-8?B?NVdwL3ZVQXNuRFpoZFJFcHFZbHhxeTFKeHhMT25rODRqNnlGRWZHenpwYTlZ?=
 =?utf-8?B?UE16QVBhUzhTek5kemtXd0V3aWU2ZExCRkdEb3lzVTh5cjhOOWhOY3NaZFNE?=
 =?utf-8?B?V3lBc2ZPcXFPcW5YNW5kSGY3ZDd5T0hsend5UVVESWM0ajhINUY0VmsxU3lY?=
 =?utf-8?B?b2l4UmthOEJ3aHJveVJVRy9zcC9SaHdOeUhoNGloVURLTHpLWjJEeS9uQXA2?=
 =?utf-8?B?ejJkSlZ0ZUZoQnVkQmc5QmM3R3F2LzRTZm5vYXpKWGdUazVzTm5XTlMrRklB?=
 =?utf-8?B?WmpSMGlUUGxNWFRzeVBCYmhUZVFqelBkcHpoKzZSU1pOdjBTc01YMDZTS2lk?=
 =?utf-8?B?ekZjYWFxUlV1WVZRTVp2Y2xoRlgrSHc5RHVYTHRmR0VhUXFzdE5obkY4Ukow?=
 =?utf-8?B?bmYwNmY4enJKVFhkVFl2K2c4cnIrZXBpaXRrTnlzcWV2VTlKQkFQN0tITjIx?=
 =?utf-8?B?Q1Z6Sk5PNWdLTEc5REI1cU4zZ2I0bFN3NnVNUGNZaW9Cdzk0a1lBZEVuYWc4?=
 =?utf-8?B?S1ZzSDhEMHJxTSs2V1VxQzNSUWJUblFocC85NmVXWGVqZHdFUEI0NGEwek1n?=
 =?utf-8?B?V2cvdWhpcVpmN2l3QjJVSVgyUXJqNWZKRjJjczJSVFVvbDBrYU1YUVJlU3FS?=
 =?utf-8?B?ZEpiNGl1L1JYa1U2SzB2U25KWmdNc0sySjlzalBpcnUrdkpPMFM2TGFkbmpX?=
 =?utf-8?B?L3hyVjRZSnRBQkZVRDhINm9Bc1UwQ3QzNTBVVThGdUdIZXhOQzl3VkxKenBL?=
 =?utf-8?B?bjJjc3pWYVM1dm5DVGpoQm8zeS9YTXN0eEIrNFpGT2M1VVl1RHhnLzAwNXhi?=
 =?utf-8?B?Nkx1MDVKVjZTQUhwZjFUeHl5b0JreFBKd0tjMkVFc0VaWU9jTnVScUN0dkhz?=
 =?utf-8?B?SkV0RnVXcnZyY1JIUDhRTnYwU2VtYXl2bTBsbU9jNTdzazVyOXFrM3dUT2Vz?=
 =?utf-8?B?OFlqa3pWei9hajI5VXd6bTQrYjE0WVhMMTlGT2M1TTluUXQvajBXaGdjRnlK?=
 =?utf-8?B?ZTcyTlZ6M01lUXhscmYxVWhybk9HYXczcTQ3WGJrbG1NeVZXMWhzVGFycHBF?=
 =?utf-8?B?bFRDVVlSQnNBd0hKbXBQRkZuN0dFQkVjRDFQZ2laNVpnbVlMZm1nRXRiU0dK?=
 =?utf-8?B?RnpVb1lIeGpFMFRScjRHaWFqZzdXdndpTkU5OU0wQ0ZxK2s1ZStUL2puQkNa?=
 =?utf-8?B?RDdjbklyUXVtaHQ0YXpld0ZzMlV5UTNCMzZoVEREMmdGQk5xTVp5SEdRQldu?=
 =?utf-8?B?bUJXZEZWVjgwTk5yZDVQUlJuSHJKbU9YZzg2OStkMTVuZ3FGSm1MRHJpTjA2?=
 =?utf-8?B?T2U2eWpBR0lib2tVeGNPdW1xNjBIZ04zTk8rL3kraEVlNzV4UW5ROG1RM0NV?=
 =?utf-8?B?RGY5NXdPelRFekJNVHpKSWEvQ2RCQ0dHRVUrNTNyV0MzbXFGSmFKN3U2U2ts?=
 =?utf-8?B?QkhoOG1pWFJuSlU0QVljeGFxcXA4YVllRm9BNFVYb2VqVGF4WGxzYWlWRGkv?=
 =?utf-8?Q?mGj1mxe2Y209Ez08phWOHR+7+?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	j+zmy61mMCGwxRk/q/H274NHA7xDTvci2B9Mpp76duUHOQHjkAG2CqhTRfdmc1SYPg5ph6r1h9wxO4ESTd9cMCBDEBm/OJHqd0nTr6hWK0iUHoX21sf68tTDPT2Z3ReGw3AyJ14cS4dfeDNk/x7Ytgr9PPz+JEtTBhpJnDazkODhBOtLP5VNtqPYwo2ZqR3Dy57mwY/nh+uxjssjqiNCOzOf4FWRtRD46sRnC4fOiWt/YmxoDAskKxL9uY0x7f1fp6fKQP9PVe6tjEV4flVv4UL78rrtIUgklK8OjUC+d4Rx4N65q6WaqbNcHTkgbSX36rfi6JpI2TgcvgS+zjGkQ84p7qH/dZvyDVh9N0IRMnDiACa48aLr5RdLiDJDOhcHyXE1Lpu5jldKs2VUl4D95uD+ENCUd4FIKyShBrVpBwWnc9KHbeCRseO7lDz9PPy5xCaeuVJiSTL6dyf2rxaKHs0XsLznrJqeuIYVbPTxfUYMaL10R3JIPSCNTvzKFE4WGz0eKFdQgEkQ3k+aGzxFUq/IGs/8kRbDiBpHU1I5Uvglaw3j1wSYkLiOiCzXCbf/igvBKbjwgSdob7fKamSXHtaVuVSNyB0dvC9E2MuOuE6HBZwm8aoxuTMaoZs5FjG3qWvdWn4aFvBccLMOrQwUA1q8h64n+9KWUHsrXWCB8QYW9+frmcahuPNQri3Ly7WLK8CTksF/GdK0TaSKK/eI+6M/+j7PFSrO907JQatYyEv29JkiQDcYHXtAMjJROdRO7A0bQohjQWcddIjUrzLCOZ89dQ+gQlQX9fWeM04ISo1QQOSz30i6K98FRnefmJAn
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a89434d7-edf8-42c5-1801-08db5b95424b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 13:54:42.6764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGZEyeSwV3jJNue7J2MsW5IEE4lmrW6WwTT4IyQxiAdS7CsH81cVEackM3ZPF6T45WyjEMI5ejesTrmU+4axbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5638

On Thu, May 18, 2023 at 04:44:53PM -0700, Stefano Stabellini wrote:
> Hi all,
> 
> After many PVH Dom0 suspend/resume cycles we are seeing the following
> Xen crash (it is random and doesn't reproduce reliably):
> 
> (XEN) [555.042981][<ffff82d04032a137>] R arch/x86/irq.c#_clear_irq_vector+0x214/0x2bd
> (XEN) [555.042986][<ffff82d04032a74c>] F destroy_irq+0xe2/0x1b8
> (XEN) [555.042991][<ffff82d0403276db>] F msi_free_irq+0x5e/0x1a7
> (XEN) [555.042995][<ffff82d04032da2d>] F unmap_domain_pirq+0x441/0x4b4
> (XEN) [555.043001][<ffff82d0402d29b9>] F arch/x86/hvm/vmsi.c#vpci_msi_disable+0xc0/0x155
> (XEN) [555.043006][<ffff82d0402d39fc>] F vpci_msi_arch_disable+0x1e/0x2b
> (XEN) [555.043013][<ffff82d04026561c>] F drivers/vpci/msi.c#control_write+0x109/0x10e
> (XEN) [555.043018][<ffff82d0402640c3>] F vpci_write+0x11f/0x268
> (XEN) [555.043024][<ffff82d0402c726a>] F arch/x86/hvm/io.c#vpci_portio_write+0xa0/0xa7
> (XEN) [555.043029][<ffff82d0402c6682>] F hvm_process_io_intercept+0x203/0x26f
> (XEN) [555.043034][<ffff82d0402c6718>] F hvm_io_intercept+0x2a/0x4c
> (XEN) [555.043039][<ffff82d0402b6353>] F arch/x86/hvm/emulate.c#hvmemul_do_io+0x29b/0x5f6
> (XEN) [555.043043][<ffff82d0402b66dd>] F arch/x86/hvm/emulate.c#hvmemul_do_io_buffer+0x2f/0x6a
> (XEN) [555.043048][<ffff82d0402b7bde>] F hvmemul_do_pio_buffer+0x33/0x35
> (XEN) [555.043053][<ffff82d0402c7042>] F handle_pio+0x6d/0x1b4
> (XEN) [555.043059][<ffff82d04029ec20>] F svm_vmexit_handler+0x10bf/0x18b0
> (XEN) [555.043064][<ffff82d0402034e5>] F svm_stgi_label+0x8/0x18
> (XEN) [555.043067]
> (XEN) [555.469861]
> (XEN) [555.471855] ****************************************
> (XEN) [555.477315] Panic on CPU 9:
> (XEN) [555.480608] Assertion 'per_cpu(vector_irq, cpu)[old_vector] == irq' failed at arch/x86/irq.c:233
> (XEN) [555.489882] ****************************************
> 
> Looking at the code in question, the ASSERT looks wrong to me.
> 
> Specifically, if you see send_cleanup_vector and
> irq_move_cleanup_interrupt, it is entirely possible to have old_vector
> still valid and also move_in_progress still set, but only some of the
> per_cpu(vector_irq, me)[vector] cleared. It seems to me that this could
> happen especially when an MSI has a large old_cpu_mask.

i guess the only way to get into such situation would be if you happen
to execute _clear_irq_vector() with a cpu_online_map smaller than the
one in old_cpu_mask, at which point you will leave old_vector fields
not updated.

Maybe somehow you get into this situation when doing suspend/resume?

Could you try to add a:

ASSERT(cpumask_equal(tmp_mask, desc->arch.old_cpu_mask));

Before the `for_each_cpu(cpu, tmp_mask)` loop?

Thanks, Roger.

