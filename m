Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A890D5FB7E4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Oct 2022 18:04:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.420395.665211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiHk1-0000SU-ON; Tue, 11 Oct 2022 16:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 420395.665211; Tue, 11 Oct 2022 16:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oiHk1-0000Oz-Ka; Tue, 11 Oct 2022 16:04:25 +0000
Received: by outflank-mailman (input) for mailman id 420395;
 Tue, 11 Oct 2022 16:04:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qHIK=2M=citrix.com=prvs=2762267ab=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oiHjz-0000OR-Tv
 for xen-devel@lists.xenproject.org; Tue, 11 Oct 2022 16:04:24 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5d4151bb-497e-11ed-91b4-6bf2151ebd3b;
 Tue, 11 Oct 2022 18:04:22 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Oct 2022 12:04:03 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA2PR03MB5769.namprd03.prod.outlook.com (2603:10b6:806:11b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.21; Tue, 11 Oct
 2022 16:04:01 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%6]) with mapi id 15.20.5709.015; Tue, 11 Oct 2022
 16:04:01 +0000
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
X-Inumbo-ID: 5d4151bb-497e-11ed-91b4-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665504262;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=0ChCvhy3uY66meh6etxBW7TqKIZejV9GMCbCnAQ35io=;
  b=OcpYav/c6d+X8DdRLjbMoD4cjUP80pJsiNGQQm5yvZ8EkSk9iHN7q+o7
   BO9s12+eoVj6rhPLWTUoowKJZJhYCu46yt/Y0yPDpJgtZjcp2sBH/RYwe
   zAc72qRRlseH9hLbUysnlqN+SFuk29RhgPx5fc5HNpbyyD/uM9ov6Xm9j
   w=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 82474300
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:eR+x7qrVdlOvqYZZ9Np1c5uGDD9eBmLEZBIvgKrLsJaIsI4StFCzt
 garIBmBaKqPajTxLtl1b9m28xgF75LXn9diSQo+pC1nFisX+ZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgS5QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m7
 MY4D2gxbRa6i6GxwuiSaMxjuOAcBZy+VG8fkikIITDxK98DGMqGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Nkkotj9ABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr+VwXynA9pKfFG+3vlnhU28m0MYMwIbf0Ch/KKogHOYXOsKf
 iT4/QJr98De7neDXtT7GhG1vnOAlhodQMZLVf037hmXzajZ6BrfAXILJhZhZdo8pYkJTDol/
 laTmpXiAjkHmL+fRG+Z97yUhSivIiVTJmgHDQcbSSMV7t+lp5s85jrNU9JiHaidntDzXzbqz
 FiitzMijr8eicoK0aST/l3dhT+o4J/TQWYICh7/W2uk6kZ8e9Sjbonxs1zDt64cc8CeU0WLu
 2UCl46G9ucSAJqRlSuLBuIQALWu4PXDOzrZ6bJyI6QcG/2W0ybLVehtDPtWfi+F7u5slefVX
 XLu
IronPort-HdrOrdr: A9a23:5152Nq5pvUj5sZmCJwPXwSeBI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6Ax/ZJjvo6HjBEDmewKlyXcV2/hpAV7GZmXbUQSTXeVfBOfZowEIeBeOi9K1q5
 0QFJSWYeeYZTYasS+T2njDLz9K+qjjzEnHv5a88587JjsaEJ2Ioj0JfjqzIwlTfk1rFJA5HJ
 2T6o5uoCehQ20eaoCeCmMeV+bOitXXnNa+CCR2cSIP2U2rt3eF+bT6Gx+X0lM3VC5O+64r9S
 zgnxbi7quunvmnwlv31nPV7b5RhNz9o+Ezc/Cku4wwEHHBmwyobINuV/mruy00mvim7BIQnN
 zFs34bTrdOwkKUWlvwjQrm2gHm3jprwWTl00WkjXzqptG8bC4mCuJa7LgpOCfx2g4FhpVRwa
 hL12WWu958FhXbhhnw4NDOSlVDile0m3w/iuQe5kYvGrf2UIUh4bD3wXklX6vpREnBmc4a+a
 hVfYnhDc9tAB6nhyuzhBgv/DSuNk5DbituDHJy+vB96AIm4kyR/3FouPD3oU1wi67VM6M0gd
 gsEp4Y5o2mHfVmGJ5VNaMmffadLFDrbFblDF+ySG6XZZ3vfUi94qLK3A==
