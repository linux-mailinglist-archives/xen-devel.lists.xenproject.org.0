Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 392D15B6C21
	for <lists+xen-devel@lfdr.de>; Tue, 13 Sep 2022 13:00:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.406306.648684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY3eL-0002P0-MI; Tue, 13 Sep 2022 11:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 406306.648684; Tue, 13 Sep 2022 11:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oY3eL-0002Lr-JZ; Tue, 13 Sep 2022 11:00:17 +0000
Received: by outflank-mailman (input) for mailman id 406306;
 Tue, 13 Sep 2022 11:00:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lgvl=ZQ=citrix.com=prvs=24889d1cb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oY3eK-0002Li-CN
 for xen-devel@lists.xenproject.org; Tue, 13 Sep 2022 11:00:16 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0d25d83-3352-11ed-9761-273f2230c3a0;
 Tue, 13 Sep 2022 12:57:38 +0200 (CEST)
Received: from mail-sn1anam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Sep 2022 07:00:12 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BY5PR03MB4920.namprd03.prod.outlook.com (2603:10b6:a03:1f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Tue, 13 Sep
 2022 11:00:10 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::352b:6017:176:4f6e%3]) with mapi id 15.20.5612.022; Tue, 13 Sep 2022
 11:00:10 +0000
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
X-Inumbo-ID: e0d25d83-3352-11ed-9761-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1663066814;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vH6VzT/RNfyLl94eOHdjCXVTLzgTshJAubtJkC+sEZU=;
  b=iBRHqsGf/sDIc6xgNFaxaYBEuUPNA5k+oKc/7Hw199c0JXUcDcTUqr/Y
   36v302OnzImCu8deny8WtzvLFqE/f5ZU8AgF4u7COasEY+U6QjxKgCJ6D
   TpSKaU/pjEfVB8TzvwQ11Usp0udUnxb7ZP9HzhsF2CJyFxz1mAEtEmHar
   I=;
