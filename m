Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B7872062F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 17:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543185.847929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q56iZ-0007qV-QS; Fri, 02 Jun 2023 15:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543185.847929; Fri, 02 Jun 2023 15:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q56iZ-0007nh-Nh; Fri, 02 Jun 2023 15:29:31 +0000
Received: by outflank-mailman (input) for mailman id 543185;
 Fri, 02 Jun 2023 15:29:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0ON=BW=citrix.com=prvs=5106ed88e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q56iY-0007nb-0K
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 15:29:30 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 42c6d543-015a-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 17:29:28 +0200 (CEST)
Received: from mail-mw2nam12lp2047.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jun 2023 11:29:13 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6714.namprd03.prod.outlook.com (2603:10b6:a03:405::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Fri, 2 Jun
 2023 15:29:11 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 15:29:10 +0000
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
X-Inumbo-ID: 42c6d543-015a-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685719768;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LKE0CDfYkUupWcA3viqdWcZIbfJ+FGpea+4D2eyCixI=;
  b=U+l80D4nDidYjDPpV5EmTVQX3X1bZ+cWgowYThS8gsyuLc8zfE9W0b6H
   CaXIeUDjddbj3GVRt65MfZ5td7vTZbovF/TTUD2igGgH41VfIKi2glk4K
   ME+EtK1yswwCM0/taDezO8/vJ2FIzozMog3fsfvIqooVyX5CeZ3qyvME3
   8=;
X-IronPort-RemoteIP: 104.47.66.47
X-IronPort-MID: 113880451
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:fSdlDKxVw7Da0kwje9d6t+cVxyrEfRIJ4+MujC+fZmUNrF6WrkVRy
 TdMUG+POKuNamWge4xzOdzj8koC6JPczdBkG1ZrpCAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPaoT5zcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUh22
 sQgFhcAVBek286T5oy0ROtIgNt2eaEHPKtH0p1h5RfwKK98BLX8GeDN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvTaVkFMZPLvFabI5fvSjQ8lPk1nej
 WXB52njWTkRNcCFyCrD+XWp7gPKtXqiA9JCTOHlr5aGhnWOwUEfCTdLd2KQuN+kjlGyQPV1M
 1Ebr39GQa8asRbDosPGdx+yrWOAvxUcc8FNCOB84waIooLL5y6JC25CSSROAPQ2uclzSTE02
 1uhm9LyGScpoLCTUWia9LqfsXW1Iyd9EIMZTSoNTA9A5sa5pog210jLVow7TPHzicDpEzbtx
 TzMtDI5m7gYkc8M0eO84EzDhDWv4JPOS2bZ+znqY45s1SshDKbNWmBiwQGzASpoRGpBcmS8g
 Q==
IronPort-HdrOrdr: A9a23:fIOlbK5aT+cu4o5uqgPXwPfXdLJyesId70hD6qm+c20tTiX4rb
 HXoB1/73XJYVkqKRQdcLy7Scu9qDbnhP1ICOoqXItKPjOW3FdARbsKheDfKn/bexEWndQtsp
 uIHZIObuEYzmIXsS852mSF+hobr+VvOZrHudvj
X-Talos-CUID: 9a23:DeY5MWPJSzg2BO5DcRFIzHYqPc0fdVqB4FL2HUC2C0JvV+jA
X-Talos-MUID: 9a23:t8WsgQv03Iq0dQyKW82nmTZPOMZCvoaXI1krjJEZt9KjHzRtNGLI
X-IronPort-AV: E=Sophos;i="6.00,213,1681185600"; 
   d="scan'208";a="113880451"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTQUw4f5F1V3A8OtQmVDFS+qIEq3ng7h5ibndT+oXLU9Wdpa/O4vcUG94Mybiw82T35rLT/bpqYBEoknwklE10P+tLYiIE+s4fnQI1gR7wm9OEgDvrXTDhcMFwViLK/SFuBb0vlJwN738eX9S/gK6qpbcLT+R7qbjEwyhBcq9Sq0yPOxi7Llx30SWsoNqNUuKVYrTI3pej0eMrhlt5iDQuGHg8ghgJKOCppLvcnfPtuFpy+igW4HrxpOc6qM46gLpP7DxfvDC7WiJZMqkV9VLkX/vHxURHYYg9BrDanOlXZvqpPkujCU/mmW5JPs98nZxA8X7t3pnnfE6gVcaPyomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2a4vqm2XozbjUMsUFwmxFRIY0FiSEtYltgSUDl5JnI=;
 b=SWvd1bed4JSwY+leefBKcJY9cGQPblcQQ+vtaZA8zFp+6z5EQ9C+UIRA+MVx/GWFOzWsj5zE85AoEHkk6cxdIa77OqyvCk0pAmhNxDAuW36ewsmmDXDbyn4X30yIGk+k4iUZ7FP/rgoPHeVfn4xTw3XobpDziPr6D+b7kd27cify8OI9f/aClFbAng6Uj7sHyPARl6E8xIK8t7T81wa+3APv0iuvh1Zy/gx6kWzoBqfUmcjSAlXe8ylgU/N7C/JIAsmQVAF13Ve0HrnfmbLlpLvI0snH7fI9nvKlePwFl2IdVI9YsSMqYEfJ5CWxqfoK/4CQRFplaXBC8cUsDiIfhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2a4vqm2XozbjUMsUFwmxFRIY0FiSEtYltgSUDl5JnI=;
 b=IRmN+RiXYFrJWNr/LcyOe+ixaYsBggJfDUzprvBbgijvrPDUpgsg10pDvAWX4Vmf3f1kFEcwJ90j7qYmEgZ7j2ZyG0lJH9P2595xVnD00QsGkX22bMs6l3DdhBz4ElcrF7qKCDqdIc/CZNwWXrvb0teERKROO90AaTgPQHhIKyw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <bd03669c-66be-a64a-e73f-a80f372a6484@citrix.com>
Date: Fri, 2 Jun 2023 16:29:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/3] x86/cpu-policy: Derive RSBA/RRSBA for guest
 policies
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601144845.1554589-1-andrew.cooper3@citrix.com>
 <20230601144845.1554589-4-andrew.cooper3@citrix.com>
 <1ce6bd53-089e-e8ab-3b54-2720a3fd2c12@suse.com>
