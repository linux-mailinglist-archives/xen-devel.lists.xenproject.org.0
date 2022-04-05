Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F444F3759
	for <lists+xen-devel@lfdr.de>; Tue,  5 Apr 2022 16:19:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.299105.509606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbk1B-0000GH-6f; Tue, 05 Apr 2022 14:18:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 299105.509606; Tue, 05 Apr 2022 14:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nbk1B-0000EQ-2t; Tue, 05 Apr 2022 14:18:49 +0000
Received: by outflank-mailman (input) for mailman id 299105;
 Tue, 05 Apr 2022 14:18:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPnP=UP=citrix.com=prvs=087021108=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nbk19-0000EI-U1
 for xen-devel@lists.xenproject.org; Tue, 05 Apr 2022 14:18:48 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c01b9f8-b4eb-11ec-a405-831a346695d4;
 Tue, 05 Apr 2022 16:18:45 +0200 (CEST)
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
X-Inumbo-ID: 4c01b9f8-b4eb-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649168325;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=h/HMRmGehioRNhex2ZIC/MLGlu5JrWGWbp6UKmtYWDg=;
  b=VBPQiqgii0bgOUWkcFKHEeI33RlMJ5p3JS/AP7NxC38zgv9hJlvm2P0u
   KS2sY+CSiSuJ+8AVnd9uZMF0rhwQMZb4TGDZZgaAjvy07og8TxDssWmvA
   xg1b/xrVHVCQ1OlBL9JN03L50ainIzMGzYEFSJrKVcq3Y46uWVgS3KEF8
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68051216
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:r/c7/KyWYHv0AbeCC0N6t+c1xirEfRIJ4+MujC+fZmUNrF6WrkUOx
 2sXXmzSPP2DNzeneoxwa43k/RsAuMTUnNdlG1E5qiAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX9JZS5LwbZj2NY02YXhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Nplq5CIclcFL/Xwwt9Mc15yIi85OIsdweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY2JAWQK+EP
 pRxhTxHTCzARENIJwYsEr0Ptt2RhynFdGVgtwfAzUYwyzeKl1EguFT3C/LUZd6iVchThlyfp
 G/N4yL+GB5yHMySz3+J/2yhgsfLnDjnQ8QCGbug7PlojVaPgGsJB3UruUCT+KfjzBTkApQGd
 hJSqnFGQbUOGFKDUNXFZE2UsSa45CVNe516IuN97SfW8/+Bi+qGPVQsQjlEYd0gkcY5Qz02y
 1OE9+/U6SxTXK69EizEqOrNxd+mEW1MdDJZO3dYJecQy4O7yLzfmC4jWTqK/ESdqtTuUQ/9z
 DmRxMTVr+VC1JVbv0lXEL2uvt5NmnQrZlNujuk0djj8hu+cWGJDT9b1gbQ8xawdRLt1tnHb4
 BA5dzG2tYji962lmi2XW/kqF7q0/fuDOzC0qQcxQ8h5rWzxpiL4Idw4DNRCyKFBaJtsldjBO
 hG7hO+szMULYCvCgVFfPepd9PjGPYC/TI+4B5g4n/JFY4RrdR/vwc2dTRX44owZq2B1yftXE
 c7CKa6EVC9GYYw6nGveb7pMitcDm3FhrV4/sLimlnxLJ5LFPyXLIVrEWXPTBt0EAFSs+1yPq
 YsAbpfUkH2ykoTWO0HqzGLaFnhTRVATDpHqsc1HMOmFJwttAmY6DPHNh7gmfuRYc259z48kI
 lnVtpdk9WfC
IronPort-HdrOrdr: A9a23:QD+iHKEuTIS3fojkpLqFAJHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HmBEDmewKgyXcV2/hqAV7GZmjbUQSTXfhfBOfZsljd8k7Fh5BgPM
 VbAtBD4bTLZDAQ56uKg3jbLz9J+qj5zEnCv5a5854Cd3APV0k2hD0JdjpzX3cGDTVuNN4cLt
 6x98BHrz2vdTA+adm6PGAMW6zmq8fQnJzrTBYaD1p/gTP+xg+A2frfKVy1zx0eWzRAzfML9n
 XEqRXw4uGGv+ugwhHR+mfP59B9mcfnyPFEGMuQ4/JlYgnEu0KNXsBMSreCtDc6rKWG70srqs
 DFp1MaM8F6+xrqDxWIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FczPCgnBQ8O1U4e
 Zu5Sa0ppBXBRTPkGDW/N7TTSxnkUKyvD4LjfMTtXpCSoETAYUh4LD3xHklXqvoIRiKqbzOSI
 JVfYHhDbdtABmnhknizyZSKIfGZAVxIv+EKnJyz/B9nQIm3kyR9HFotPD3rk1wha7VdKM0lN
 gsSp4Y742mbvVmGp6VV91xN/deNAT2MGDx2SSpUBHaKJ0=
