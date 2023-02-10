Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54AB691E8F
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 12:45:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493341.763243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQRp4-00022g-Gb; Fri, 10 Feb 2023 11:44:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493341.763243; Fri, 10 Feb 2023 11:44:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQRp4-0001zW-D4; Fri, 10 Feb 2023 11:44:10 +0000
Received: by outflank-mailman (input) for mailman id 493341;
 Fri, 10 Feb 2023 11:44:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eynG=6G=citrix.com=prvs=3989d3060=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pQRp2-0001xX-Ll
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 11:44:08 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36b8ed52-a938-11ed-93b5-47a8fe42b414;
 Fri, 10 Feb 2023 12:44:04 +0100 (CET)
Received: from mail-co1nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Feb 2023 06:43:53 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5259.namprd03.prod.outlook.com (2603:10b6:5:245::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.21; Fri, 10 Feb
 2023 11:43:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.021; Fri, 10 Feb 2023
 11:43:51 +0000
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
X-Inumbo-ID: 36b8ed52-a938-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676029444;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=L8/7Mz6SoGufMxhP0MH7kRY/O+E6cfykxtojQvlf/kA=;
  b=THHj/vtP8c0p7Z7OaWCl1BIuDRWyd3fx9Lr+1HvMZYNQwu5vMO/XV4fX
   aXsSQDi5ZE2DlfahDoi8xjVhVIhJl3ziRUiXuXDZb/Y+Owf4jrdSU6eXr
   J0cwDGSolNNeCmEnKWQyS2gPiVH/ecW2EixfrcqonfHe/N5C1z+jGgx4X
   o=;
X-IronPort-RemoteIP: 104.47.56.169
X-IronPort-MID: 95910277
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4gyftqNBVdqE3QHvrR1HlsFynXyQoLVcMsEvi/4bfWQNrUol0zBTx
 mNMWmqOb6yNN2fxKop+YY2y9kMBvJHcmN9lGgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5wRmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vl4IUhRy
 u4CEREud1ediOeznOnqVPY506zPLOGzVG8ekldJ6GiASN0BGNXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PRxujaCpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eewHKiANhNS9VU8NZ3uxqC2FAXFScwD3enkfSTs2OCCv9Qf
 hl8Fi0G6PJaGFaQZtvyRRqju1afowURHdFXFoUS7QCLy63PpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWFRHTY+rqKoDeaPSkOMXREdSICVREC4dTovMc0lB2nZs1qFbO4ipvpGTD6y
 i2OsAAzga5Wid8M0eO851+vqy2ojojESEgy/Aq/Y46+xgZwZYrgbIvx71HetK9ENNzAEAjHu
 2UYkc+D6uxIFYuKiCGGXOQKGveu+uqBNzrfx1VoGvHN6giQxpJqRqgIiBkWGaujGpxdEdM1S
 Cc/YT9s2aI=
IronPort-HdrOrdr: A9a23:pCmEYaOBKDoR+8BcTuejsMiBIKoaSvp037B87TEKdfVwSL3gqy
 nIpoV86faUskd3ZJhEo7q90ca7MBDhHPJOgbX5Xo3SODUO2lHYTr2KtrGSuwEIcheWnoVgPM
 xbAs1D4bPLbGRSvILT/BS/CNo4xcnvytHSuQ4c9RtQpMNRBp2IIz0XNu9TKCNLeDU=
X-IronPort-AV: E=Sophos;i="5.97,286,1669093200"; 
   d="scan'208";a="95910277"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMz4VXTj6Sh5fQCDL5t9rpQCwsjFJIg9S3L9jd6q6ei40AUdYdqxOCTgckcuPon1JApU7T6UE7/4JOLO1TQGQPkc66RCW0NUvYrTTCdfyzEy/Nzfgz8IR8drxOM94rmAogbv4oKkSt+NM3nWw9pw8DB+FxD87bLXvvMAsnkFTi6WIujMdMD7smw0bIIdmzVpFwvyoA53k764I2nYGzVUKF/u9tZQedGNhc0Kz73ayN03bou9j2YcWYHCXZG75aAz35QTJiQWNoeo9Wk2I10L1svSfG6/XlrGMZ/5/vZelOyWFowj4pYSCTn62vYqlV3AEqjt8eH+0ABASycKRzpXMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TamF8SrNO6lCSMT/cBeMvIiv3d8WU5RPQ1qkqPNlfSs=;
 b=MfUvUlx4CkuvJ2w69ET8IZ+K6ffVRzM4W0iWK7QSuWQz2FpxE2TedVMewHm+toys4mA4o91foIGLHzlBuDgaBRYkKFPzjFDqUpEZDrUzulMYkKHkRKsvxJxfanjZn1BoQTasXJzE0dPXY2PKCGigTmoDGZ74YkzQZx+EKLhp3nzrB2N8482/KK9KJU4Xmywz7DWs7vigJ5CTvpqtDZL3PomQ0AKsevGMN9pA7npgvBUdr+oQH3dw0smYtsKb4Qtxd3rUKSwJQvZqps22TQAw9oNrcSb4Exk2zK7PyOD3yqNGtJOOOIrg81DyqHO7b4PRXs9U4Lfb6Um7FddMAKGuUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TamF8SrNO6lCSMT/cBeMvIiv3d8WU5RPQ1qkqPNlfSs=;
 b=HpNSVPuPHCrisrH6JyCsUlXNoLyM57QQZJFWtFbEFPqjhwAMPDZ5jOH22W9QhP+r3PcJVc31LqgSieMc6beQAL34mB+9nxvWJBl6W2c5Nyef8oCIiOFTKYUaUm3Bu7AV4Yc0kt9kHSmYNBtg+utxBO7+sGg8sy4q23dewkYY7X4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <9d4810c5-10f4-d9f8-5a8a-3c52db6623bf@citrix.com>
Date: Fri, 10 Feb 2023 11:43:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/7] Mini-OS: add support for runtime mounts
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20230210104628.14374-1-jgross@suse.com>
 <20230210104628.14374-4-jgross@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <20230210104628.14374-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0220.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::9) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB5259:EE_