X-IronPort-AV: E=Sophos;i="5.95,176,1661832000"; 
   d="scan'208";a="82474300"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqB1WussvAi6ULayzvbRO8KGcJcT1LX4QiSrYw/yQFn9U0R11JYQ7mnejfu4iWnHuQfBFwnrml+ZPvVhKNnvIN5IMTvrbA08omIiCgH0phHVulsKDRL61OshagTWXtB+7LAAVXKzhf3S1tGSUIjOCQnTm+s5K85BkxND6UdJC8eEzFRFoDMwRDUf4u/7grSX0Lspm0SeidgRmnHkyj26rKUwPoX3gkxy5mk/jjPn36p1yJQQG/jtatl122WZ3MMD3N+oBqdWFf/H0i9mjTEhKfnawC/0sc551pqZ5BpAwfZrWbRQLu41KXGlR0GUrGKU8J2g2LySrbx2BLHx6gzy2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IqmkX7BY352iyEmyV2PPJJVDTi/prr1MFNe89Y2774=;
 b=fyu/6EunJlRqX2jr8Ns4PPt58AtsjPiAsb98g1BURbyUXPqsD6XsPnsg7STUz3T2VKKrx/P5MJZq78Do5B3DYFF5uRmz1xJuSB4bnRk9/l/vUrfkJmqtNQJNAHACroVQFmrhyXX886ycEkE33AsQ0bm5a/sxEKzraZYWW9EcTwMevCjUEMrzgQEOmYu0wTaIXq6gLabgm9LTH4R/SGiH+jPhJYU9FQlOCqWV1cd1Sv4t/ZCHhz92felD4SAay/zZhuhzNa0JOCZyEEFJysbcA2QHqOjRCVYEuToz6j9Z8s/dU0QC1QYmgmgQoF90O0Dx/mMabtM6z5jry5NB9j5y5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IqmkX7BY352iyEmyV2PPJJVDTi/prr1MFNe89Y2774=;
 b=qz3VsKhWq5GxZTX54QxFsZ2ASKBS+83g+FPn2zNIEwFPhlC4Yasv4I1l67xV/ckU8Ns7XQu9MN6y+uihfdAe9jqEiR09+bZAA9qT+vHWQQYuhAcXhecvyydkeuPghp8AL9i9ngo50KbNIG4t2/1EHa9FI0GSdvqqEH+WvmkDeY8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH for-4.17 0/4] amd/virt_ssbd: refactoring and cleanup