X-IronPort-AV: E=Sophos;i="5.90,236,1643691600"; 
   d="scan'208";a="68051216"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W22MflDArLbeX+Jyyfn2pVTQgFq5XibnbQtrtx8P9rUvexa3koyruXlpeDb3H/nmMl2nSvKT33flO/3DPS3GiMcqbz8+0QcZbIWaQJnBvavHx1SuzQUJ9QmRjDdO0/kouYZq87DfAto7lz5N8oZhjaXvlbxlq35XhXgD8YToNRVI62kfxvhi88O1Fw+6J8Dw0TDvRX5NGKsllFWMUiFJ6jJbbVZlg9jaXidXJHB9wqH+7SKZSpYkGLocq/DuY+claw4KzBQee+nIoOOI2hP1imibdGPhF+yfaT+1qdZXAAj5V2MflcMmq3Ov+iS391RH7+BGtmoaMtWr5eCy+JKaSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVMkoMk91yFrrJtOSVoTMkVMqr0s1tTnW4QpC202swo=;
 b=kzBUlmSWil6PWP/me/N76+4vUWowFQIk5aZcc5Xi6AiX64NwAHTRGwLZpL9xQfZ30V+YgQATAOH/GKfnnwokc3dUB40uzDgFYOffHKV8+NA1VOIoM0EyyPYStDltAizEcwtTplAlnh/fUhI5aJE/AginiJWwMThIhzonysjHBLKoiIKsromOMj7LmcvF47drUMw4SQBhA5jU91zo4QmE14+pib5tSGAXuvma/n2St/db88XqnYMGmPbDOlxyc6vbZeW94yFPRBums1Z4ZImRn3T/TtOj2YGQKJS/0p+O4ROq40Dx6mX03Cl3Ds4NGbb2EMXiDPQBURBVb4RhYPKT/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mVMkoMk91yFrrJtOSVoTMkVMqr0s1tTnW4QpC202swo=;
 b=ZO2qLSX1xYBOCaT9uEzbJSfyKlcOWaFuS+H2sRyJrmPC1Co8iWYsO5h8VKRphPNZWY8qOBRntO/JycejQQR8XyETz8+pbgc9qKQTD2fIeAz+ikorC7op1ix9Ia5R3hXtPQytR4eaWF60iKlPQM2yop1GZ/ek9BbLrw2qPkzuJPY=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>, <iwj@xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>