X-MS-Office365-Filtering-Correlation-Id: 299e8c9c-fc4d-4d59-394b-08db0b5c1437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LNCPtDoP03078hM0tD0zNbMCUvoGoEPMJW29lO2dYtUANcI5TwWjgv/VS6jTexOXQ5CEcYGS72Ian56+ic6wotbznByRSN2NuSGD8eBBemM8b0Wz7Wfpchjf/NosWrU/+qLPN2+/H/p4l/TvJZ8nrvqfHkBdIBS2Qb/9ybY2Yowr+DjyyyC1+zXNF/EmGmcjjKRJYysQnRlc0/AQh5nMJM6RJMlVdbGVA6TfCxNI0ahfzerPS0sRH1NdreO5uyzyIrZRbJXZQgM6qlN8yA0MciXoSNcPqYNGsxIndgg1OJvl7oByJqtoK13KFXd6/Z95WA+Aow4QtLw5187I4F4zlOZ1vi4VYkq3BXk7GivhZJNHd2wSBAxecA8xSjqtY9yURj1nt0EW7bDme8VwwidZF4fR4h0Fg95/YnfMVU+CndkRu3SevuKnmx7CUtCwO7IAygEI67ZWqhpRfUIsWpEIFx7bGrSNEM6pPD9TPz2p+IAsajPy20UoPq+H0Ywzay5cQ0jftBghl53/Dzt8dyggwJ33vvE85CyRDJedX63PCXr+iahQ/w1k4a3rofFrGezAGjTDUMv0P58s6lLnMHASf3OXVF8WKiZ3+3pH325dT6g1hnVxqKaUY/Hp6lDK+qVOI15MtvhPfDaSoCm8zommHyOLZAxQQ3eoCp04YT0dA8y6V7e/d5ozk4/hpVfWwrLlZPILhre7m71M3LTXxJZIzavY94wlQaFYQtHEzzkt8qA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(451199018)(478600001)(6486002)(316002)(2906002)(4326008)(66476007)(66556008)(66946007)(8676002)(41300700001)(6666004)(31686004)(6506007)(8936002)(6512007)(186003)(5660300002)(26005)(53546011)(4744005)(38100700002)(2616005)(36756003)(82960400001)(31696002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzdOZHBVcjJyMXNtT2xIb0dYUHQxNm10amFjOWxyQkV0ekVUdUM2MUxTSEV0?=
 =?utf-8?B?ZVN4dkxtVGpvYnVENkdhS01xeEVpZklXYnZycE5yZGcySU4wNjBRdnFBT2Ft?=
 =?utf-8?B?OWF2RDVQTllRY3JCbEZRb3orUmNtREs4T2x6SWZqdFZ5cFdVSW12SExmWlJE?=
 =?utf-8?B?eHhlN3Z5SVB3QmxDbklDdStzWEtZZzJpejlRTGkwMy9iTHplY3V4L1B6TWRL?=
 =?utf-8?B?SnVhZm5mUmZPUnZJV2QxUUhwSHRDV0tPczZXTUZGNitiTmZvZW8ya3UxSmpk?=
 =?utf-8?B?a0twb2RCd3RvMERKMklvM051b3p0bjN5QTFKdUttY1dCZFhBVmx4NzZnay84?=
 =?utf-8?B?NHNpN0V1NFVjRGFaWXprL1pnWDBET1dyZ3dYSzAwbXkvdGllKzBIZW8zNFFS?=
 =?utf-8?B?QlZBa3pGT0RwVjdzK3JHTkYyR2dVS2F0SjlwTHoyeUNLbnNZQThoRmh6a3Fj?=
 =?utf-8?B?SnlGRnJGdDVxdm5JK1QvcWxNVzA3T1dlMWNmV3lLQWpyV2hMQnQ4YlhTYk1C?=
 =?utf-8?B?WkM5UERvS2hJdzJ6Y2I4Qlk3YjVFK1RBQWhwamdtZ3V2amlkT0NKeDI3WFo5?=
 =?utf-8?B?SlQ0NUtzUWNGMkZzTmpXaVl5Q0NLa0laOHRQMXMwVWhvMWRTUVFMRGk5bFFI?=
 =?utf-8?B?U1dQb1pFNnh5d285N2V1N3V3b3h0UEZmd3JnN1VsYnFZZ0Z4ZFFLSkIxUmln?=
 =?utf-8?B?N1pLNjdwRk5jSWhUTHFVUTFsSWFtRVFVZFA4QzdEZ2JTU3prdllmR0krZU1G?=
 =?utf-8?B?M0dWSmNZR3hLYVQzaU1zSzJKZUNvNTQwNy9tYjR3MThEc2J1TEFOZ3VremhL?=
 =?utf-8?B?WTVuMnNsRE1hWVdvQmhRR0VQVkpENjFmd1Y3ZTZmSE9jK29KWDNWQlNEclBi?=
 =?utf-8?B?MXhiL2d6NUNIRmFNRnllVHRqZlRxMW9LVUZvQ2FRcHIrZHVmQ2N0Z2N3Ynlu?=
 =?utf-8?B?bmlOS3QvUHU4b05zRnZBTzhxbCtOTHpuT3Z2WTVKdkNlMkxia0gvYTA0V3ZI?=
 =?utf-8?B?dHYxV1BXRyt6bXBWOXlCNTV2NG90dzZWRmdPVXIweXhNcW04WThmc25mSXBQ?=
 =?utf-8?B?SHJ2SWdPbVNIYVhLKzRSaGhPNUU2YWg0OXpxcHFvbStWNUs0Y1hWM0R0SmtM?=
 =?utf-8?B?UWxJYmxMOSsraWI2TmpqZythOHdlckpWK0F5OUpQeTE0MlFUc1l6OXVWWHV3?=
 =?utf-8?B?YStWUEFwZmNIbU5pWE5XYnNuVzBFNFlSRWw0UktjY0h3MTY1WWxqUUtNVjhS?=
 =?utf-8?B?RnhvM0RwOFVpOXhuL3FTWmE2clVoc3dHU0U1cGZrMlc0RkIzVk5lU05lQndh?=
 =?utf-8?B?cXJFKzZjV2twbklzVnA5MERNQjFIUjJ0MkdtS0hpMUZaQ3FLL0xZQldoYjhL?=
 =?utf-8?B?clN2Uk5RTVo2enFZcXJkRTRxanQwNC9mZXJkT2lLRFNORWk5NHNMMU4xWFFo?=
 =?utf-8?B?S3d1aDZOK1BzWmdrTThMMVl4N29ncWRBaXhmUm1Fc3ljb1o4VWVtLzNQaHJz?=
 =?utf-8?B?UXV6RDU5UGNEcTYxbjliZVhHTGd4b3FHazBETVlra1dpM2FobExNcHpFSjU0?=
 =?utf-8?B?TGNETXowUmVYWkIxOTBXa2xwRHg0eSsxNUxWTTZKT0JBYUNWelhZVnBxUlo4?=
 =?utf-8?B?MjRkVWg4NTkwQldPSE5CTnBpNnVsbmVlS0tNVE1ZUHhUMGMvRzJZZGFZYU9P?=
 =?utf-8?B?R1dNblZHQTVDcjBrMy9mZURMYjk4cDdhWDZuQkNnSk14Rm52MFRPV2sxcGZk?=
 =?utf-8?B?Tmt0cEptY3FsR3kwSWNYSWdJMklHcWlNSThXTWp4RWJsQzBmZE9iSldGSXov?=
 =?utf-8?B?K3FmUmtyOUhVczlHYjI1dXptOXJkcnlEREY3V3dFRzBoS2Yyc2h2ZjVDa3pT?=
 =?utf-8?B?NnlhcFgwaDhKRnJUMWZkMWRzb05CR2RGa0M2RUg4cXY3TElaYWZmdFNkdDdE?=
 =?utf-8?B?MEtyS1BJZjBKUXRtNnEvRC9sa1dCYzcvVWNyc3prckg5R1Z1ZWZtSmlYdVhQ?=
 =?utf-8?B?MmMxT1J1SFlxbmJFTFZmS3NjSDN1bDQyRkxTbGFrWTczL1diTCtzbEFqSGo4?=
 =?utf-8?B?VmZ1WlQ3NWh1M3pSQmdFdEVMMSs2T2kxMlJxVXI4QUxUS0dKSkFuNXY4ZzBZ?=
 =?utf-8?B?VmlUa21zekx3eUhQdUJBaDVIaCtvcTJvMXd5by81elRweW81Nms2c3VQaUQ2?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	F046j0uk+90fB5KZHaWe+J+YFoIdNDzRigjQtXbsbytnSb8AEksQCpbcYzJjxxBrifgy/eWR4YiHBcmWVkT4HCJX0jgGzxezIBqio46mRbXkSyrFAqpur6DBe/m0JBAGCAzWcENeHfPW8nCTSkm2LXlHI8pxDC1N319ERT3E3D2oWHtVp6pNUOHtIgCO+pYDtSJ+9Zhmlz1rATzqUgNdDLgfmfu33Y+W48B1Ujyb1lLq/fIQV6x9t99kj5DAWUsJHGxREng48v507BbT+5pMOC9vmZ60P0DXE9volg1+3hXFV0WxORDbRVxqcemG8wL6ptFmXzTnU9BeKMFyntfRdahu8gW5z25T+HctbIcjTImyzu6/SbMwQhgHQLmO90aXvSaH1gG1FmmoEi2AVG8YaVVTC9wo7PWs77cGTm1uDudTYMv6WEumCJs0lbijBxwgWVBu6RW08GgpTTkRQXYulRWbs0fdCO9ywouPI/emaMFUseM4L4KWcj9d/gvzvOCZmVMUsRyZOU5u6rnBexJWmSq0uOcHiDoRsBcbN4PDykWpJoXyib7JhVZUk0SGu3ed+4mcX6Tefr5WNFYOSyqEywLZcsM2G2wGo1lUeAOYUaSWRF0eoM7Jgwx/ePquHPFUVKJD+9fxRdaiD1JvMTr18YZrF6jzKSwmjG+7CzR65PoT97yiOzmLn+FHzWlqW2Vebu4ptPC27v4V9xrBSE+JzUDVY9HJhXjEHGzBWKC3W85go1KsPo/2AVcSmsyyFKwvwcjWTD1NFI2GUu4ECwM6wBw4Mon753blPgCvylq5LePrpTrFLB91Un/61iZttcs3k57JbDLwYexDqQacFiI6cDccRsTCmDw+/SEQvm79WX4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 299e8c9c-fc4d-4d59-394b-08db0b5c1437
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 11:43:51.0867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QZMfPrzWEcCq522loYKnQklShJ2Kl5tCMJ/hhZaBiwtCAtpXQXaePP2ccEfDrs77hIkgGIYqGJi0/9dkVtCtxRWI6a2hVcMcc/97EpEO8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5259

On 10/02/2023 10:46 am, Juergen Gross wrote:
> diff --git a/lib/sys.c b/lib/sys.c
> index 2f33c937..dc8a8c69 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -339,7 +339,14 @@ static int open_mem(struct mount_point *mnt, const char *pathname, int flags,
>      return fd;
>  }
>  
> -static struct mount_point mount_points[] = {
> +#ifdef CONFIG_CONSFRONT
> +#define STATIC_MNTS   4
> +#else
> +#define STATIC_MNTS   2
> +#endif

This ought to be

#define STATIC_MNTS (2 + (IS_ENABLED(CONFIG_CONSFRONT) * 2))

because it shows where the parts come from, and is much cleaner to add a
3rd one to in due course.


That said, it would be simpler to just have a total mounts set at 16 or
so?  Does a difference of two dynamic mounts depending on CONSFRONT
actually matter?

~Andrew

