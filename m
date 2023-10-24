Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FCD7D4F02
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 13:37:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621858.968701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvFi1-0004wM-25; Tue, 24 Oct 2023 11:36:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621858.968701; Tue, 24 Oct 2023 11:36:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvFi0-0004uT-VS; Tue, 24 Oct 2023 11:36:28 +0000
Received: by outflank-mailman (input) for mailman id 621858;
 Tue, 24 Oct 2023 11:36:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JtWs=GG=citrix.com=prvs=654e64a5b=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qvFhy-0004rV-NQ
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 11:36:27 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d7de3e9-7261-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 13:36:22 +0200 (CEST)
Received: from mail-dm3nam02lp2041.outbound.protection.outlook.com (HELO
 NAM02-DM3-obe.outbound.protection.outlook.com) ([104.47.56.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2023 07:36:19 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM6PR03MB5244.namprd03.prod.outlook.com (2603:10b6:5:249::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.11; Tue, 24 Oct
 2023 11:36:17 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::acf0:ce2b:1634:5aee%6]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 11:36:17 +0000
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
X-Inumbo-ID: 8d7de3e9-7261-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1698147382;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=zdJeYo5zTzhjNkKy3hzoga+g9blqNT0YrHbEwn2YjEI=;
  b=hxvZ4PtsRT6NV009uGiFpvEgRAkvQDRQGb4V6J2gGd2ErQ6owH0Yqjng
   ePD8tjOj9LCiKcgRiVNLae80V0YiooENAuFD5cjVkfOKkDTv4phGpfrGa
   +k7meEChavzT5jkTma/qNB1FHgZZPU/EPVSlcaKf7QQVUjyCBNouge8wh
   M=;
X-CSE-ConnectionGUID: Cgdx83kcQ8aCpRo8utgKHg==
X-CSE-MsgGUID: NUG12zFwQuaC+YK4LvKkLQ==
X-IronPort-RemoteIP: 104.47.56.41
X-IronPort-MID: 126343993
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:LQWWQaKuNiNNu3ISFE+R9pQlxSXFcZb7ZxGr2PjKsXjdYENS0mFSz
 zEaCGnVM/uMMWr3LYxwa4219RtQuMDSzNE2GQZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAhk/nOHvylULKs1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrYwP9TlK6q4mhB5gZiPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5cDm1ep
 acbIwldZzubveXm3a60aclj05FLwMnDZOvzu1lG5BSBV7MKZMuGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dppTSKpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+tqyjy3bOUzHKgMG4UPJuF2acwknOM/3EaI14ndgefv9q6rnfrDrqzL
 GRRoELCt5Ma9kamU938VB2Qu2Ofs1gXXN84O/I+wBGAzOzT+QnxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+pQSiaPCEUKSoOYHQCRA5dud37+tlv11TIU8ppF7OzgpvtAzbsz
 juWrS84wbIOkcoM0Kb99lfC696xmqX0oscOzl2/dgqYAslRPuZJu6TABYDn0Mt9
IronPort-HdrOrdr: A9a23:vGHPjq9dJjHrMfxnYu5uk+AuI+orL9Y04lQ7vn2ZKSY5TiVXra
 CTdZUgpHnJYVMqMk3I9uruBEDtex3hHNtOkOss1NSZLW7bUQmTXeJfBOLZqlWNJ8S9zJ856U
 4JScND4bbLfDxHZKjBgTVRE7wbsaa6GKLDv5ah85+6JzsaGp2J7G1Ce3am+lUdfng+OXKgfq
 Dsm/auoVCbCAwqR/X+PFYpdc7ZqebGkZr3CCR2eyLOuGG1/EiVAKeRKWnj4isj
X-Talos-CUID: =?us-ascii?q?9a23=3A4X26g2gqbe2BlFV7vRP/mOekAjJuWXLR3CeLIES?=
 =?us-ascii?q?BWW9CUIeSGUKM94BEnJ87?=
X-Talos-MUID: 9a23:iefX2gWGTjPyXPvq/BnRq2g4Jul32rmnIwM8sskipeqHERUlbg==
X-IronPort-AV: E=Sophos;i="6.03,247,1694750400"; 
   d="scan'208";a="126343993"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gdhQRBT1nOmQ2eEdaPcLkcixGqqXzOtZbWjv2/RuEJLjFmE8NrVBKmB88IQ7DqQugmRKz9QYvSnjBVxDkDUAPba7DdRwIHCveLWQUV8jqaefh2Q1+PnfYlR3MMeeV3BEb13zE8NmyKJWd2Kn3CGYKFz2eMR2tK58KlRUXa3B0EQ5GUTxClpNTjePGPF3x75Vk45LCESlSvRJwDeEmAx557aoLyxkFII6wRg1Fuxz1wg5VnUyKAN+KU9/jZyDflWGfyE4ARjRzPdgJP5RgXuVYvGH282Q/aKDvSmncm3x5Mx254CIHiCc3GCWiYvF+ahMpdsxj7LIpgGG/1/xlWd7ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4j9mYNdEBLobWKQtvM3lP0y2DWfbGLHDV4nSpwh1qEg=;
 b=JwQAEnDMNYsA3lEe1IQaw0OSB8FKwdY2ljfRhm9gy9zrHkTg43EvHHYqwc4x5UkkSO9sI2PFINIyRd+cnFgnnspLIkGNOlXsCIqL0LSo2dEIzA/meGaZwmYVosuU9BAyF81Q4DK1lS2U1UQstC4EGGMfVih5Lt6h6lOG//+Q4H9PTJ0MVDQsoYxA/V4dbQ7PzwL2lpUDS/msPrcVB9Dq6VahMQGbNA6EOU/X9+IXEjYvbvrwxtzC7NTKUqfrJhbX89W0IDC0UK8lmcclryQUozLoLkCbvF5fJ/sOgg25Tcf5ZqWWDR0TOBPWSZNCFcCSUjZz1TRShWDR4McS/3ABrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4j9mYNdEBLobWKQtvM3lP0y2DWfbGLHDV4nSpwh1qEg=;
 b=udIAqf3KPgWzjGZIbMfBtFBXsl2kPHa+14/Oa0IuMMyfNBoHDw6ljMfkUPiB6gzFhBtCqHcuRb1BLVKpGG+5YJ1gMjEGSRw6F/Pt26XzcL54PHAteaZyd1ks80spDfB3BIUtymT9LOqFNQxCKyOqEN/8bgmXbvFhmDcKyw3L+60=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 24 Oct 2023 13:36:13 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] x86/i8259: do not assume interrupts always target CPU0
Message-ID: <ZTesLTIulycE1s5d@macbook>
References: <20231023124635.44266-1-roger.pau@citrix.com>
 <a525cc49-69e7-c509-61d4-a2456b3fdbcc@suse.com>
 <ZTeY6JNbNfTVCpib@macbook>
 <2c5a5b6f-5c67-e46c-765c-81999ac1e11b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c5a5b6f-5c67-e46c-765c-81999ac1e11b@suse.com>
X-ClientProxiedBy: LO4P265CA0120.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::7) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM6PR03MB5244:EE_
X-MS-Office365-Filtering-Correlation-Id: 70fe5b8f-f7ed-4751-f271-08dbd4856f81
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ebQV+0hdIxG20JjcsFW8eToaJ6yehHaE4na6zffXXLhBNnjUsMbw/gGFt0ajmYNv7LJt1cd5CC9LpfcH28du3MVoE1PqMzHA7ux06x53U9yF7Zd7p02bXUjmTlmAuWHxqKY37qlALoPTrHG8DWuaextCoDMKZOZOyI3Zu4zeMkCuaJI5p+JkvZy62vTyC8yuHVOiSin15P5Zvkjs2RjZZgQCoo5d5NP5Cv+FCEKUZSx477HPvITRSgfonRO+3r1UH7E8RtvW2m46UwOETKdwZULHha0ip6NRgMSImWG0OiDWv3WBES2sjHmNCdAP2tprIfBPLeNxajjm+dBK5Vfqo0GnZyyMhIy7IMBDYDWMHCL1zyf9Nau7e3cXLZdv7Is77TgVAvQ4HF7/2/TESC1BJ7mNkkrfDf1Quz1Jwm6oGz++T6tP6ZlGoo2vHIkphcY+acH5jJPe6bhq/eE9ORcc1E20+w7ht1zE8xQsTU9F+4Bh6F6KYgs+Xgb7uHd2B5/c+8A7pCHigKbOwz/ZhyIimZTnfxbqKSZXDRitNaiU74Kef4S5RWMhGTD6InbuF2Eg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(136003)(396003)(39860400002)(366004)(376002)(346002)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(66899024)(83380400001)(66946007)(86362001)(66556008)(66476007)(41300700001)(54906003)(6916009)(316002)(6506007)(9686003)(5660300002)(6486002)(478600001)(6512007)(6666004)(4326008)(8936002)(8676002)(85182001)(2906002)(38100700002)(26005)(53546011)(82960400001)(33716001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHlISmNHTGdUQnE1cW5Wd2JKeFV4OTRGcFZGNlRJOWdMcmd1SHF1WU1uaUJR?=
 =?utf-8?B?T1o1VzhpWVF6bHJrdUFxSUdnenNQUnJiKy9DWjVBd1RUc1dRTG1vRjZpQ1dI?=
 =?utf-8?B?Zk9JV3RsVXBTOTRwSTZleUw2TW4vRjRQaEpIQTVnM1ZiSldTem4xbGNwM2hI?=
 =?utf-8?B?WnFJcnhjNS9PbURVeWgwVzBuZXZObzNvc0ZIRFJyRUptSy9oeFFGKzJlRXZr?=
 =?utf-8?B?L1ZYcVc0SnM4YVA3aklYTFoxZjEwbTBKY1dyLzFqUVVJdHBvS3oxOTR4TE5l?=
 =?utf-8?B?dWI5alM1UVh3aGJoOTdEN003Uk9xSnhxOUs1THRNWEoyTnFoRmVmQ2lRSUc1?=
 =?utf-8?B?UDhTWXdhRk1NYnNlaTBSeFpBZDZFbkJvR2pTdXprS3d5N1VpOXpNMjI0Vk54?=
 =?utf-8?B?UFozaURHOWlkaU9wUjYreDI3WURJSmQ0b3o5ZUNiNnRkZmFpaEdGbkNEbG5o?=
 =?utf-8?B?YmFkWmV6bjYyL2JXVVVwQllWeUVUK3lEd0NMZ1duejJwQVU2OFBHcG5QSks0?=
 =?utf-8?B?QjFMK0hsUHhac2hxVjRUY3d4L1Z6eW0wdUM2OHExQ2w1UVMyKzRpRHJtaG9W?=
 =?utf-8?B?VG1OS3BYTmxuZUJSemlkNVRwRE56OUxocXlNYnE3NU1PdStjR0pjZ1krV2Er?=
 =?utf-8?B?cVB5Z2FVMGh0QUpVQTVYWHhDWXk3T0hwcVBtUjFqYWRvQWFtbUQxbU15MmNP?=
 =?utf-8?B?cTJYSHlwVEZ3eVFYOFhvK0JzK0s5NjV6S0UzT05TenlOakg1Y2dMMWJpT01T?=
 =?utf-8?B?cVVzQitDSHJNYUpwSXRFTHpUbWgzQWZOU2RKbFFPdGRCRFlKZUJEU29FVTFs?=
 =?utf-8?B?VWVqQzVtV3poZmd4UGdCTUh6Mzc1azdreG5jSXRVRXFlcVpoTHlydXZlYzVx?=
 =?utf-8?B?TldmdWpmTnRHTDFYYVhyd3phUkxQV0J0ZTJhL0Z2ejQrNllTUDVtalpjb2VF?=
 =?utf-8?B?aCs2VG5GZllGY0JBdTBKV0IzeFltWWNBQ3Fub2RxUTVkNk5YbnI5REhJWWo3?=
 =?utf-8?B?M2gzZnMrNnpXTEpzd3BCV0NwalovZWpuamNFeUJtZVdPQkJsWlI4eklBK2tw?=
 =?utf-8?B?T2lmZWhxTHBveUdKZWpJakJGaytJaVNYQW83TDdyWDFxUFpybUFEa3R1VzlM?=
 =?utf-8?B?aWJWSnhlNlNWbGgrUmZWaGNqdVFWVGowOVRkVVFmTGloTytTZXU0WktyeTBD?=
 =?utf-8?B?NmZsTDU5VFVDMzRDamtFTFFCUDVSYXhFZkdsSTY0SWVGdmJmNDV6WkExeGdz?=
 =?utf-8?B?WkdiczE4bFV5NGliRFhjMkZQQ1Q1TllYbTZHeGRIZUU3QVliQ1NySG9qRFA3?=
 =?utf-8?B?YU1GSUR3T3FrOU9VVnJnVjBZTzFPOStDbm5SNTZvTHRCUFRrSDhpSlBScnUz?=
 =?utf-8?B?TmhnUHB3NWlCNVlTT1JFM3VndTk1ZWZRNExlcUE1S1VHU0xDM2tWbDloazNu?=
 =?utf-8?B?eEZaSWc1Y2toYURQUVVUNlNCaXUxcjg2ZEI1VGtPclplSVgxcVVxak0zeUtY?=
 =?utf-8?B?WmtWSTNFUFdPOXRILy92S3BVSC9uSVFCL1hGU3BKWEZFZ1VOc0FEc25NbkhL?=
 =?utf-8?B?eWgrc25HUDBKV0JBS2tIdjlIekpNK1dLd2FabVVtN3ZzcWFneVFRNTdKbXpP?=
 =?utf-8?B?cEZWT29uNk9rVHlTaDlLZHdhTVovdGI3eHE4TUQvOFk1NThxS3crdXV2cnBH?=
 =?utf-8?B?UC9GcDlJZ1hUZlZvbE1scmR5V0kvWDdheWRvVjkySUtvZUhtc0VmeXYxWitM?=
 =?utf-8?B?Y1FKd1FnZkhaNXZkb2VPa2lWNU4yTU1LYzFZNUt1aXhGUGRSS3pJK005a0s4?=
 =?utf-8?B?Z05QbXcrZTNEbGU1M2lhZjNiZGxtV3h2NXYxeExzSllpcW1FSzloblY5Tkgz?=
 =?utf-8?B?Wk42QmpIQmswUjNmU3hnZXF0WE1jV3NEdzNuV3hJcHVTQWxlbk5tMWtCU1dW?=
 =?utf-8?B?enczZmhUT1lwYVVBQlJrQy9HQjZjODNCdTdTU2paa0NIMXRTeHhWK0E2ajVt?=
 =?utf-8?B?R1NNY01aUmtHZW1lMFZ4SGkrZ2VFNE5YV0xySEdmMEEyZmRTZ1laemhRbVB1?=
 =?utf-8?B?QXRabWdYcC9OL3VObU9LYkFKanVMUndRU0ZwU2FVTlhvc25oUmJ6a2pKbk9n?=
 =?utf-8?Q?9B8VdkiBcMdoO7ZpXp0r00Ehn?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+t6eNysqYWYQ/cFSRgGD4x2cgnpnK6yVYwgpzOR56DfvYTfXp1zWmHg/TXxRFfIRJVI3ArYTWx6gfWjbYiG0iMr0XtCMk/IJSy3JE5OozT22NK+lqPk+U2UJJmqqr9u5FzQ4XAqe6Cq0xerrRlhkXxI430ou/s9lM9D048rXjwcDv+RJrXPoIzTvfKND1tPpw9w5gpiGnX0dnFURmQE91IX5QnW54uTKp8DJNGP+hkp5dMMmd+jM+kyS3FJXbrGPQXl7QBjtCBvzyDA50Cm894mItfs0N3iSxx2eNnMJAKEIA9MTf8Z3FmSWS79QCczModpg7S22qXHR5UkTej+8xxmuM3fwZXPvo4foJMB3jniFjY/xDdY3fYUzF2Mvw1Ax76lfvqgZXt21NrnZ3qEWZ48bkauMn+WicfnXEWySv5PFbsVu28K4ukbh680v8+tNtGut6pYtyOnVPV/qnUoKs9p2ueqh7A28jedtDfbEZ6tbtNeEgKlipZlkzGCpHsZJ1t0S71RwAo7jVplg8812HhCOWuQs/2tg23fhdVzUKShzIqmemYrzP63ROk5uHb7Wtz4dsHhza/aq7unFukJeKCzcDJz2sc8Ito3y+kvRaSd3RFkYiU8kMp+jKI+Qx3kqTiXtXeMIl9rQQQ1SbaBdKpmGGS1v0o3BgdHh5MKaMab3yzGk3LKr2wnm9fCPxygRqOqW82cYaCaTGbr1sQeRBv+acFc3AO7Qy2gvMxXx5lTlsJ9MD5Ew4/aRS9KnidBocxp6PgpnjPeipBNEBpFhqQPh2dkRPcSl6MBYyaQmfTXkmAolSNzE9zZ7ZxHueZ1QUa3ovGDtt4rRYYewAXPOrg==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70fe5b8f-f7ed-4751-f271-08dbd4856f81
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 11:36:17.1494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDOJzR4ZLdt6q9I1PgtV3SVLq63AYyEiR/X7EduEjfW0WcvJYfS/ixS8AIYCvRzx3GFk4si9eDx/B6vu4KHjZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5244

On Tue, Oct 24, 2023 at 12:51:08PM +0200, Jan Beulich wrote:
> On 24.10.2023 12:14, Roger Pau Monné wrote:
> > On Tue, Oct 24, 2023 at 11:33:21AM +0200, Jan Beulich wrote:
> >> On 23.10.2023 14:46, Roger Pau Monne wrote:
> >>> --- a/xen/arch/x86/i8259.c
> >>> +++ b/xen/arch/x86/i8259.c
> >>> @@ -37,6 +37,15 @@ static bool _mask_and_ack_8259A_irq(unsigned int irq);
> >>>  
> >>>  bool bogus_8259A_irq(unsigned int irq)
> >>>  {
> >>> +    if ( smp_processor_id() &&
> >>> +         !(boot_cpu_data.x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) )
> >>> +        /*
> >>> +         * For AMD/Hygon do spurious PIC interrupt detection on all CPUs, as it
> >>> +         * has been observed that during unknown circumstances spurious PIC
> >>> +         * interrupts have been delivered to CPUs different than the BSP.
> >>> +         */
> >>> +        return false;
> >>> +
> >>>      return !_mask_and_ack_8259A_irq(irq);
> >>>  }
> >>
> >> I don't think this function should be changed; imo the adjustment belongs
> >> at the call site.
> > 
> > It makes the call site much more complex to follow, in fact I was
> > considering pulling the PIC vector range checks into
> > bogus_8259A_irq().  Would that convince you into placing the check here
> > rather than in the caller context?
> 
> Passing a vector and moving the range check into the function is something
> that may make sense. But I'm afraid the same does not apply to the
> smp_processor_id() check, unless the function was also renamed to
> bogus_8259A_vector(). Which in turn doesn't make much sense, to me at
> least, as the logic would better be in terms of IRQs (which is what the
> chip deals with primarily), not vectors (which the chip deals with solely
> during the INTA cycle with the CPU).

The alternative is to use:

            if ( !(vector >= FIRST_LEGACY_VECTOR &&
                   vector <= LAST_LEGACY_VECTOR &&
                   (!smp_processor_id() ||
                    /*
                     * For AMD/Hygon do spurious PIC interrupt
                     * detection on all CPUs, as it has been observed
                     * that during unknown circumstances spurious PIC
                     * interrupts have been delivered to CPUs
                     * different than the BSP.
                     */
                   (boot_cpu_data.x86_vendor & (X86_VENDOR_AMD |
                                                X86_VENDOR_HYGON))) &&
                   bogus_8259A_irq(vector - FIRST_LEGACY_VECTOR)) )
            {

Which I find too complex to read, and prone to mistakes by future
modifications.

What is your reasoning for wanting the smp_processor_id() check in
the caller rather than bogus_8259A_irq()?  It does seem fine to me to
do such check in bogus_8259A_irq(), as whether the IRQ is bogus also
depends on whether it fired on the BSP or any of the APs.

Thanks, Roger.