Subject: [PATCH] osstest: stop anacron service
Date: Tue,  5 Apr 2022 16:18:27 +0200
Message-ID: <20220405141827.27151-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0049.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebd556f0-e4a1-4228-fa39-08da170f2dfb
X-MS-TrafficTypeDiagnostic: SA1PR03MB6625:EE_
X-Microsoft-Antispam-PRVS: <SA1PR03MB6625AEA0D4E9C8F2DFDB568A8FE49@SA1PR03MB6625.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ab0vxU9uDZWt7uWNpQP+0i61ArYb+Gt3zwu+5p+rNuJP7epi1qadquNVcACDs2FPW9wx4PaIXygTPpizd2z1klkkGfZKIccty1cEtsJRKIzqu+kU5RU3YoPmLbDtBQP5rhdN7ttQFVS1fA6ivXyruxT3RirDxk0TVKXgAnwiYP7F2v9kSgVfSuw/cs6Aw/kqj/Qmo7VXL0UKcVQkZcCzkC0my5fk+E4rwxsf15z6qeQUqR8kRY6gBvUi0nq6mpBjPaDrByru0TyMn2p9nP6UiJ47JA6oy+MEPqsp9T0P8b8HvmlWGJQHX6929IcNFT9XqZwgeb6OWKqltzwxAncsrFkkd9aRiKBmexaDHavAE+t9U8cRKiRF8JtUh5q9reTBCXN0xb4V2a+NFmZH/tvXmEHqR/zhjRsveKphNoSoa+RRsAenxeWbvqPN1Q05eMBrbkRHlx16soSQ/yjLV2004tVH9JD/5V+bn12nxhm5zrTIg9fUpoxEwja8Bkkzw8fR32sVFL65NsFipgFX43cnBvi9KwBHJzKFjrUrr7YxdF+3kVomjzZZLmM1edMuigRpoudIhW/xcawITn+lPVV5Vul7lfFyGwd7Z1tz4sW/Ao5fHx4tQshLNjNCV/0X9X/vgF8IpYlnaa5oNlmCUS12EnD1hh2Q0adBglFMditTcWozqz8MvbhQa7V8tHNekmUjQtXIOPHiQOuUzA3W+kYDcqXCzRAG24ypXFH19X51u2I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(6666004)(82960400001)(26005)(316002)(86362001)(6506007)(38100700002)(5660300002)(2906002)(83380400001)(8936002)(107886003)(1076003)(2616005)(186003)(8676002)(66556008)(66946007)(6512007)(66476007)(966005)(4326008)(6486002)(36756003)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUdZcEF0SzkvWmo4OWwrTXdUM0FtUkRlUmNlMnBKVkF6MHBrZGRWclZkci9I?=
 =?utf-8?B?K3IvemxNZkVWZTNsdGYzWFRzUW81N0w0TVg3cEphMmMrSm92WkVuM0FlK0pw?=
 =?utf-8?B?OTJxK3I2R2djYnkxVlJ1MGQ5dU5YTUJyZ3BnRWl1ZENIZkwrNzdvTVJQNFov?=
 =?utf-8?B?Lzl3MVNyYm9QTTYxdThHTXVpdFFlSmdUUTRTdllQS3JCanl3N0JYVEVaTVBZ?=
 =?utf-8?B?dkVIU21ZbHdpcUJtLytTTzZMMVVkT0xFL2ZCUWxiaFdLbVlCL2NuSVZwOW1y?=
 =?utf-8?B?YlVRTXhqK3J3TExJMVJOUmpxdXd2SWZ2Z1p3NVNNLzRhaTNvZ1VBSCs0d1B2?=
 =?utf-8?B?OVlpT2tyTURkbkxndGZKbW13RXFIMVRabnNWZy9RUERoT0xzNVRsQzlKcjkr?=
 =?utf-8?B?NFhxakNRd2k3MmJmbk9NSDR5MlNDN1Zkdk54WmxtamZSQ2F2OFpSV2FwTlVw?=
 =?utf-8?B?Z285ZEkvWDRnSVB1R2x5aTNiOHV0ZGdJT0M3RFppdTdoOWgwQ3dTMnA5blFv?=
 =?utf-8?B?VVN4ODVLVU9lNUs5OFEvY0NvWFFVemNhcEhvMTc0RDVHa3lSVWhwMFVwdWN3?=
 =?utf-8?B?WGhzak51bEY2NjM4Z2duS0RVZm4yeGpXbkRIOXc5UTA2aC9RRDZpUVhuTzZO?=
 =?utf-8?B?UFVCUTBTM3FFaGQzL3JPaTMzN3o1N0J3NjJsUmRxMFpWd3RWOVNNbHBCMGt1?=
 =?utf-8?B?cDBNNnVPdnNYcjM3cDlOOXJhWjVrTnpxS1RXb0pac0dMN0NqaTRnWU9pZTNC?=
 =?utf-8?B?bkg0aTlKMjBTWmpFTjRXcXJBZFJYUTNlT3VQN1pFamp5YVdKV0hZRGtYYkZ2?=
 =?utf-8?B?MEhZY3lmUmh1aHp5OXIzNHlUSmdFanM1cHcvbHUwbjl2R3dBZ3V6TVB2L1l4?=
 =?utf-8?B?eHVCelRVZjZIQUtNOVF1S0gyYm5qRlRseGtPS0w3SHYzWkpaNk95cFJaOFVs?=
 =?utf-8?B?NkN2R2tWS0VoaS92UGdXV0xCN2R4TUN0cFFxTVBMbklDNUlNVzg3eXlWSk5I?=
 =?utf-8?B?WDV5S0xFSnpGSWRjYkdSUVVJQzZlYktLQXdaeThhUWc4Sk9CTlAwdUNyemtE?=
 =?utf-8?B?dkxTWFdtbEdVcjlyK0JBa0tNNEhMRmlFQWp2VUppS2NoK2FwbFY2MFJITkVx?=
 =?utf-8?B?SGZ3c2dMTzBQeExQTm1MWWxuVHZiQXVWdmN0VkhTaWhwMGh1QVJ0SzlOVEFF?=
 =?utf-8?B?Z3FjUjN6UTVjOU5hMGdhWlZ5QWRpOE9seTRvTkdQV25EMVJ2UVkvWEhqakxU?=
 =?utf-8?B?d29WTHRuL3JGNFMvSHZGSk1PYjNmYk1OSVlPQXBZc2xqQWJZSTlFTytZeDJX?=
 =?utf-8?B?cE1rQnJQWU9tbHF3SXduV08xUFdqZGVVazdlY2ZId3g2aUVTUVZuUUM4QnhU?=
 =?utf-8?B?SWFkcUY1L2M3Q3lOcTVjbk1NY1dka2RpZnRMc0E1OW12Y29tTjV4UklHQkQ2?=
 =?utf-8?B?TVJ4Mkkrc1NueFUrZUtJeE1DTDd0Vmpnc21LVTZnZmhiUS9nbXpJODZpZXFp?=
 =?utf-8?B?N1BtMGllWXgzcjVSUmNlK0JVTGpwZXRLWllxSmx2aTFkZXo2cGxHM2xSVzFE?=
 =?utf-8?B?NTd6VnkvcUJBblFpeENpditYVkFKNjdVSFZEQkdRN0hCdEU5elFLNmN1M2Vu?=
 =?utf-8?B?andkdFcrbXRoT21TSy83b21yYlpxYXR1UnVNNFhVR3B3YmlpbGlVSHdRRm4z?=
 =?utf-8?B?ZkYvMDAzMGhnb2tuVDc3dWF0cHBsS3hiRkJLMndPbWVFOUlMaFlzUFJxVlM3?=
 =?utf-8?B?NXFDUFNDMm5EVkg5cUlKSWlPYjE4NHU2RjUxMDJVbmgwYnJpOFBMNVo1bWJW?=
 =?utf-8?B?N2VkOWRBaEhzOVNUREhpY253ZE4yL09jZndzMlhaTG1YRUVFM0dMa0RYWU1p?=
 =?utf-8?B?ZDZoZExNR1hsNFJoeGZ4SFhWek5IOWtGeXVPRWVoRHBkeXQ2c3Uyb3V6a3Vm?=
 =?utf-8?B?NlFqRlVieit6M0VKUVgxYWU0dHd6enNEUUl0Z1NLMEh2cXAxbHE2L1ZRZk1u?=
 =?utf-8?B?ekgzS2NNdERUdEVhaVdLUmFBY2dBMC9sQnBjYXJVMlMzdUxzZElUZUlEL0pD?=
 =?utf-8?B?MElIOS9rMkR0MmZ3NjRsKzFwSEtsMXFsVS90WkdxR0xTMTAvK0Q0VmZmRWV6?=
 =?utf-8?B?ZnFPa1AzR2hjK2lVcVVMNDRYbVNPOFkrQUxOMlNoSEFQc2J6RitFMnE3UjZ5?=
 =?utf-8?B?NmZ0Y3IzNElVV0txQVlFS2Nub0JMSEhQbU03TkNmTTRQVjB1anloL21sU28x?=
 =?utf-8?B?Vm1WQnR1K3U1Y3NHSEFLVld0R1NvQnl3cCtrQkNhZVkxUTU2S2JSNDNJUmVa?=
 =?utf-8?B?bUxibnNLVmt6YnlwenFCL0hOUkNLaG5xSEU2SERlUENsaGZ2NzNKd3JzYWZu?=
 =?utf-8?Q?7KNAH2MXTbZiQYPw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd556f0-e4a1-4228-fa39-08da170f2dfb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2022 14:18:39.1813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Xk76jDlDZLxQhfcuGmRDGiKkscaITahieo5v/YsHxjgjvODD7uW1hKpjFz/NNftiy7EeZfydkW1ywdRucnePg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6625