X-IronPort-RemoteIP: 104.47.57.41
X-IronPort-MID: 80376958
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3Al9wbo6sE4VmgbMNhi+HjKxUGvefnOphVZvhN+?=
 =?us-ascii?q?MifNr3fj3mxXxfKvwFeecGOWvrvwR7zc1ddt3lPhdgZHeZvr8pSu/FqY+x+P?=
 =?us-ascii?q?cERelX8FoNJjALt4IUTleeGmZqm9GQuKgvmoC0JQ8Cuu2ojDyknEuM+KbNN9?=
 =?us-ascii?q?LyubXXFbD23S7m37+HUClbALuZ7b82mV4e0BRXoGip1egK1f0Rw44G+F4+ga?=
 =?us-ascii?q?XyBRs/KkQUsKvtEpZKB83RpbdtendRD0VAaiJPEWk+3stDjI5jZRmG8Cm2+2?=
 =?us-ascii?q?pBnPUa+CWyaVOHpf7B+1KUlbO7k16ko2pb/R97gZdQXnSCXVdCvmmEsz1B+n?=
 =?us-ascii?q?uAuNVHW84nPd/QgQG/yrGjffgUb4B2Dd/Zk+pEfkrr5c7KQzHgEaPHtQ9IE6?=
 =?us-ascii?q?9C5CMaqvFuNgbFGWaj3ab7ha1WHdZ30d7KcE25sOfngfxzWbutjJaHeUzQcl?=
 =?us-ascii?q?xCOLJlwfrQjCY1/7z4zTdmS1hwGDAzjjyNFcmEqdR+NOOyoCV37XnWO3Y5vy?=
 =?us-ascii?q?BOTKm59/JIDDNtRubbR7HKFHnIKUw4xX3JohiS2LQI6xnFZPoKuqPBBlAyVS?=
 =?us-ascii?q?q9eY0xMO8sf22a8g0EjClVUuor0CRwN7ByqZDQ8rRKJZVUixm+jZ5hGv61cG?=
 =?us-ascii?q?GkL+tmwk5qPEs/DnPHgNcKOGKGjKSO58P7Qygnm8L6zuuGJwzNO6389WdX9z?=
 =?us-ascii?q?GsrFUvi3syrdgN4cZp1UCm/zHnW4CekCKnHktX3i32G+djqxHT4PBy2NfkQ+?=
 =?us-ascii?q?IuK1hFC2RZzI5LMPCGH5WBk9Ox7FJJPK2R164ATki4YRReEnc5vu+zDb99a9?=
 =?us-ascii?q?Onf4Gjq3/7JvXG1kikv+WwqEqgn8u4AwcWm3j+PXJfxLU6I+npjmpcZ2/U4F?=
 =?us-ascii?q?D9llv9yoBl0+q2HOLN1Y1Th3blJ7xO3BzEVVaXk8QiVKYHiWzz5pYVt3utls?=
 =?us-ascii?q?xMlmobuP/XyM+MBnE4R7NdTW9g4bXTjsDW7dWD/6Chr2n51Jr6UiSGc4V0pV?=
 =?us-ascii?q?mEvbBV/FymisbX6zky9X6YwUB+EG7divAL4Uj0FyYCm8i36Ms4Cnh92Y3FhB?=
 =?us-ascii?q?U9zUZtMdDT9GkithzF9LTrg/re7oWXXOyyPgQaGre/R1MfN+PZrjMiC9lxka?=
 =?us-ascii?q?xIkQoETGzW3D+eV5i4L+k9fWE52LWPL81mQHEMVBdXAWRi5pTW/zlNLiSiDV?=
 =?us-ascii?q?QZe+brlXuwow36ho2LzENmVVesCituDvoGfE7OFwHw8MZDIYHQgxZKXp7ygk?=
 =?us-ascii?q?OmaW7vKmVAYA6JqMV+DqFGPwG53aX0/1J5S4sfft8u/PtR9ilB5gNAe9UGi8?=
 =?us-ascii?q?7XwfidskSyUPxiP/qsP56jHlxGGj7sCXCNFFJGgAFknLBdXTNB+NeNac7Anr?=
 =?us-ascii?q?j0VOs7juA16weGg+bCYaoYuJZiaqIbP2N4R38jaXzBc/n7Dm5DefxvDYO6K7?=
 =?us-ascii?q?C3xk+Jq8qfLzHUY9GGlIwAol0VRgWEXyaF2YzWdUU9TFCF52Z4Fm+b4HdPta?=
 =?us-ascii?q?liFeVk8XlnI+ATKxcqIF8a5qYYzg4qwCx10A4jMVSDWZGoENfJ4z2BKVscJP?=
 =?us-ascii?q?Mk4paquxl9jld+dor6ayGORpJQtFkHbCOa1CUNRFmyNkfUMVQjTixEFjYZoQ?=
 =?us-ascii?q?66VARya5wv25x70+dlNXatmbr0r3LY1AEgQhicWJWCzupQUMYaoGcUeVO8KU?=
 =?us-ascii?q?yYNgmi+k4lDJVP3s03ESfaUFv1QYnDKTlQwX6YMmsjH4Ab3uhfE8v6m+9uXV?=
 =?us-ascii?q?TxJpI2/sF2UwuI0bJAAc4q6rbTnnMgAb5IG8pDflptFe/dyrMIc+8/+4YkL9?=
 =?us-ascii?q?1eN7P7cfQFfDvh4wMplyiqqUkVymB13DigM6kfwHFp+CMPEqciHurT75fmN+?=
 =?us-ascii?q?RGaAI06VlXyUzBKtf7CU9qc7i14DnllQ6o9sp4GgKw/nuIUrvrEYZaj4y28b?=
 =?us-ascii?q?9Hgz3d5y3cyvO7g9yjbLKpIlvulh4/HabPIfIOFA+bYLa88Fa2Kxq/N6wQQs?=
 =?us-ascii?q?ouIzTi9WCuzfA9UvHygR+N3VQocsxf9NA2Xluspiu0f6rYLBLEFGw7LnrmVt?=
 =?us-ascii?q?hmRmd6wzu5z2rrqjyckfziiLE7HqdZv7Pylco87BALzn154FZXK/EJNdLNxu?=
 =?us-ascii?q?fppeiDKHWQ/RzuPpthjOsAWU1K8G4d2QkJIkmBLPJVl6JI4hMaBKB3Wri+L1?=
 =?us-ascii?q?bocA6tq94GkYyacs8qqD+8zrUfi88G5SvdcQwV4Bzci9A8t77AahU+kfZJGA?=
 =?us-ascii?q?u7xs0PTE1Y0S2QIzMpuewkODQc9ELCKd7IdsAH5JMQ49RCQaUjbsT8q5r9Xr?=
 =?us-ascii?q?067zwVxNFLOR1UJ61LBKYVTtnLbPASetS02reuNFZXVadT0zV4cBAjeNO6gj?=
 =?us-ascii?q?QCDBRpggcQ9VkiEU8XIyOi0WlyugDJYMGYvfDMVqFIMLkx3AwQY+cfTo68ff?=
 =?us-ascii?q?z4wJbCX0nUylvZAsW4gcYdTCPYTh08Bvckua1nd7JJWLd0ow2OeZDWINbSg+?=
 =?us-ascii?q?0uNnDQmjWb5W98WO6n5SSAXWVDsxcVlavpXXVL5UXGfeQd+PX1GA6ZOJwFs+?=
 =?us-ascii?q?QLzq/b5UbIxZ3zZqg=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.93,312,1654574400"; 
   d="scan'208";a="80376958"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TlzvIfq7newQaLz8ml1oTmIgaK4h/rF8MSXE7VY9ahcqAY4MjShLVJAcISRb2zLdIdqTbnx1JnbBf31IkZOw8GE6sRoisKJk9s0sBJxl8NK5thEkFajh0t4J0t80yxJxps6e6/ahhWW+eOI7r13qcoYpuo5+KXuif/ccMK0IuK1s2Ks2bw5XQ2tqLo4JzJpqdV8RdGMphvR28O88Yoxb1oCfsf4bA+arsdf2v+TBozGTF0WOd210Hv/9qWcbEpGC9VgzFf2waDaeFVEjt0EgyeIf/r2lla/07KxI0gXCy95MyyJYmK2llIhdGRMjOykYo3WMaEdMteDUIxJm4sQTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrzBEVkX0OaF0KQ2cVhHaFzJfpyPpHhSb86Lhl4Vsks=;
 b=EKlMqsTW1LW3zg+6uaefnyC+CkU9IRiem9IpV5xtKuRDms1Iq8qn0E3TdSh/RDY9YIqUugxc17tFEvlBIFDd+Yspd6hd5yepyZQag2DR8HvS9MzHu8abPsnQQfk1sLi2wHwShyIjOPKXyPi7kKCA3o6iLOEiFkpy2o9yxxmzmO355FQfE/m6XcComAASwGulU8ir3QKUuoMYWKtqoonUfBiW0v+hYyGdn4ICKkIJW7qwAlwYH6G1FeCq/EtCspmJNUeZZcqQFUBJmZK2H2hiOVe9n++5fRn52LGpiXJt7Hplk/yufNohwx6bqb3dQpmFXuEh9TZxHwSophYuMVadgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrzBEVkX0OaF0KQ2cVhHaFzJfpyPpHhSb86Lhl4Vsks=;
 b=LNoDgZ0uLHSPyRNP7r7I7embyICJp5KiJuDLIrMD5bU2ytmCBu37x8NVFPUywROlXNRd/TCYrBSZPg9EGOqS9+i7UxcWI4RH0nhV06qpovn+15x7HC2PI6vTpHET8eEWR2ZIffRi8KTDznaI1jCQggOVzx5ZUeIhgT8O9/HepYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 13 Sep 2022 13:00:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>,
	Community Manager <community.manager@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6 0/3] amd/msr: implement MSR_VIRT_SPEC_CTRL for HVM
 guests
