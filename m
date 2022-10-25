Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A655D60CF73
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 16:45:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429876.681167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLAf-0003UT-H5; Tue, 25 Oct 2022 14:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429876.681167; Tue, 25 Oct 2022 14:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onLAf-0003ST-DC; Tue, 25 Oct 2022 14:44:49 +0000
Received: by outflank-mailman (input) for mailman id 429876;
 Tue, 25 Oct 2022 14:44:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bJBo=22=citrix.com=prvs=2902c4af2=roger.pau@srs-se1.protection.inumbo.net>)
 id 1onLAd-0003SJ-Vh
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 14:44:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 90952095-5473-11ed-91b5-6bf2151ebd3b;
 Tue, 25 Oct 2022 16:44:46 +0200 (CEST)
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 25 Oct 2022 10:44:37 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BL1PR03MB6118.namprd03.prod.outlook.com (2603:10b6:208:31c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Tue, 25 Oct
 2022 14:44:35 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Tue, 25 Oct 2022
 14:44:35 +0000
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
X-Inumbo-ID: 90952095-5473-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666709086;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=8PhQOTnQuuHUhM3T+je/yvILClfsp3W7lJU0yhhLJTw=;
  b=ShJm4Se3que9WkEYqd7JgC0+sc0Kl7439RYavlrRE6uBOxt/SpWPgc5E
   16SToB9yipGVfDDk2p+q4So4435TjEHyRpAkpX4OEFwXhFTCVcOj05jtQ
   d5pCmwwox+HPJjSwvhFeAgG+ajwxw1Cl3g14fn/7fWkO3nn8YcYfhxoIM
   g=;
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 82566513
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:+ld3M6oXfaGuWCTNelwENeZlRS5eBmIpZBIvgKrLsJaIsI4StFCzt
 garIBmPOPzYa2ujfNx2Oozl8ksDvZfVy9FgSgU/qigyRSoToJuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYGYpLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+4ZwehBtC5gZkPKgR4QeE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m8
 v4IKSJTNzy5hcnm2+rgRuVWg+EGI5y+VG8fkikIITDxK98DGMmGaIKToNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OkkoojuiF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8efx36lBt9LT9VU8NZEx3uB+0s8DSYcenqLmfT6lEqCRPlmf
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpSNEgrt5wejUs2
 XeAhdavDjtq2JWXQ3+A8rafrRupJDMYa2QFYEcsVQIY5/HzrYd1iQjAJuuPC4awh9zxXDr3m
 jaDqXFng61J1JBbkaKm4VrAnjSg4IDTSRI47RnWWWTj6R5lYImiZMqj7l2zAet8Ebt1h2Kp5
 BAs8/VyJshXZX1RvERhmNkwIYw=
IronPort-HdrOrdr: A9a23:1huVyq81FFi0N4YzB29uk+E3db1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwWpVoJkmsjaKdgLNhRItKOTOLhILGFvAH0WKP+V3d8k7Fh5NgPN
 lbAs9D4bTLZDAV7PoSiDPIaerIq+P3lZxA692urEuEGmpRGtpdBkpCe3KmO3wzYDMDKYsyFZ
 Ka6MYCjz28eU4PZsD+InUeReDMq/DCiZqjOHc9dmgawTjLqQntxK/xEhCe0BtbezRTwY06+W
 yAtwDi/K2sv9yy1xeZ/W7O6JZ9nsfn17J4dbuxo/lQDg+pphejZYxnVbHHlDcpoNu34FJvq9
 XIqwdIBbUB11rhOkWO5Tf90Qjp1zgjr1X4z0WDvHflqcvlABonFston+tiA1HkwntlmOs5/L
 NA3mqfuZYSJwjHhj7B69/BUAwvvlaooEAljfUYgxVkIMAjgYdq3MAiFX5uYdg99HqQ0vFoLA
 AuNrCV2B9uSyLWU5iD1VMfgeBFXRwIb2e7qwY5y4yoOgNt7Q5EJnsjtbAid0g7he0AouF/lo
 L524RT5cNzp5wtHNdALdZEZ/eLIUrwZj+JGF6uAD3cZdA60jT22tfK3Ik=
X-IronPort-AV: E=Sophos;i="5.95,212,1661832000"; 
   d="scan'208";a="82566513"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flluZKBXtaJmnRSCPZ/bpW9X3G3NkLhIBN3FR+s/MjElkEZY4+qS189YVrXRwOoU9g1vmJ318oiPgGx6PFwmbE8xnCy2qu73nWi5nu3w506/IJ3XMjp7nZphhXtioWO51JnGwYHmqDnVNfP6DERJCQoC7IwEhyREQsqfjERxGYJYfaW8dHmpFTXZBKFAKmshvy9nOxUuMDgyBuNwHxYw4TyDZIEgrptKKgIbD2tdr+vwlxYvWGNI+zrt2ya3WtuIEKMEptCLr7uLxsr5+G5uLwvlAYfrq0JhczOSsH2O3jCb16uEh9Zt2CpADL/p/HiCWVeSbSaNTYQFQPjeBN+EIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7GPUi43FdBKm4cKAasnOZrxGiaeRkj/e0kPX1lwbDM=;
 b=bnxsBtu7ZBZpX5IRHcYv2pIpTOY8F/YNzG/2ZkwrhBcpSaw0BnwtDRl8G/anCGkQUIuT70toQwIrVu0hVBKpBdi8eY5AHCJP5va00phJvpAVcvREUlTsu3Gsoo3sSK0HnlAtf+hiJW0qO2rMkA/UTbvoO1F8cD7L8bR2yon2rNpA6AYoJrjWt/TVoWPjljguTGOFiCGK+w9TjTaWxcRhDjp2ZE9AVCF54JzujwODOqJ9AYTbAG9ecPBkSwgQczyPl7L+1CMZWNFPthIbhyF5cbj/si1TyiqoweRUjcDyfzWZS8lFak3/JfT9SM3Qh3cjkbrONE90ZcU6xvr8JCbQMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7GPUi43FdBKm4cKAasnOZrxGiaeRkj/e0kPX1lwbDM=;
 b=GJF+SBCy1gh0kND3sRyCKkSJp5NkGMYrTSY73aG9boI4eUB3Q5OxOsWdZAC1mkHioGZ1jya68gRIeGdzQM/qolaBa8eWYowt3U9Ccbn9ev0FzsSE2usdhKSCAp+0j+mDdUmBVjt1dOl5Nm57YICVQFMzbl8kZewnwlTRX3as1q4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH for-4.17 v2 0/5] (v)pci: fixes related to memory decoding handling