X-OriginatorOrg: citrix.com

Just disabling cron in rc.d is not enough. There's also anacron which
will get invoked during startup, and since apt-compat has a delay of
up to 30min it can be picked up by the leak detector if the test
finishes fast enough:

LEAKED [process 14563 sleep] process: root     14563 14556  0 07:49 ?        00:00:00 sleep 1163
LEAKED [process 14550 /bin/sh] process: root     14550  2264  0 07:49 ?        00:00:00 /bin/sh -c run-parts --report /etc/cron.daily
LEAKED [process 14551 run-parts] process: root     14551 14550  0 07:49 ?        00:00:00 run-parts --report /etc/cron.daily
LEAKED [process 14556 /bin/sh] process: root     14556 14551  0 07:49 ?        00:00:00 /bin/sh /etc/cron.daily/apt-compat

From:

http://logs.test-lab.xenproject.org/osstest/logs/169015

To prevent this disable anacron like it's done for cron.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 Osstest/TestSupport.pm | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Osstest/TestSupport.pm b/Osstest/TestSupport.pm
index 8103ea1d..8e3e5f68 100644
--- a/Osstest/TestSupport.pm
+++ b/Osstest/TestSupport.pm
@@ -3151,6 +3151,8 @@ sub host_install_postboot_complete ($) {
     target_core_dump_setup($ho);
     target_cmd_root($ho, "update-rc.d cron disable");
     target_cmd_root($ho, "service cron stop");
+    target_cmd_root($ho, "update-rc.d anacron disable");
+    target_cmd_root($ho, "service anacron stop");
     target_cmd_root($ho, "update-rc.d osstest-confirm-booted start 99 2 .");
     target_https_mitm_proxy_setup($ho);
 }
-- 
2.35.1