In-Reply-To: <1ce6bd53-089e-e8ab-3b54-2720a3fd2c12@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0483.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::8) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6714:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cc4bf14-ed60-4356-5799-08db637e1cbc
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rz56XQG4fE/UzGnm4DqWB5vVhQj1F3882jhNDpYXzP/7v7fKK/QuWFyjOR6TQ6vxNv4jIhE4AyrlHXJDprJ/8AK0MEmd+amjxVO+cc/lVdPbYUlAQBkVXxIxJ7cx4UHmbzH5FApBV33vWlyyl/0NW/XwcoQujkS3PoVna2CWbM5H3CWspnrUKVMd7TCVWtRFLl3xlU9qOj2InCy29dUXSDE5nXattSYvemVG8aBW9qRwBpzJd11z0r5aMv+A9MpAKF3p0F/y4Dr7uPUU50MBDZ8j3/absCW0zspCTrtNGWTkcIeeXqUlMSoIwypsZYxvtt+KYK1gfA85P4DFIhY0rpjXz0aWFVmuWjHabDVwaa8GqGZkZCh02xvlPh6GwjJRgo2zFQekYm4R/1tcDsp0+jugMGE2ZLLPFgcwPLOcMqClNoG545QcHG5Bt6JMfCkdb25EWv0hTQXulP+QGlOqxBGWzb6BPaf/D+vcWNhW7E2v969YVhQvGz0ktGJJPISGFze4N42jtR7UcgDntN7SWD2uM1PMqh7B163QRX/4yrV3xrVhKY/lQx35oXfe3B94SJqhAsgsu4wE5kYk6q6vCVZ6QjlFT/7+LOmzHAvyr3G/GyBatPZofJaHJae/xvV4/wbCpLKPGFg3zWqGhmSAJg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199021)(41300700001)(66476007)(66556008)(2906002)(66946007)(31686004)(5660300002)(4326008)(6916009)(316002)(54906003)(8936002)(8676002)(6486002)(6666004)(478600001)(6512007)(36756003)(53546011)(186003)(83380400001)(82960400001)(2616005)(86362001)(26005)(31696002)(6506007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXV2NjdSQmY4NUVyc0VhbHd1VElMNElDRmNLcjZIOVBNalJpa2V2RmJ0dS84?=
 =?utf-8?B?c2ZWV0IyWFFuKzVKUjVuUFdYaVRJMzZhZUw5cDV3NWVRRFpFbUVsQnRRa2Q4?=
 =?utf-8?B?MDdJalRmaTUyM1Z6Y1Z6SEdSbWRodmZ4THNwdGtReFNjZ1QwUktEVXpnTEV6?=
 =?utf-8?B?ZzlhUHVXQXA4ZXFTU2Jnamd2ZG1jcVFOVTUrV0l6djZzaGJXWXVZUmtlR3pH?=
 =?utf-8?B?M0FLK3d5S0dVeUNGQjRNa2R0WTVuNnJXVkhKR3NuM1NOUGFtL0VvLzY5amFW?=
 =?utf-8?B?eXhtQmlESlliWWlidzdUODlmWVlsVGs1V0lQSlBMQ1VzYkNTdXdQeTluY1B3?=
 =?utf-8?B?SnU3STdYWlhVQzltbk02dnRTOEdhdFB6djBiWmdRRkJTdDI4bGc5bmVMdS9K?=
 =?utf-8?B?ZFVtTGV3a2sxZUpsRkwxcUZsTGpIK1pyeUlXcWRybDg2amVpdXlRL0V2Rm83?=
 =?utf-8?B?RDVMcUNzSUFudk5HaFdQQStyU2t5N09YU3o5QkxwSkpMRHNOdGxWYW1OcXYx?=
 =?utf-8?B?ZFNtTytUZmZrNGJxeWZuT3RlcTYrbklnWWdGeGZ5aXU5cWh4UVdpNldKeWlJ?=
 =?utf-8?B?Q2UxZWQ5QXBMZnozaTUvb1RsdVI0T3VCVHlFYThrNktMR0ZkZW5vMDhqL3hB?=
 =?utf-8?B?ZDRrYlozT2lxS3VSNlF6MUFtVm9vUjhYSHlsa2N1dlF2RG1wQjBiMnVLM1ZC?=
 =?utf-8?B?V2p4SDREUklFMENnekFHdW9Ca0ZrSTRUS0lhMENwaHdObTJ1S21FMzU2Y2Rk?=
 =?utf-8?B?dEMyL245Y041VHp1a2ZieTFweVplREQ4QldhWHF0SWpqSndTcWlrZkRmWGJH?=
 =?utf-8?B?SlRRUXJZSFRCQ2dkZjRYdlJ1ZGxCRVovQmk5OExydmZPdGxrTS9QNGNwa004?=
 =?utf-8?B?RTRCZXlVQzlLMktTTzZETS8ycFNLSjZ4REEyMDFmOEtEYUFMZWhHclNOUm80?=
 =?utf-8?B?T3dCbzJhMDlaK1ZhY1pWNnVOdGE1QU1uNzhyK1MxSjV5ZkpkczY5clBpdUh4?=
 =?utf-8?B?VE5PWVMySEhtVi9XSFd1cTBkdEp4dHFRV2V2bGt5aGFPYnFjRVlSZ0JvMmg3?=
 =?utf-8?B?NlRIM3VvSU1BVHI2S2tjT2N4UTJSQ1pFZmg1eXRNN3FvUFBNOUFzYmw5cmh0?=
 =?utf-8?B?Qy90V0VsdlN4aFF4Qml5OCtKRUhpM3pVVlNhbE9iRTZ1SGJmandaNDFEank3?=
 =?utf-8?B?clUzclNuODNkU2FxaTFKU2V2MkFDdkg0MW5XMjQrY0R1V2ZqVEJCeG5NeFpG?=
 =?utf-8?B?cG1LVFpIMkIrRUE1R2swUlp0c1RKZ2tzTHpPdWs1akpLRmZXUFJJaVJuQXo4?=
 =?utf-8?B?Y1duektZSXpTMEhDV2pmL0dsdHZHdVNXV3FsN1VmeldaYzZaM2tGUEw4M2hQ?=
 =?utf-8?B?TFMvMkoyVlZSNkpYK2VIbjJxYWdrVlpPNG9pOUt1ZnY4eHdJVkhNN1poNVJs?=
 =?utf-8?B?WEJpWWV5RUhmczhhcjR5SWQ2cHlEQml1MVl2K01VZ0xQdG5KQVMrTFZ2U0Zk?=
 =?utf-8?B?cXJsVkNFWEFOYlZMWGtCaEFsZEptelJwK0RKQ0IzWllzQm9VNDZPQmZXeWFI?=
 =?utf-8?B?K3pZZkorem1peEZqVkZ4eGNVTW90ak13NW9ZaXZLS3R6N2dzMEFWK2JEblQ1?=
 =?utf-8?B?Z1Y2NUpFcXN2N0s3d1AySnd6bnZwcVRIeFpxWXlRdnZHZk56ZXNEa1lINnhy?=
 =?utf-8?B?ekZlYVluUTZjMHE2b3hKdXJ0UklrNzUxZFVSSWJteW5uL1JHcGtzVXZsNFJV?=
 =?utf-8?B?eDY2bXV0T3hrRVVnaitZR3dIbWVNTWpUUzNIQkpFblhSRFFIaVNaeGMxNzBo?=
 =?utf-8?B?ckdLc3ZyRFRWWHo2OGZVc3JoaERiWHE0ZWVwOWdKTTdRVTI3dU8xSm1zSC8r?=
 =?utf-8?B?WUZpTkFHVXFEYzNQeFdJNTl3bVRzSnY5NTJwVVBqaTZlRkJjQUhybVYvSmd3?=
 =?utf-8?B?L3pjci81VTJWanlaR1pNMFY5eWVuYjBJOU5rWDlDS1ZUTzJsZ2VFdmZFMVFP?=
 =?utf-8?B?bnR0aGMwd3lmMWVCYVpMRitTTmFUdHM5cVlEWFNrb1RlRlY5SXUwMmhnYkdQ?=
 =?utf-8?B?SVk2cC9GNmxqSE5vNmpqUlEwcjlRUjZ6aCthLy9Zanc5Zk5rUE5IUDZGRHZL?=
 =?utf-8?B?cDY5YlhWRmVkR2FncDAweUIxaGlEdmJoc1pHYTA2anNoVGs1SElhckI1ZjFZ?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	SkhnLiAo7YMVJsJBANdbXCbqXSREuLq4lrJHaBEtgjRT4ryeOPRb+wkaFg8H+bdi4x7iEXNdwiegnWYmMWOnXBQSPaBC72mmTsomCWAtvKRFsZJQxLTh8wzpLTF1H9WzYgzr8iMK0mcEYwrFYngr8JKJr4C1GM/a1kttwBPdy1j3dU/MVME8sEh9O/aWD+8xOYHCU9eKW5JVHPF3+e/6DPZ3E1qfgpr5HHCAJ+Dj2fEwCDYLQ3UKE0ZysWkucwvajnRIAYi0hODOT2dA8YM9UPGuT7CgAKz+eWAvaYMPF5i8iqEgfH+lOjVEAM2PvWVNuMMmD7UfM0nM9pHrXBiSOmTFxBPopftua70MgKMEI8sQIKhuTUkUXYMPyPVMR430IznRo9WCYsxvYCQqDOjRSd8cBOyeGFR2L450S8roIH3uBKMWu/wyAAYB5az68nYGiTpSfmni2JeST3optDUSvBEAmNMoI5OcTU9WGUAzZOs5Ct8nbolAd1krO8GhEY4aS+79uTKoOq47hWFxQ2Kl89zAphUdLjtP6P3rrdFcHz6M/8kdtQyotKZ5+IPhpxKsOaJvLzwJgm104E2Vza6ahHg4CJhcUqjBoHu+0bMd1KcQP0hHc+wl0NaFrcrFrnnMUHtv5gQfW4lb+ieYB2hpD8O0VMOPUh+mmHTI9uTpv6y8p1Kc/0fzRrLU+IbZHOzTo1amcZakA9eQGICA3AxZc77DkvK4uZWLTqbkCDuxEay3WRklI9zDsWnTOykEQbeoE9yDBTXKD/XfZ9mSE7w04h7zvhjvhO7AJm+evL4gtiKfhCUUdlROROnhBkVXS+ce
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc4bf14-ed60-4356-5799-08db637e1cbc
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 15:29:10.5424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uTGUUJUB9Ghf+qmQwXguXsnlitulsj4cRgnFfHYTMvEr8rLlnf4Vg/K47P2b/I62L4PnHOYJtdqGrgywbSvwaYnntrEf0tFN0jJwUR1prQI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6714

On 02/06/2023 11:20 am, Jan Beulich wrote:
> On 01.06.2023 16:48, Andrew Cooper wrote:
>> The RSBA bit, "RSB Alternative", means that the RSB may use alternative
>> predictors when empty.  From a practical point of view, this mean "Retpoline
>> not safe".
>>
>> Enhanced IBRS (officially IBRS_ALL in Intel's docs, previously IBRS_ATT) is a
>> statement that IBRS is implemented in hardware (as opposed to the form
>> retrofitted to existing CPUs in microcode).
>>
>> The RRSBA bit, "Restricted-RSBA", is a combination of RSBA, and the eIBRS
>> property that predictions are tagged with the mode in which they were learnt.
>> Therefore, it means "when eIBRS is active, the RSB may fall back to
>> alternative predictors but restricted to the current prediction mode".  As
>> such, it's stronger statement than RSBA, but still means "Retpoline not safe".
>>
>> CPUs are not expected to enumerate both RSBA and RRSBA.
>>
>> Add feature dependencies for EIBRS and RRSBA.  While technically they're not
>> linked, absolutely nothing good can of letting the guest see RRSBA without
> Nit: missing "come"?

Yes.  Will fix.

>> @@ -786,6 +825,20 @@ void recalculate_cpuid_policy(struct domain *d)
>>  
>>      sanitise_featureset(fs);
>>  
>> +    /*
>> +     * If the host suffers from RSBA of any form, and the guest can see
>> +     * MSR_ARCH_CAPS, reflect the appropriate RSBA/RRSBA property to the guest
>> +     * depending on the visibility of eIBRS.
>> +     */
>> +    if ( test_bit(X86_FEATURE_ARCH_CAPS, fs) &&
>> +         (cpu_has_rsba || cpu_has_rrsba) )
>> +    {
>> +        bool eibrs = test_bit(X86_FEATURE_EIBRS, fs);
>> +
>> +        __set_bit(eibrs ? X86_FEATURE_RRSBA
>> +                        : X86_FEATURE_RSBA, fs);
>> +    }
> Now that we have the same code and comment even a 3rd time, surely this
> wants to be put in a helper?

I did consider that, and chose not to in this case.

One of these is going to disappear again in due course, when we start
handing errors back to the toolstack instead of fixing up behind it.

The requirement to be after sanitise_featureset() is critically
important here for safety, and out-of-lining makes that connection less
obvious.

I considered having guest_common_default_late_feature_adjustments(), but
that name is getting silly and it's already somewhat hard to navigate.

There's quite a bit of other cleanup which ought to be done, like
uniformly adding new bits first, then taking bits away (I suffered two
bugs in init_dom0_cpuid_policy() getting this wrong during development),
so I was planning to leave any decisions until then.

> What about a tool stack request leading to us setting the 2nd of the two
> bits here, while the other was already set? IOW wouldn't we better clear
> the other bit explicitly? (Due to the EIBRS dependency or RRSBA I think
> this can really only happen when the tool stack requests RSBA+EIBRS, as
> the deep deps clearing doesn't know the concept of "negative"
> dependencies.)

Hmm - I think there is a bug here, but it's not this simple.  I think
the only reasonable thing we can do is start rejecting bad input because
I don't think Xen can fix up safely.

Xen must not ever clear RSBA, or we've potentially made the VM unsafe
behind the toolstack's back.

If EIBRS != RRSBA, the toolstack has made a mistake.  Equally too for
RSBA && EIBRS.

I think this is going to take more coffee to solve...

> Similarly what about a tool stack (and ultimately admin) request setting
> both RSBA and RRSBA? Wouldn't we better clear the respectively wrong bit
> then? People may do this in their guest configs "just to be on the safe
> side" (once expressing this in guest configs is possible, of course),
> and due to the max policies having both bits set this also won't occur
> "automatically".

The only reason this series doesn't have a final patch turning
ARCH_CAPS's "a" into "A" is because libxl can't currently operate these
bits at all, let alone safely.  Roger is kindly looking into that side
of things.

It is an error to be modifying bits behind the toolstack's back to start
with.  We get away with it previously because hiding bits that the
toolstack thinks the guest saw is goes in the safe direction WRT
migrate.  But no more with the semantics of RSBA/RRSBA.

I explicitly don't care about people wanting to set RSBA && RRSBA "just
in case" - this is too complicated already.  The only non-default thing
an admin needs to be able to express is +rsba,-eibrs,-rrsba to mean
"please be compatible with pre-EIBRS hardware".  (In reality, there will
also need to be some FOO_NO bits taken out too, depending on the CPUs in
question.)

~Andrew

