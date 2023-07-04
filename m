Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BCD74759B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 17:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558514.872686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGiIV-0006ZA-7c; Tue, 04 Jul 2023 15:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558514.872686; Tue, 04 Jul 2023 15:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGiIV-0006WO-4M; Tue, 04 Jul 2023 15:50:35 +0000
Received: by outflank-mailman (input) for mailman id 558514;
 Tue, 04 Jul 2023 15:50:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vvOH=CW=citrix.com=prvs=5429f199a=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qGiIU-0006WI-3J
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 15:50:34 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80b83b54-1a82-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 17:50:32 +0200 (CEST)
Received: from mail-dm6nam11lp2171.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.171])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2023 11:50:25 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SN7PR03MB7129.namprd03.prod.outlook.com (2603:10b6:806:32f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 15:50:22 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 15:50:22 +0000
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
X-Inumbo-ID: 80b83b54-1a82-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688485831;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=oQZ/XOht9AykrlY3uSpZoMMxS8zXuDQ4AH3tpDbuphw=;
  b=I2hwOKe9mio32Z85AHwRQ4oXRAOy3hP8ktE1FOroprhS9n/+do0UKcqQ
   YOdzqUlWa3zC4IZ/8lq/iKFZ2XtDRHxDSEP62zQ6GlZ3y/OVvxqplx2r7
   AowyX1cBnlGtgN2bm0sv7vlXS7Ob+qRsrnYaPuHPeCLA/Nq3yo+9ZTGLE
   s=;
X-IronPort-RemoteIP: 104.47.57.171
X-IronPort-MID: 113847160
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:K8eYo6zGv5Ekbqbc7eh6t+cvxyrEfRIJ4+MujC+fZmUNrF6WrkUDn
 TQeW2qBOPfcMzejKd9/aoy39kwFsMKEmNNgHgQ5qCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EoHUMja4mtC5QRhPawT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXxy2
 sU9FBIHUi3dxN6x6aCqeMpSust2eaEHPKtH0p1h5RfwKK9/BLzmHeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjeVlVMouFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAdlCSOLhqKYCbFu75EYQMT88ZFSAsNKir0vudsNQb
 EkK5X97xUQ13AnxJjXnZDW6qnOZuh8XW/JLDvY3rgqKz8L88wufQ2QJUDNFQNgnr9MtAywn0
 EeTmNHkDiApt6eaIU9x7Z+RpDK2fCQQc2kLYHZdSRNfuoa65oYukhjIU9BvVravicH4Ei3xx
 DbMqzUig7IUjogA0KDTEU37vg9Ab6PhFmYdjjg7lEr/t2uVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:fyY6zKHxoi8ULdJHpLqE0seALOsnbusQ8zAXPiFKOH9om6mj/P
 xG88526faZslkssRIb+exoWpPvfZq0z/cci+Qs1NyZPTUO1lHYS71K3M/PxCDhBj271sM179
 YHT0GmMqyUMbGtt7ef3OASKadD/OW6
X-Talos-CUID: =?us-ascii?q?9a23=3A67M8pWln6UHQncxka0mgM6OkrD7XOWDh4071H22?=
 =?us-ascii?q?yNVs3C4GSYE2ByoBar8U7zg=3D=3D?=
X-Talos-MUID: 9a23:znhArQbcNQ7/tuBTlRXvvRNIBchT8o+1LUVdvIQJ/MyaKnkl
X-IronPort-AV: E=Sophos;i="6.01,181,1684814400"; 
   d="scan'208";a="113847160"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8GItorg/FlGIHvKyJnUx74wnnB/tcjVDSNP3m7H/D3UfsaaZmn4Pty9LaQKrVOCb7TfUCllVjEzqsHVS2+wa+euhQzptXk2qdH70DHVdw5xwGqTBsKmbcBKSKzB/BydXAX7wIGTrUQ12gbH1comxfLMABe0W0Kj+FqmJXw8RI81Kf19LMlWe2rQBny63Y028bFpCcVIXMTaNx7O+SULxFpL07HEKW2Y4Pd7/LYg4JIJkQ4tOD/2oCKBY36/v7WbvxrVDbMwtIwoQ+L6PFEqwPD4TFVsiMRD4EHoXIqXgbW6j1/aRTeml2QTVKgc+z6qvWPu/bcDXD5QS0+Z0P6QJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s9DTBbPeDfOKIsbYF36FEDxcq1FyDd38VoaDBTAIM/c=;
 b=OXOGjX8qTwMApbnBP7Y1TVHjDMmJSlZbKL0w3X+fePJzN0Ri60Uo35JJMYFXfMEA3q4DUgGOWHlGmTvuxSGkAbh0IJqL/3hcCF6oU8SsyPkxPzd/0daH4hlFTkIyWQaLik0m/Km58VtPark/8R4TeGNrcI/DPRkAjYlK3iU/30xVti6P8tWDOQNF7JEAcOrD1isXT15yxq4EPpzFR+7MWOEQTDdVtuk9TQIF6sc2p8JMDBFoIGhJ5XCG0odVHRu35jGJT2KG91w1ooXYkXg2GiLpgs9V4NSq7BfJo9EB6BrnAv9jn16K7rmlM2zglOLD5HovNxYHjOq/v+5oYycLYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s9DTBbPeDfOKIsbYF36FEDxcq1FyDd38VoaDBTAIM/c=;
 b=bEslETl9C+m7PimdbIkZqJAwoXQDsh8TaY38jWqIcjTo3hfessp9SMcvdpbIETI1dYcyET3ISNw87aB3j2ncT4ZcbAmiasLC8jhlN4w5UPSg4gG/LgIM0usMpmR9cLsYz/icYdqQ0/jbvhiKDFFt4aR8HFtp9dqKBoptlMJqzLw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <220e6e10-ab9f-b036-9acf-58109d2a7426@citrix.com>
Date: Tue, 4 Jul 2023 16:50:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: xen | Failed pipeline for staging | 9dd3caf1
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <649eeb9f5347_281f686f427353e@gitlab-sidekiq-catchall-v2-54666fdc77-xrbls.mail>
 <bff9074d-0345-2931-c57b-3acda238a9b5@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <bff9074d-0345-2931-c57b-3acda238a9b5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0337.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::18) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SN7PR03MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: 63653c2f-f06d-4217-4dda-08db7ca65ff7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XzTLhmbLCjRuy290v1OtZUJbGgaB/lSbVRjfCwrf5eTXiMVAJMp+QEykgT4iAliGi3UDjAzZNmtWsIoaYUJwsB+po+sWlmhcdFIzyFbfqBFP/D6nX9z9F83lLxr221bbplMmUJfZIpPZ/haQBaPtFFjpWPx/SkVpzaASef22gZVGD+Gc5uS02kW6c8TuQF3kl6fKPFg5giNXwg0JuhlPs63qzSQ0XQfnsoOUdWI87c3oB4lrNJKkidKHLMOvzuv795J8QKqdY4u0amvj/u0BzDuaasVsxg8A2YbwbouaHzF2PNthpkza9zzQEcAN2Ewvp2cTvsgKh/p5yQWQUh9CVMYWTFzw3q1u7Fqye6H4arnKzv4ZQhIxxIj4EKlk4e9w7WJkwjt3liFnI6PbmcWnPMWqjuh+HdEy193iMXSn6LgBG/SjRMDBjOa9EhaKK2YqTbqoAa8/qDmAE2jcZQg4kD8MuD+QJLrS8Pmz7c368y5fnXxLYOTYsn62WW1k7TwhLMnbnQqmQIUonrykauUehCF3qi7CYZF/Me2fpTDjaIU869IoafpkbO0kgpuJ/TjgKA6KTWFXoi/6z3kCqsWeHwVE8/gTKZsUQQLNTST7HfYNQBePen3d8H2YWPFo2DQisGLp3eOC3k/KMMEcKbILnI28ehUVp55hLu3k3trGIoad2E8nsjUE834bPUYtyhig
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(451199021)(6486002)(86362001)(31696002)(478600001)(5660300002)(66556008)(82960400001)(66946007)(66476007)(6512007)(36756003)(966005)(186003)(26005)(2616005)(6666004)(31686004)(2906002)(53546011)(6506007)(83380400001)(8676002)(316002)(8936002)(41300700001)(38100700002)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0JZemh0a1hURklpc25RRUNYSW1SMmdSclVuaGltMUNlSFlWWDNxd1VrQVkr?=
 =?utf-8?B?WVBtVHlwK0NHNm92SGNrVnk5bFpJeG9ScWpta3J1M2E2QUhLVWQrT2JnZjI4?=
 =?utf-8?B?QSt0Z01neDNoVGhoMlFNbHNjcjBOdUNySlUrNUczOWd3OEhCb1Uvc2JjaGdn?=
 =?utf-8?B?Rk1Fd2N0Q3lUbk9xZDBoWVNZbWJyeTZKaW5FQ0JVMzcrUHg1MjFseFg4Rlp6?=
 =?utf-8?B?U0N6M3A3Zk9qYnFIMGtiN0hGMjIwSHo3bzVXS3RTa1ByV0ZnR3dET2dMY1Nt?=
 =?utf-8?B?YXg5K2pYclNGa1lWa0x4NUozZE4xYk1yK2Y5SzZtVWM2UHBvNnRyU3lYK2lp?=
 =?utf-8?B?Wkl3Uksvam9JVnVSeEZsMUVqSkVGano4SmczRlV2RmcwWGlLZHFmc3VoYUcr?=
 =?utf-8?B?M3hkalowZkx4ZnVmM20wOHVwWXdKTHVsWU52WnJYTWlXSjVBTFVYNDMwNy91?=
 =?utf-8?B?S3VFckt1VTliNFpHMGNleEdxTzZFRlpMeEdicDhXMnVxYjlXMGJCOFc2UmFZ?=
 =?utf-8?B?VFFpb3A5WTBrWENUMWsxemVXcnVJOTRNREp1MWF3VXVNZ0l0aG5JU1M4VmNk?=
 =?utf-8?B?N3F2aFlSY3RNTCtHYU5YejlkT250blRob1VRdHBVS1p5c1NHcXVuNHRJRzkz?=
 =?utf-8?B?MkRvcmRrUVpHUzlQaWZnMW1ydzJDSUdzaVI0ZTlHYkIyRmdUYTQ3dDR5UXhs?=
 =?utf-8?B?KytKY2I0c3o3VzVkMVRpdXdhU1dQY0tOcHh6b05ibFZ5eklFUDMxNEFKeTQ0?=
 =?utf-8?B?L3YvMU9mNk1hYlJpMDg0ZXBYYWZwU0JDWTg4UzZ3VEVnSm9EZ0ZQZTZ1dWtj?=
 =?utf-8?B?cUVYMnI4V3RyVklKUVpsbkJlRUErazFmSU5DMFVLZ3JjcmZHWkZYWWhWMXlM?=
 =?utf-8?B?bmFqMGFTd1pYc2ZGS1lLREVxREJLdyt0TkdDb24rRmt4ZFF2WUJJWXRvUHpQ?=
 =?utf-8?B?SmdZRVNvSlZqdW9QM2tZaDJFdkdoNXlrRkorbjdZaW9yRCttYXFMUnJLYlFi?=
 =?utf-8?B?REZGZW9lR3N1UUo1cVAzUzBZeG95YjlISzFESGxVbk1hbUEyL1kvQ0lvT2dI?=
 =?utf-8?B?cWx6OUV0UnRqcXpMYWNOWnRQaXNoMlVHckQydEQzTU9pR1RFOVFscGIxUFlz?=
 =?utf-8?B?a2VyV0R2UEpJTS9vcGV3b2pVSndlcVphbGVPVUp0SjNxSjczY1dBRDduUFk4?=
 =?utf-8?B?TWtMekRFNTJLSzZ3UFNZK05sd05lSlRHZ00wdXlIS0NTa1h2bi9xczEyMEYx?=
 =?utf-8?B?Yk5RRUp4UnAzSlpMWWJlWGFiZkkvTUp6SWdhWW05Y1U2SWVBLzVNRU1zb1Fr?=
 =?utf-8?B?STlXQVdZUUE1c1pkbzZ4dG1iKzlFVERoRThnVXBVRVMrNXJiY1YvWk84TjFS?=
 =?utf-8?B?dGVMRjNVcGV2SmRZYnA0Qnk5RWVFTkNLZ1o1TlRpTHM4WHg0Y2FwcnVOSGtN?=
 =?utf-8?B?YVNpT2o4djByTXY0a3hJUWlLeVhydjVSTmlkaUFVQ3ppSmJqQ2lWSWJXVzF4?=
 =?utf-8?B?a2tLNTkyeUVpQ0hoNXFqSE82R2E0RGRtMC9sSlVhMVdVdlZLbDIwQ2xPd3Bm?=
 =?utf-8?B?Q0hKYVNHaXR0enhCUnFmWHE2MnJTMHArbWVtemhzelF0NVNXZHVTWmRUNWty?=
 =?utf-8?B?VjJNT2ZIcTdJVmJxSEFiWTEvVTJnbkVaS21MRUtrYmk4VkpOcWl3aUUyeVJZ?=
 =?utf-8?B?SStpSFZ3R1o4UFhWZmtwWVdoMHZ3UElueElib3F6RDRvMlpwMHN0SDZESnU4?=
 =?utf-8?B?aVNDSUVHY1R6RmZ1NkJRcmNiLzE2WWpidHQ1QmErMUpwVGZsa1E0YytZeFZR?=
 =?utf-8?B?VVlvZ0d5RGNuMm5mSmQ2Y2trN2Z5N09CNGNqVEtpakhHS2tjUnNmQ05nSEpr?=
 =?utf-8?B?em1NQmJFTUR6MmRLSWxJTGtZbndibkMxc29NY3BzOVJoeUlDVHVMQnI2aW90?=
 =?utf-8?B?UU5KTi95bTJMMC9DUE9JWEZocU5vd1czN2pPMFUwbEZuYjhUUzlpTW5zT0dr?=
 =?utf-8?B?UXFoQ2ZzRHBJWi9SSHo1NGVlNkZKa24rTEZHQkxMNHdnVVJkcXhLWmUwVE1k?=
 =?utf-8?B?UTAvbk9nR01GQ2hTTzNXdzNKdFFURnhHSldMOHJOZXhWTEhFdnlRWW5GOFBy?=
 =?utf-8?B?MDVobGtLWVVqd1Ara1d2YWlGWWkyM2VQVGc3RzNieXowc1ppQ0JOcTY5Y3M5?=
 =?utf-8?B?VlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VGtcx4dAeLH608HuXXqqqUOPfKPKrpnZMvsmlM5XyHAjU1+Sow5W1lixjyGgfI8TBVZQj105i/SqK8JtgciYTcMtWAJIexWDLry5vNom+qOs0+JC5kJQpe43ukLVIr9qnRCY/3zsv+sLKwzFAPJ9MNvCucIF8S0XJhGPgV21dvKGhjrdOGRtG8d0kvmcYP91TP/kP73m9eMl7Ax3/JaG8guKRfsYFS5T2qUYa8uVLer2luzWScJGs4DrQSQJo7e7ciq5jOrrSRC1e6E2UjXmAnR5AuBcrwB3xxeimK5ugRd0tD5X/LjPXMfGo9V0DZF1B+fybLSWGE0e9q8RMwRN0q5aGEFgQh+TehEz7HSHg2JZlYc5tMbfcyBLu66oNhK0yaNAsTBLaEsEr4Fgg9CCLXXfDV75Lo79tAQShrDeiv6XSK0NffPJuAOv/3H4x7U2LsZzDs1Q3Ah4XcK60j4oaGp5IfVDFhUec6PtMAbzNbhdfLNUqJKEM2fJjE8X000ghP7kE+GVuo4POGm6TQv98ei08UM8JlM2zCAwwvW1MdEZQT1DKpHgMK1w0TAh8cr5sU0EMFXm/4sfgLvpm0kdleH/hrNv3tYpgS6nSd7MNSKlq78+EMOv4g6ESzZfWvOu+utgZcy4+MFL6Iazx8F78dEwBGsuv6EpjPwG1op/CdNe+8g0DQEvrn/NBWU7msiRT99VmoD+iPwMjLFRLPY6jH1QX8P0f6Y14gIlqyzSko+5kiVjQuQ+z6svDxsEvmymyP8ZqebW6DOWRfjiD68IsSXpX/p2Fw+ZCQg0WjzTtFU=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63653c2f-f06d-4217-4dda-08db7ca65ff7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 15:50:22.2676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Z15Ug8x4BzrY4aTzqXaOYt4qzxxEUg3kTfHn84cLVVs7ZnM+N7655R70SPWw5pY3JeBsZGl0esgY7w3/rtkPFyh8LR86Y9r3C+5RVujmc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR03MB7129