Message-ID: <YyBitBGtzJuLhXwh@MacBook-Air-de-Roger.local>
References: <20220517153127.40276-1-roger.pau@citrix.com>
 <53cc6a9f-5a4e-0716-fe08-ad86fc155cbf@suse.com>
 <1dbab710-6d3c-a6cb-faa7-31558c04aab2@citrix.com>
 <3a975638-9675-9a95-fead-91120edefee1@suse.com>
 <07176f1c-2759-ddb0-1d59-38b4504d0ed4@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <07176f1c-2759-ddb0-1d59-38b4504d0ed4@citrix.com>
X-ClientProxiedBy: LO2P265CA0418.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_|BY5PR03MB4920:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f2940a-b424-4d0d-8266-08da9577201a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EnUcStqtWmbPQLPDVeDBOyI72CmNu/Yoo8sPIRXYGNc4nTpmfahVwas1JYGTv25vs6TfhJ2Rnn5dPuhhkjJ6QgmidDNwRxvg3UnbW6McNmPSKy+C9iKWKAEIUmsjZh6RTaG3crG7rOqD61r+iC4U47E2m4tnF0LKY/fUGE5Vg2Ig3aGnnL6i3jMFMX9ATWw/ERUPlUrsFUaIUELw8S8LsFJGwvjb4T5wias1rUdheYgrVP3AhdpDZAZDAW9JWQ3ZWmB9k46d06HrAG1ngaIs2zYc87WQSxyEpBi9l8J91v/qeLzC6BvtBI8sxz+C/zSprXFLsr3XwzRbSeXmEixEQMoKSmKvQxvsJ8cBZ/8n/KKv2VMZlhw25kX3u1qKUHfRe6fTxKSGxDf82G4UUjh2qcVXAsNoj/WlB4eMxeGhWRbB1+iZIACFwDG3XVFlb7gV1rLdhU0yqWP9zlcxe8fzuUPtXzgd9kuevSAHHnfvfuVnf3z5bCXLYRASTm70PEpiXlFpu91JX8i++Wx4u1w4jYcCIXnpkPed7OFsKTLC59zA0bQpXJrZ3cfKearRjSGxsGqv2RWRPOhJzYMM9g+OL8BmEWacfTVcUiuxnT3G9CFibVpm9OkN1FIauGNeYRv5YBvqPyACQe9Kk5XZBri85K4niSAgA/4hY/ZI6+7AgTVe4bkPs0SxBHAkSd9U15/w695GHrHIG9P2ThEL7xRooqZz1Q6bPraH5D/BhesswcY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(966005)(6862004)(316002)(4326008)(2906002)(478600001)(86362001)(8936002)(26005)(66946007)(41300700001)(53546011)(83380400001)(85182001)(66556008)(8676002)(6636002)(6666004)(9686003)(54906003)(6486002)(38100700002)(186003)(5660300002)(82960400001)(6506007)(6512007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkZaY3A3Zm1UZDA0d0IxQ21DcHNNa1hLZnAvVVRER2xTUEtsQzMzRUIyOFFJ?=
 =?utf-8?B?SWR0SEh4c0VtMjBwMjJFS0U4VnVHSWkwMzRTR2p5dEdWTFo5QU1pamlybjVN?=
 =?utf-8?B?cGsybGM5aHo4b0JHMHAzb3NJNS9vd3ZXVGZxVEEwdDRMb3FUSW9tcTJ1R0dM?=
 =?utf-8?B?NEkxWmJOVDVrOVdncGlRK1ZYUU9mb3RXelhLWTgwcWhlOGM4eWpoNjRvQmoz?=
 =?utf-8?B?clFVYzVFMXhISUorMTRlMGFIUnVKUzNVUXVGYU10bXBSajBObksxOHFXRUcy?=
 =?utf-8?B?eGZCWkpBOXpNSkYxNzZsWUlia3ZXSzFJYjhkUGN1MFVKZXpKUE5LbEcyOTRE?=
 =?utf-8?B?TVY3UGx1bW44MDVvNXd6OTJMeGlOUHBiYmxxaksvbkp2Nm82Y2Z2SFQreTVp?=
 =?utf-8?B?ZTNMd01lOS9Ua3NnOXhFNG9reXI1QWloazAxNzhOQ29yejhKQWVzbXFaUGZM?=
 =?utf-8?B?c0s2N21kUlNTSWU4MXA5QlY1RmpRVktCdDBPaWlac3BVei9DbFpGTUVuNlNF?=
 =?utf-8?B?QjBXTkFOZmZxQTR1SURJWGhrWTlselVmVThjK2VXb0xXSUNPaTFrUFdEdjdI?=
 =?utf-8?B?c0lYQnd4enQvZW1hdWJua3NVcjB1eDhyMHB3dmsvV2pPazk2cGhQL2ZNT0FD?=
 =?utf-8?B?cVBiZFQwRnZOYnRQdzZ4d2tQSSt3ZUw0MUJLdDdmcktkOHV0VTcxaDFyRGds?=
 =?utf-8?B?bTZmWkpMVTh1NzU3Q3pvQWtxazRBdGtXMjRtb2VUd0Y5T21lcXRDMVJDT0xX?=
 =?utf-8?B?UkYyeUZiLzZIUUliSUc4UXVSd0YvT3gyZ0k4a0NkQmxTa0xvVXgxY1dqSmJC?=
 =?utf-8?B?ZUlqckdrWW4vdU5IZXdSR2paNXNhYldzUkhPNHpuZDJaQTBESXcvaGY4cFVH?=
 =?utf-8?B?UE5zL0dzdTF1VjJCUDUzdWVpeEVMczRWNjYxbzM1N25kU3hRWFJ3SUJpQUo0?=
 =?utf-8?B?MGVNTTNGQWVPbXVacjhmd0lybVB4UlF2S3ZwMEgrY2ozMFpQTS85RXNkTGdV?=
 =?utf-8?B?WTg0dWJtN1Z5dmpIV3N6ZTlNcEVGdUpwRS81QjhhRGhmbkVCUUZiTkp3d3Fi?=
 =?utf-8?B?b01RR0RTZGFOWGhTcE9QbmhTNHVJM1lYQytsNU5idlprVTdIbnNNUG1Id1JF?=
 =?utf-8?B?UmxlYmJ1SGxTdTZvbnRPSUFnWndCL1FJOXBGaTRkenMvVzRPL2tEcEkwa3lz?=
 =?utf-8?B?Tjk5VnVxZXdmSGZRWEhOU2RwQUxGQVN0dW9ZbWtMd2o4aWd2Z3h4dnU3eDFG?=
 =?utf-8?B?UzY1UmUzWHA2Z1Z0anBDd2liOHl2T3ZibWpNYkVPNWs4Z0Irb3dHUVA5N0I3?=
 =?utf-8?B?Tm1FNFlIUzh6VFZQSHh4TjhkV0RIVDNUelJQK1VNeWsydWlmZFhCN1ltUmEr?=
 =?utf-8?B?dkJMeEZtelRNeks3cll3NkNjekoveGxFSE9uUW9TWTBRVEFHaFcvbTU0YTZu?=
 =?utf-8?B?R0E0eGVBYmh1eCtzSFpOSmoxUWljS1J3UmNKOThnRHFHOEZIK0MzUUhtc2tB?=
 =?utf-8?B?OVAzOW4rVi9TYS8xankrL3Byalh5MTlFc3ZDbVhiMHRHYm1jUzVhaHVjZVp1?=
 =?utf-8?B?bXVwanpKVG8yUjJSQlcyY2ZpUCtlbnRZQkVQY0NrbnVBWWswSDB3YW9HTmEz?=
 =?utf-8?B?OVBPVTNpWmtJeFV5TXlRK24xRVJCTDRVcjJVc1BlNXpOOUV3aUM3czN5VGJM?=
 =?utf-8?B?SjZqREVEM092V25nUUVYeDJzL1F2L04zUlByVWE5TGxWVXczbFZKb054MjR0?=
 =?utf-8?B?cGdkVlNKdDhKbklsRmFqbmVHN3VjclBUVFBLUjJkRVpVQmovcXNHbkd0bTE4?=
 =?utf-8?B?RmMvcm9SNWlSWkxPc0FjTDd2dE5JVlk3OExuZjRNTUlFMHJnYWxza1VGMnU5?=
 =?utf-8?B?UlR3eWxNYW9FSWFxKy93U3JNR3JZNGdaRCtFOUNsTjZiNUVqTFd2QU4rSnM4?=
 =?utf-8?B?TElNa1NCS3JlY1lnQ3ZRb2h5TjV2akxXdEcwV2VQRWpxNmZJQU5Cam5LdDdw?=
 =?utf-8?B?QlprSE8zck93eU5UaW5ZaDJWUm5CaEtLREdzUzFKZDhJbllheFhNQTQrcDc0?=
 =?utf-8?B?c3FSazR6Nm1BZ2FFQmJ3SmpKWUs5V1dabmFBL0luU1cwRUpZMkt6MFhmWng4?=
 =?utf-8?Q?zC34e9A1SG3IYtoy8tK5dT/RW?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f2940a-b424-4d0d-8266-08da9577201a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2022 11:00:10.0944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o9t/PZmYbmfC2K145iAcWozWyndZYg0LsuUAWexVD/TfcsQoEXXSI50/cIqGSXhC/JiGBXnjPMNu9TWWdN6UmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4920

On Mon, Aug 15, 2022 at 06:49:08PM +0000, Andrew Cooper wrote:
> On 15/08/2022 10:14, Jan Beulich wrote:
> > On 15.08.2022 10:15, Andrew Cooper wrote:
> >> On 15/08/2022 09:01, Jan Beulich wrote:
> >>> On 17.05.2022 17:31, Roger Pau Monne wrote:
> >>>> Roger Pau Monne (3):
> >>>>   amd/msr: implement VIRT_SPEC_CTRL for HVM guests on top of SPEC_CTRL
> >>>>   amd/msr: allow passthrough of VIRT_SPEC_CTRL for HVM guests
> >>>>   amd/msr: implement VIRT_SPEC_CTRL for HVM guests using legacy SSBD
> >>> I came to realize that I had announced that I would commit this about a
> >>> month ago. I've done so now, but there was quite a bit of re-basing
> >>> necessary, to a fair degree because of this delay that I did introduce
> >>> by oversight. I hope I didn't screw up anywhere.
> >> Revert them, or I will.
> > There is no basis for reverting
> 
> You have falsified tags from me, which is a consequence of the series
> not having been reviewed correctly.

Seeing the changes done to the commits, I guess the problem was the
'Suggested-by' tag.  This was added by me, and has been there since v1
because it was you who suggested to do this work, and additionally
provided guidance on how the implementation should look like in:

https://lore.kernel.org/xen-devel/4457dcd5-6a64-355a-b794-6b404cf90335@citrix.com/

I'm sorry if this turned out to not look like you expected/wanted.
It's possible we had informal conversations about this where we
discussed changes, but TBH I have quite a big queue of patches, so
it's likely I've forgotten about.

I'm happy to make any further adjustments to the code, but I will need
to be pointed out at issues.

Thanks, Roger.

