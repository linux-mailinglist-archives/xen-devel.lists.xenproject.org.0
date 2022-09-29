Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D40935EF409
	for <lists+xen-devel@lfdr.de>; Thu, 29 Sep 2022 13:12:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.413638.657414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrST-0003PU-0A; Thu, 29 Sep 2022 11:12:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 413638.657414; Thu, 29 Sep 2022 11:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1odrSS-0003Md-TP; Thu, 29 Sep 2022 11:12:00 +0000
Received: by outflank-mailman (input) for mailman id 413638;
 Thu, 29 Sep 2022 11:11:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KRGE=2A=citrix.com=prvs=264d7c073=roger.pau@srs-se1.protection.inumbo.net>)
 id 1odrSR-0003MR-Hu
 for xen-devel@lists.xenproject.org; Thu, 29 Sep 2022 11:11:59 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 83470939-3fe7-11ed-9374-c1cf23e5d27e;
 Thu, 29 Sep 2022 13:11:50 +0200 (CEST)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 29 Sep 2022 07:11:51 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SA1PR03MB6625.namprd03.prod.outlook.com (2603:10b6:806:1c8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.20; Thu, 29 Sep
 2022 11:11:49 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 11:11:48 +0000
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
X-Inumbo-ID: 83470939-3fe7-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664449917;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=YHhBQo1nqW0Mu2OkQEJ2sy4knnmAYYis86Nw7yg4uPc=;
  b=ZuaEcTBVvVz9wX/gKh5XG0Ui/2hRVTKG4OD1CFSKp4236IxjriQZysSn
   /7CHkq28Bfy2zcQ90Qc2rHAoqyhsYyqXFH/rKqaUIym7PwOQi15XlDjfq
   HTvQPnUT0CU3EJcTdiKvrSPh6CyZKlvtwAkrsrM0V1qZpf2SVmr8Dz6DP
   E=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 84126404
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qJSmqqJG8gThWeihFE+RDpQlxSXFcZb7ZxGr2PjKsXjdYENS1zMDz
 WIZW22EOvaLYzSgLt5/a9uyph4PvseHmNNrGVBlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyj4mJA5zTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FbUn66VwKmh2z
 8MzFTIhVA+pqLOS/73uH4GAhux7RCXqFKU2nyg6iBv/XbMhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9Q/T/PVpi4TQ5FUZPLzFKt3ad8bMXcxItk2Zu
 njH7yLyBRRy2Nm3mWbcqCzw3rOncSXTQYBDDeGa76FQvWaQmzwZLl4Sfnu/vqzs4qK5c5cFQ
 6AOwQIsp6Uv8E2gTvHmQga15nWDu3Y0S9dWVuE39gyJ4q7V+BqCQHgJSCZbb94rv9NwQiYlv
 neLgtfoCDpHoLCTD3WH+d+8tiiuMCIYKWsDYy4sTgYf5dTn5oYpgXrnUdJLAKOzyNrvFlnY4
 z2Mtjl4uLwVguYCzaD99lfC6w9AvbDMRw8xow/RDmSs61ojYJb/PtP2r1/G8fxHMYCVCEGbu
 2QJkNSf6+ZICoyRkCuKQ6MGG7TBC+u5DQAwSGVHR/EJnwlBMVb6FWyMyFmS/HtUD/s=
IronPort-HdrOrdr: A9a23:pAHr7688VR9nRLzMoTFuk+FDdb1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXZVoZUmsjaKdhrNhRotKPTOWwVdASbsP0WKM+V3d8kHFh41gPO
 JbAtJD4b7LfCdHZKTBkW6F+r8bqbHokZxAx92uqUuFJTsaF52IhD0JbjpzfHcGJjWvUvECZe
 ehD4d81kydUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInty6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXkIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6W9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtb4idzk7hdAAoqJ/lp
 T525RT5c9zp/AtHNNA7cc6ML+K4z/2MGXxGVPXB2jbP4c6HF+Ig6LLwdwOlZKXkdozvdAPpK
 g=
X-IronPort-AV: E=Sophos;i="5.93,354,1654574400"; 
   d="scan'208";a="84126404"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qzn3/WPWjBYLUqC9KkO8G7SK4JpiMZYL4vPizTsQlCo3KA+F1VNIal57dKmDKrVT2w2Z/6Z+mINVmj4AZrBLeORJbVnMN5kEo+DteLDwFh6ruSMCsecJgK+QcdpfvcWpl6BWxZOcoLeGkc9eu0oV2D11gBoIDPiFEfgqM9nlsrG7882mxlOriAq3+XVmlXGJ7XTYxyr/oNOEcKPa6PqvUI04uZC4bryCObVHnjQ2w4xpH/htEUZVEEDTTf/dd3TusZfLw20uRfbXqxglnpE0iNfwJ+Ti6nP4SeTSU+umoeNcL/+685UaBhk90EcrpVSqhM6YQrNGKEixUMfzFj9u4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4COfsltNZK/AWvNwM+XQ+1QAEOsZ+dW/FHxAu99r5M=;
 b=ElGYeODdXz7JaBpquI6oga9/kYb2bfsCmayWVyqQGdTIk0z7uM5o7Zws5nQUKfaPl1DyyKjVXSnm7Gay1xGMOyEfAp7OuJcvxicDQw81dsv5vdFQ/2wtUhHj1a6QrBk69AWJSjDnH3+J+mW5y22PoqR1l1w7/259YcCcTlFka0If0przW7XdQF90PJSRy3hMBe3nK52QPfZR488IlCGe8o09I59rAnt0g+BmSUUWho4pgXEh9qByMVGdwuDPZOixwAtvm1+wLG6t0q1aGiFOE35EuzvakvT47VVRT8gv5kvySbO70jEdiW/3oRY23Br3gNSFeZ5HdstYXEnY/Ay9vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4COfsltNZK/AWvNwM+XQ+1QAEOsZ+dW/FHxAu99r5M=;
 b=f/T++lc5wnuQXwSdvOGdvU5UkJj/iLWQYvNFIC5MH6DkiBsC1PJ+TaaqAWWYzHk1TiCPlHBtUprzwvFU2Nv+ZZzQZb5pM+KliOQEJ4JNN+SzABR/kIj5gkWzAe4ijF513E72+teOBa0jw0blgBblad/BQ3yk+4VcEpIZMDb6i6E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 29 Sep 2022 13:11:45 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Henry Wang <Henry.Wang@arm.com>
Subject: Re: [PATCH 1/2][4.17] x86: re-connect VCPUOP_send_nmi for 32-bit
 guests
Message-ID: <YzV9cQboU57K/hcB@MacBook-Air-de-Roger.local>
References: <96adeb88-dcc4-5ca2-54a4-883058169dbb@suse.com>
 <8b5c0b8f-b243-47b1-2ce9-f315d5c7138c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8b5c0b8f-b243-47b1-2ce9-f315d5c7138c@suse.com>
X-ClientProxiedBy: BN9PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:408:fd::34) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SA1PR03MB6625:EE_
X-MS-Office365-Filtering-Correlation-Id: 157157ea-b685-40d0-df45-08daa20b66ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XS7mB7MIwxSHnmp0zEaM3zhWZZhOqPJGC8BJeosaeTcR49KGzwIMg4bx1AOs5pohU63xkhL1L4MkdoMxCqPbzrXrpfbMrDnqzzq5aZCzzZIEFxylCJ0LhnRkMt2r8bGt5zITVQ6eyWmyWmfoLUEkEOCl2LrKJgQF/eptxHpjbMesysPOcnBuxpXSV11L4FztI2mF1/u0NEexWs6ba8Hn7fxA1cgtNUurgXqhR7mdFj/B21/M1OrLtYB4fLEOPdhu0yhjvtbo8IFwKsohDo6TKQ4mufc70dohIkT7n9dIjKTBp1Zbn4sMAenCIAf7EMITKCFn/CK8wIBkO202Dh32JHhxjgwtrdzwITNPy37tKq9C9fyY3NETWTeQ6xWvuOxHk8QwSWw815p6/0X5tYSt6uk/bwLhtkLhFzkgcCjffmbCnOfdEFUOUvjvLsXEVcMLJLrQxyjuMbpRWkAzvQwiH7PzT1fEO+dBur4zzrPJuB56ewJxjDDh0McSvQb62aQD6FAicM030I2h1GOAE6zvgInN6b5KG2en1RNYwnbggxT80aNGuirpgbvQbYUNA/clkuru3Iy0v720gQdOeb6CsMbVgdwMwsMkgp+rAnO3NyuZU1Z0xj1DCfVmrXe8iuav2l1oKIOufcgjECas04BlI0JUHgATTaYJMoDFMsgBAPEqNgvrmPu3YL11ss+ODLLUMW7RYonm4IzCFkyrHY014g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199015)(26005)(2906002)(186003)(6486002)(66946007)(85182001)(41300700001)(6506007)(8936002)(54906003)(478600001)(4326008)(6666004)(8676002)(66476007)(86362001)(66556008)(9686003)(4744005)(5660300002)(38100700002)(6512007)(316002)(82960400001)(6916009)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dlJJVFphRkhRYnJZV2t4MGh0aU5NRG1EdjhwSkhJeWZ5QmN1VnM0QUJNTEh5?=
 =?utf-8?B?Z3IxR2svMEs3TWo1ZVltVlNQV3JtYzd4S3hsSFQ1MW1oTlB1d285RTJxQ3JW?=
 =?utf-8?B?V3diT1RPaDdXSGpqS3dsdXNpMWduK2tSN2txY1lkQ2ZIeCtZUGUvNndWUGJy?=
 =?utf-8?B?bHVtZDdlTmRxQUhIMjR4R25hb2cxVzZmWklLWFlUekZETkQyTFFveENBQ1lr?=
 =?utf-8?B?RXg5QmZIaWRVaGIwdlJtWk1lSXppTmxXeVY1ZE8wL240N3d3eitsKzRSTjJ4?=
 =?utf-8?B?RHM4K1NrbEVhTUlUZUNJTlJEajVBSXRqMXBET2VHSURkTjRxUWRZZCs1eXhR?=
 =?utf-8?B?LzJrb0R0TWJXV3NEMCtqdFJ4a0JHT01CY1FwUjgrNkJoY2FKZElvU3NLSnlp?=
 =?utf-8?B?RDMxTCt1Rm9Sc1BIT0xmVnpkdWxhbi90N0VVVjF1b2FLYmhqY1hNRHRBemRG?=
 =?utf-8?B?ZmpSUnlqcjJsb3lzamg1bG9QSDRoQnBvUU1UUFJlQkVOcDFkdmN3UFpRMTBL?=
 =?utf-8?B?dHordXc1VWJ2M29ZUEk3c0lMRktSMHpLdE01VHdSNFY1NnJhYzk5akpHZmJ4?=
 =?utf-8?B?d3R5Smk1WGJWTTgxeGdzUSsxMytoaXNkNjRPZW00M05ZbkpwT3ZSdWFjS1h5?=
 =?utf-8?B?dXQ1c05XdlNxaGJyTW9mcFFyTEM5dFpTaXNCb1J0cXhUdGVoS2I5d3h1YjFo?=
 =?utf-8?B?d2YxV3hnTDlsMWZwelhUNDNLcWFNTVFZaWdRNFY0M2htQTllVE1TWTYyNGZ0?=
 =?utf-8?B?SDhocUFlYndrRUl4RUJDY0MzTmlYZzJtbVo4WEpZL0hMTEphS2tFeUY1NTc4?=
 =?utf-8?B?M1Z2czFIM29uNGE1bHJ1cjFCVXRXZVZpRnpDQS85MURML2N1bkxNTURodmFB?=
 =?utf-8?B?NTBUWFdmYm5XMFlPUmlJMU8zWW1Db0FyVERRSm5UdHpXbWgvR1gwbTZ5UVBZ?=
 =?utf-8?B?TldJS2RZNnRmRlZlK25kSlQ0RGdYWEJRQ0Z3TjF2d1A1U25WTlRQc29xZWhr?=
 =?utf-8?B?R01QWCtaN2liRFFMZVhUYW1Nc0QvNTF3WnZKRitrSWtmdjJodUxNeDh3Umxh?=
 =?utf-8?B?WStzRWszRjNnVUtJZW9SZ0FWUEFnRkRIeWFGRXhxaTk3RXoweDRyclUvQUox?=
 =?utf-8?B?UnhMSnhtVTk5Rk14YWdEdEhZcnRZeEticVpSdTA2RWRzRGhLQ1hHbHRSU05M?=
 =?utf-8?B?K2xITmI1R1ZCYTNMZjlrMElQTXYwbitOajRCRE9mREszQ0JDMjN0OVlFVUEw?=
 =?utf-8?B?aTdFUWo5czNHZXVxci9NWVNlelNoSTZ1VnlxWXZhZkdLM3JkWW8rZnlHZ1VY?=
 =?utf-8?B?OVdkVk45RUlJRGRleGk2M0J4YUJncEtNUFZGVHAzdWtsR3V6dmZvdytDeDR5?=
 =?utf-8?B?T2toZFF4LzliMjBMNU5YM3BqMmZQYWxYMmQ0ckVSSVJCTDRlSlhnbUJUSkIv?=
 =?utf-8?B?MnhTRjZqcHFySnpOS3crVm1WcmdYbHAwS3FkWGsrMmZLYXRoRXBsOXI2MVlZ?=
 =?utf-8?B?ZXFHWHgvZ3M4empxZFhnemZ5RU8yeDNuV1JyZEZJNUdSaUtpZThSWENaQ1JC?=
 =?utf-8?B?Z1J3R1Y0aDg1K1R4WWovbVE2YWxGdUJmZFNqeXZTOXF0YmlWeUJKTjNFbGR2?=
 =?utf-8?B?eHhZNUgyOVArK29CeXdla0Z2OFI1Nm5EKzl0bGxBVk5DOXJhSC9Gc1pQYUcr?=
 =?utf-8?B?RFlsY0Zad0RHMjJYdm9NSG9QOXYxaUlCTUxkSnpwdTVOM0srVVk3cEwxbTM2?=
 =?utf-8?B?OTVyQkN5RVl5ZlZQZ0ZLeVV3RDFya01QSkhMd0FDM1JGOG1sZXRCYTZvWUhh?=
 =?utf-8?B?N3p5VzRzbWdUc1NTV0lwUDEzMmd4SjIyY1AyeGpiaXloRDlXZUxKSVMrUHZv?=
 =?utf-8?B?UVAwaVQxa09STWh6NXJQUGV5THYxZGoxRkxQQ2g4dHppbFZvakpPek9BRlBz?=
 =?utf-8?B?dERKTVBWNkJUWVRpT293eFlUT1N6U1gwWUY5bXc4dzJyTHBDU0g1cytDNDNX?=
 =?utf-8?B?cUdNbFNXRXJ5TW56OGtkbnBMOGRRK08yYmFnanJLRVZQMEtmd0dSeTBrSWlI?=
 =?utf-8?B?R3pvcWxPSVJLKzJ0SWNzVXJSNGt1T24yOURuRGluRVFRM3RQSmxEZ1JNTVN3?=
 =?utf-8?B?VlNONFZ0OWJvWmo2T3lrSWRjSFBGWi9rU3M3SHdOemVvUkZOMG52VWozV0dY?=
 =?utf-8?B?T0E9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 157157ea-b685-40d0-df45-08daa20b66ff
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 11:11:48.5376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SVxjYdgjlaStY6+Zj/eUIjNJuFlSsamJxu9t3sqr3I6Df7I/GjnsmwKNqo0itnNcc6Vfrkf1IVqVORhISHDN2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR03MB6625

On Thu, Sep 29, 2022 at 11:51:03AM +0200, Jan Beulich wrote:
> With the "inversion" of VCPUOP handling, processing arch-specific ones
> first, the forwarding of this sub-op from the (common) compat handler to
> (common) non-compat one did no longer have the intended effect. It now
> needs forwarding between the arch-specific handlers.
> 
> Fixes: 8a96c0ea7999 ("xen: move do_vcpu_op() to arch specific code")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

This seems prone to errors, I wonder if we should add a note to
do_vcpu_op() to notice that hypercalls handled there need to be
explicitly forwarded from compat_vcpu_op.

I've also noticed that compat_common_vcpu_op() forwards
VCPUOP_set_singleshot_timer to do_vcpu_op(), but that seems to be an
useless jump, shouldn't it forward directly to common_vcpu_op()?

Thanks, Roger.