On 04/07/2023 4:39 pm, Jan Beulich wrote:
> On 30.06.2023 16:50, GitLab wrote:
>>
>> Pipeline #917215286 has failed!
>>
>> Project: xen ( https://gitlab.com/xen-project/xen )
>> Branch: staging ( https://gitlab.com/xen-project/xen/-/commits/staging )
>>
>> Commit: 9dd3caf1 ( https://gitlab.com/xen-project/xen/-/commit/9dd3caf12f52b859947c260b1cb3a48b491d53b6 )
>> Commit Message: {x86,arm}/mm.c: Make populate_pt_range __init
>>
>> ...
>> Commit Author: George Dunlap
>> Committed by: George Dunlap
>>
>>
>> Pipeline #917215286 ( https://gitlab.com/xen-project/xen/-/pipelines/917215286 ) triggered by Ganis ( https://gitlab.com/ganis )
>> had 3 failed jobs.
>>
>> Job #4573553348 ( https://gitlab.com/xen-project/xen/-/jobs/4573553348/raw )
>>
>> Stage: build
>> Name: opensuse-tumbleweed-gcc-debug
>> Job #4573553345 ( https://gitlab.com/xen-project/xen/-/jobs/4573553345/raw )
>>
>> Stage: build
>> Name: opensuse-tumbleweed-gcc
> While iirc the above continue to be expected, ...
>
>> Job #4573553188 ( https://gitlab.com/xen-project/xen/-/jobs/4573553188/raw )
>>
>> Stage: build
>> Name: debian-unstable-gcc-debug-arm64-randconfig
> ... this one has
>
> ld    -EL --no-warn-rwx-segments -T arch/arm/xen.lds -N prelink.o \
>     ./common/symbols-dummy.o -o ./.xen-syms.0
> ld: Xen is too big
>
> in its build log. Whatever the .config, I'm inclined to say this should
> not happen.

That is
https://xenbits.xen.org/gitweb/?p=xen.git;a=commitdiff;h=02a11313cdc60d266d8613899fcc9d3870ef5164
and is intermittent when randconfig chooses COVERAGE

"[v2 0/4] xen/arm: Enable USBAN support" on list should fix it.

~Andrew