Date: Tue, 25 Oct 2022 16:44:13 +0200
Message-Id: <20221025144418.66800-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0270.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::18) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BL1PR03MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: b084e6e8-35bd-4ebb-e594-08dab6976f84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oD5q7s+S+Mwhb95f27QE7fCIBAn3OE1hbsywxafDOu6yJFQ7NheQKcV2iB2SQnFOIvJKg+QGibD+puDhBG3pXmBIU6as7CrhGKji2gs/7YjIg/khWqR57C0TwDnXCiRNWugY1foKHuvpbdTQu7F/H9CIa08L6FNh1qcp9fhEtSJm+Yuoj2n17h/K7UzOobU73GGkiqMGnZOJWOGTnAO9QRxcI5KCdR7PH2dfea9fIgltRfbngOmJt+LxRtOyeF3jVokrcG8A0p0xioCFq0YMMgsQI4nCKR/WithXFWwcR02oNt6u365L+66DLyEvXCf4xMuKXxcM/6Asw7d9eE/kZZhWQyRP6tJjavK4LbvC6BAGowSF+60HJinxzeeC25IEkjW0ynl6rkeGTHcinPbAZeAyrHJwXvjTmim6kP3xWe1OCqfXaorq7EFfmpdZI79c4TdqqEEt/vanWpfqMG6gaOD1B2BcdcGZ6VmfI5Tfrt2UbOJtyt4m3goN/t5KIDutDdBnl7vHbovzzDNPtqLPtuanSFNDOLQ7g4/8KD28Hj9izzzGwc7oPZ2AWXnp9x0tHP5IfFe/kELnbjM5vQjcaXZyBBzSXMyQuQ9+nidBMi9x9v+QRPlccKNqjOWm0eTh0iI3oTmT0gRAtPoR9CKuFt+EVPeiHJF7uX6pwS2aX/pTRdGsjTII4v2w5Gre0Isj0OEmv+KukHIIjgdFxmIRLg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(451199015)(36756003)(66946007)(83380400001)(316002)(4326008)(66556008)(6506007)(66476007)(8936002)(8676002)(54906003)(6666004)(6916009)(2616005)(1076003)(186003)(26005)(86362001)(6512007)(5660300002)(41300700001)(4744005)(2906002)(478600001)(6486002)(82960400001)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wm1JZVlOVlEzYVhIdFNGcTkxSDBZamgreHp5VDRCZFFmZTR0S0dWbjFlWmY2?=
 =?utf-8?B?dDVHVVJQdGh0UHc2UFdQZStEZTkvaE9hT3dScmFHcWpKSjBuYzNuUzJaNTdG?=
 =?utf-8?B?elBaUDNNVXZxRkluTGk4YzRaQ3psY1RMSDlhaVkyeVFLbTA2cHptRk41Z21V?=
 =?utf-8?B?d1FWRGlEdk1ySEpFaE5CdkVqaGQvZkxVNWFUYnF2RG5USjJSb2JVRWJuMHhY?=
 =?utf-8?B?SENxSGNhRVZING9zdE5OMXJwZnBBWHVZckFidDZrTnp3N1RYKzJLWTdmMVdm?=
 =?utf-8?B?NS84ZWlNTiswekhtRGlqdUFXYjRCaDFTY1FDSm5qSEdvbmJEdnNSYUN2N0Mr?=
 =?utf-8?B?L3VYWitaNkUrWVVBY1dwWVpHdnpRU1FlblRhWXV0aEs5OHo1T0xCNXdFUWpv?=
 =?utf-8?B?T3BTbXl0Z1dQQ0lHcnZRY2cxVDg1dmF3M0pIaHh3QjF1Y2FXczBmTnNZdFVY?=
 =?utf-8?B?MmVOSVA3MmZsQTFPQUtqNHVxbUtydEgwekwzUlpoY1dTaXk3NmZKTFBaS3Jy?=
 =?utf-8?B?Y29TUEpOLy9WdmxZVThETEdleXpROTlIRGpacFhONUhBbC96dGxiYy92MlNZ?=
 =?utf-8?B?bkdPd1o0R25SV2N4MTZ2TFVXdWhOZTVFRjZyZlBaY2dNeVY4MGV6ZFFkOUo5?=
 =?utf-8?B?TENUM25sZFFLWnVPY3Q4bjZxekJiWXFEdEtBWGxFR2g1V3NEeGVkV3QwYk9P?=
 =?utf-8?B?azBteTdyOEp1dUxFK2piZG1SMWtMZ2FqMjNlUlAwL1NxbkZ1ZDhNV2VOaXln?=
 =?utf-8?B?U05xeWhrbzhZYmZ0UXJMTGRMaGtiNkFpNmNDOTgvYm5selU4SHgxT1FFMmRt?=
 =?utf-8?B?WnZIZmNjTFMyV2YzOFN5TEtRcjQxbWtudmpuNHNRSjIzekY2R09UN0Q2UXM1?=
 =?utf-8?B?YnRBOExwNE9TbVhub1FxZTJvMUQ0ZS9jeTc1blFCS2VmRXE1OXRiUG1lalQ5?=
 =?utf-8?B?ZmM0cTdGTW5JS1gvQ3N6dk0xTGhqdjlqRUlScjhrVlIvazErVXljUDc5QkNS?=
 =?utf-8?B?L3AybFpzTUtXRy92MFdzbE80S1hySnArQkhmVWlkWW1pTzFPR1dBVlVOeVpF?=
 =?utf-8?B?SDg3RTdpek5YTTFZblRaVWtlY3d6RlFkdmNaWkwrcDBNZGJUZ0g0Yno5Z1Q0?=
 =?utf-8?B?RE0wcjNrMlpRUzJkZkhtc0I3QmxGc2hVbjJoamN4QnBEUmhNM3hjVmtoUkJQ?=
 =?utf-8?B?elIwK2RSMFhhdXJ0ZEw0a0c2QWVXdmUrU1JtR3UrZTVSZ0pzR0NlTHZqYVRK?=
 =?utf-8?B?RHJyeGNpSUI1TUFab2tuOXZZWjZuaW02d1NBV2o1VlJkMjk1QXp5MVFZVXVV?=
 =?utf-8?B?ejZ1ckxHbHBPRUxPdEVTMERsS21LcjFlbEdZREs2NlJiSWhrZjZsV2NsZnIv?=
 =?utf-8?B?MFpqRHh6M2hxcGg1cTFva1RLNUZoMHprajZlaklDc29wQVpOT0t3bVZDRmFo?=
 =?utf-8?B?dWlNclg4eTZPcHhnSjFrRVFsOHMzOHBPOUw4cDhBa2E5S25jNWM5aGxOTXdI?=
 =?utf-8?B?Q1NPVXdHQU11aTdkcTNkbndpbWZ6T1ptWEIxOEZyeGNJSVJtbVFQMmwzSUxW?=
 =?utf-8?B?eDVtWTNuL251d0NJWlBpKzYrTE9vRFJGY3Vuem1xVzY3V2tUNEZ1QitldFNX?=
 =?utf-8?B?ellMc3A4ZHFPNmtGK3NZeGxxakxDekcvbmpzUHFSNnh2ZFF2a2plRkpKOHN4?=
 =?utf-8?B?SnR5OHk1dHU2aW51elc0OVIzS3prQ05sU09wbUlNN3R4bjBlNmFjVE1jc2dw?=
 =?utf-8?B?dDByMzJRQ0hiV3NMQXpjMGVnY0NTK25lYUpoNHdQdC8yNko0UDJZQVk5eGVQ?=
 =?utf-8?B?S1pKTm9pTkVES2pYaVN3dWorTWk1Wmo3WWV2TWVJZlBKTHRtdFk2ZTRNZzh1?=
 =?utf-8?B?dUREbXV5WlFwd3l2Smg5UU1xRDJVUkdSSlliUThaNTlDWVdheUJvdHAwVGNv?=
 =?utf-8?B?bkR5ZHIvdTZvRkFJbEplZHhWM2pUNy9FYVRVYmpWdE51emZrdVpLdDRZUld0?=
 =?utf-8?B?c1lGQVM1Um4wZmxJVnF2SzMyWEVqSncxeEZFYm1Oc3lsZnluR3cremVNMzFU?=
 =?utf-8?B?S3A1OVhkUTlVUnNJd0VsbW1KWEo1TjFTWXVmZXNMZWFWOERzZjkvcE12WWpz?=
 =?utf-8?B?cUNnM0dTb3V5YWxMcWJmVWdBVFdRd1lLeERCeDRJRUpFNTJOMzh4cFVWK0tE?=
 =?utf-8?B?Umc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b084e6e8-35bd-4ebb-e594-08dab6976f84
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 14:44:35.5206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kocVIjseQLSRMvSYSuV5b68D+0Qlyf8IWxmJtspMWNc8nwSK5iiTufibg7fz480S/f8QTzAvURo0L3yT4jx2CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB6118

Hello,

This patch series attempts to fix the regressions caused by 75cc460a1b
('xen/pci: detect when BARs are not suitably positioned') and the last
patch relaxes the check done when attempting to write to BARs with
memory decoding enabled.

I consider all of them bug fixes, albeit the last patch is not fixing a
regression (since vPCI code has always behaved this way).

Thanks, Roger.

Roger Pau Monne (5):
  vpci: don't assume that vpci per-device data exists unconditionally
  vpci/msix: remove from table list on detach
  vpci: introduce a local vpci_bar variable to modify_decoding()
  pci: do not disable memory decoding for devices
  vpci: refuse BAR writes only if the BAR is mapped

 xen/drivers/passthrough/pci.c | 69 -----------------------------------
 xen/drivers/vpci/header.c     | 52 ++++++++++++++++++--------
 xen/drivers/vpci/vpci.c       | 14 ++++---
 xen/include/xen/vpci.h        |  6 +++
 4 files changed, 52 insertions(+), 89 deletions(-)

-- 
2.37.3