Date: Tue, 11 Oct 2022 18:02:41 +0200
Message-Id: <20221011160245.56735-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0451.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::6) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA2PR03MB5769:EE_
X-MS-Office365-Filtering-Correlation-Id: 2239c5bd-faf1-4090-9a50-08daaba23672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5R20XhabZ0uMD3OrKtXjpcLnOhCDeC9/3kTvoqGSoVHaXE/k0wzRFxIO4mvfnyWHSSG4MSKe1xG/BXDZjFKdwyKilUpJSP70S/pJQlnqewZoSGA2fw9l5mEAn3uq1Hlp3Va5WdOCm/rhXJd8o11mWtjlPqhMHkWdCEiaDnYn2Pyy9LZz485i/y7XQH51RzhOPPDBtTr17NjbE88b8qPDY3Y3uO374PTpI223aWglMVAGDX015q0TFzRLagMMgWgWLJss/U1BAA/azmnzhVjhGsfgEBTpB3u7XOIrcXWZAj9HgaGsHIQxKBySVwl6R7cg0S+8TA1G89mt06g5pQZCYuyKnBcIwzcTq2aJCj2mTtZ6p3HlniyRbeqaDix/cRzDqWmK14yrhN3OA2W6ktD9UBWg9bweq6AZ3UuSr7XzODQj3rTk+svAifGa8kFzBykxhxEVkYBbwOMZpOBNqu30BUbWBCGV5J5BNFgLuJAfN9+FD1JPQQUJ5LiKo/970sp2ckkyp6CD2wNoUsAgAdbEH/QtE50SWalxYHmnHIvP5VDUG3mohWAEdEKKs9wsDVXNvD3VS30n14A7odVAUjxsknNFVtQ/I4RUtOeenTnSZnBwy6dN1nBaHx53tnPae0HnO0QLlUPE1QAF01wgq2hIV2XvqRleA149s/al9HqASoJbj+hIfX/RwhvEF8Eh8FLfrIcN6VoabbewDDpR9A68FQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199015)(36756003)(86362001)(83380400001)(5660300002)(38100700002)(82960400001)(2616005)(186003)(1076003)(6512007)(6506007)(6486002)(6666004)(26005)(478600001)(54906003)(6916009)(8676002)(66946007)(66556008)(66476007)(316002)(8936002)(41300700001)(2906002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dU1iVTFpZkU1bElURGpwVkVaMnk1UnlWSVlRcDRyS2dYT3loZWxLZ1hjL3Ur?=
 =?utf-8?B?ZHNaek9wZ0dKTHp6NTFTRWF4YXd6bWZ5RFNub3IwMmJCZm56Rk8vc0wzTTdD?=
 =?utf-8?B?V050eURvT3BuWFAvZzlPdTVoTC9TdENpRXlJRWZuY2ZTb3cvRmtNUFVCSXBv?=
 =?utf-8?B?NXEybkxWQmVOK0dadWREUXdRYzhtaVRmUVRqcG1aWHo3VkU2S0N6YzNWV2xC?=
 =?utf-8?B?QzhNa0NOdVhBQzBzbWdYcHBWNm9qcWp1ZUI0ZFNvTnk4c2s4d2R2NUdEQ2pv?=
 =?utf-8?B?U0EzekY3aHhFN2IvaXdCL3Y1NU4vcTBXQVFROGJwNG0xaUp5T2NMdlpFa2p2?=
 =?utf-8?B?Y2RoVXUwaXcwLy9kYUVEcXU4SkJNdUlRYVhTZWJBdC9SNzBhSk1CN0NLWmF2?=
 =?utf-8?B?Lzd3YVp3S0tLMVd3bFB6eHg5OEdqVWZaRzZjV2UxQm05dlA2YjFCVVBvdjJi?=
 =?utf-8?B?ZXg1Skw3eDcvUS90YldMVDRIbDdCbUl5bng4L1VPTU54SG8vcElMS09mRlpM?=
 =?utf-8?B?ZldRUGZlN1MwT2VENHVtNkdXVEJiN3ZEVzU4R3c5SC9ENHp1dFFkd0tmY2tI?=
 =?utf-8?B?WXplenIyRHlKTWs4cGEyemtZcjRKdjZVanlsdWxJYUV0Vks3bVgwMU9Ud3Nk?=
 =?utf-8?B?NkxMUzByYjFFVFJuQU56SFdvZ1EweHE5ZTN6SVBvMGd0SVZpRzYyOGNERFl3?=
 =?utf-8?B?cGNvandNWENYRElFd0hoT0F2Q3BtZ1dIT0VUNnhrdkMzUHV1VDcvNnVOVFhM?=
 =?utf-8?B?S0tzYkswbXlsZUdROU5PVkV5KzR1Rmo5d0pSRTM2MUcxcC8rWSt2WWpBUE80?=
 =?utf-8?B?ekpUamxueUFvcEJxWVloRmVuQmlYVkx0eEo1QjlZU3o3SkVQaVM2TEpWelln?=
 =?utf-8?B?MVpLOWV1cDZ1d2NCb3dQT2Q3dnE0N21CcWtYdVJsTFNGeVVhaUFvdHo0RzVz?=
 =?utf-8?B?RWdOOEZhaE9jdm5QUExqd0hVRzFvOUtDcWtIcFpqaGZBMDJ4VXl1UlRwOUtH?=
 =?utf-8?B?WXR6OTJVNEVCQzFqTFR0TDNxR2N6V01CYlBVd3A1K1BQMkZ3WkMzdm5DYWVJ?=
 =?utf-8?B?QS80MzB1a2xjNlRSZjV5M0IzUnV3citZNjJTTHZZbVZpbUMzUUJJOVMyOEhh?=
 =?utf-8?B?NkEydmdLUG5uOTNLQVJ5K2tWVURKNmNTcG8vcm5wR1pQc2l3N29WWUIvVHho?=
 =?utf-8?B?d1YwN3Z6Sy9TaThiWUdhWjNQTVFYOUYzU0pUaEZKU3NpdjRaSHFUeVFNNnRO?=
 =?utf-8?B?Mmt2b0tUd3lWcnE2Mnl6N29EUERUN04xS3hsK0JGbmlValQwbFhWWVloS3c2?=
 =?utf-8?B?b3k0MU05eUc1Umc5OEkxQU9iUTlMK3NVRU5lT1p6R3Uvdzd6OWZZOS9CS3Fi?=
 =?utf-8?B?Vml6K1JLLy95S09kOEg1a0dZWWhvSy92NTJhMHVXOC9tc2hjL1lZbkJ1TE83?=
 =?utf-8?B?NDZOSWdPdjZSYnFNZ2VrTi9XN3A5bnk2ZDQrYUd2bGJhc2UvcEp4TDU2SW1O?=
 =?utf-8?B?aHppRFVvRklIK2N6c1lwM3loS1NHbCsrelJRM243aVNNQm9va1ljZ3pyQlRK?=
 =?utf-8?B?SFFsVmlabWxNVWg4NGc2ditHdzZYMDcrc1BSa1FWWUl3ZFJqZU9FaW5aUTBK?=
 =?utf-8?B?RWVRa01jc29KRUduaFpxT0xtNTJmbDkrTE5TYTZ5SCtZSlg2MFUydDlTd1BF?=
 =?utf-8?B?Q21OdjdhZmtFZUoyRFhVb0NGWUk1SzZUN3hmQXZYT1ZBWUZaZjJQNUxnU0t3?=
 =?utf-8?B?UnVLQUx1d0V4RDlySWZXOHU3OTlLK2IxSUR4S2FCM2k0bEpsNmV2RkVEejlO?=
 =?utf-8?B?OTloQ3pGci9wU2xvK2hISXA1em56Q2FEK2FYY3pRS1ZKcENwUlZzZ2k5VENq?=
 =?utf-8?B?RFVMR3NNWjFPSDhpQ1BiU1V2dllCUFY0cmJpSGgrOEFMYlhYYk5WR2xEbXg3?=
 =?utf-8?B?S0FYVkwzT29TSkU4enAvNnBvM2NJQkRPZGlzaWpMdE01YkJraUVPM3pjdVpJ?=
 =?utf-8?B?aEpZc2JDQm4rNU9zd0QrUlhDeXkyb0lUckwvRXlDVTUrSFlpd25jU1VLY0NP?=
 =?utf-8?B?N3ZSODc2WVdXSUh4NSs4VEFhQnY2aGM5bDRJNW0xSTNqN2g5cU5pblVmcExz?=
 =?utf-8?Q?rg0fXIYaHS6Ezr4etWjmUGw13?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2239c5bd-faf1-4090-9a50-08daaba23672
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2022 16:04:01.6159
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y1/COsV7+ifn0LIggrvueLTLiXxcHTxzo4nLkWCyK+uCZXqyYixxe6ZeStsjJHQp6UKfv4dv7U/VwYTIyGIo/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5769

Hello,

The following series aims to remove running C code with GIF=0 on the AMD
vm{entry,exit} paths.  As a result, the context switching of SSBD is
done when context switching vCPUs, and hence Xen code is run with the
guest selection of SSBD.

First patch is the one strictly needed, but patches 2 and 3 are also
desirable as cleanups and fixes to the documentation.

Patch 4 is untested, as there's no hardware with SSB_NO.

I tested on Naples and Milan CPUs (and migrating from Naples to Milan
correctly carrying the VIRT_SSBD bit), but I haven't tested on a
platform that exposes VIRT_SSBD itself.  I think the path is
sufficiently similar to the legacy one.

Currently running a gitlab CI loop in order to check everything is OK.

Roger Pau Monne (4):
  amd/virt_ssbd: set SSBD at vCPU context switch
  amd: remove VIRT_SC_MSR_HVM synthetic feature
  amd/ssbd: remove hypervisor SSBD selection
  amd/virt_ssbd: add to max HVM policy when SSB_NO is available

 docs/misc/xen-command-line.pandoc      |  8 +---
 xen/arch/x86/cpu/amd.c                 | 54 +++++++++++++-------------
 xen/arch/x86/cpuid.c                   | 16 +++++---
 xen/arch/x86/hvm/svm/entry.S           |  6 +--
 xen/arch/x86/hvm/svm/svm.c             | 45 ++++++++-------------
 xen/arch/x86/include/asm/amd.h         |  3 +-
 xen/arch/x86/include/asm/cpufeatures.h |  2 +-
 xen/arch/x86/include/asm/spec_ctrl.h   |  1 -
 xen/arch/x86/msr.c                     |  7 ++++
 xen/arch/x86/spec_ctrl.c               | 27 +++----------
 10 files changed, 73 insertions(+), 96 deletions(-)

-- 
2.37.3


