Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE93764CCC
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 10:27:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570935.893562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOwK5-0005FU-P6; Thu, 27 Jul 2023 08:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570935.893562; Thu, 27 Jul 2023 08:26:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOwK5-0005DC-Li; Thu, 27 Jul 2023 08:26:13 +0000
Received: by outflank-mailman (input) for mailman id 570935;
 Thu, 27 Jul 2023 08:26:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Us1z=DN=citrix.com=prvs=565118259=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qOwK4-0005D6-7B
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 08:26:12 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ad9bd73-2c57-11ee-8613-37d641c3527e;
 Thu, 27 Jul 2023 10:26:07 +0200 (CEST)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 27 Jul 2023 04:26:04 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by CH2PR03MB5318.namprd03.prod.outlook.com (2603:10b6:610:9d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 08:26:02 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::2e0e:5665:96a7:5767%3]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 08:26:02 +0000
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
X-Inumbo-ID: 3ad9bd73-2c57-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690446367;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=shHWKyk90/Hfp6MAtzwA6VErmUUQXNzN++/Q/XHQQwM=;
  b=h08OkuNJQrSU0OQMLusQnD6X/bfDbqySLSoXQND6ZVOHU21LU13YheD8
   NCTqfj3a6SCWyBNrA2hzhmnNF0WSmMTCZm4nwiQWDiQ7H6XKFl/axfy1c
   EWB+3rKoCa3+ZwYwtrYq6uTGX8gkKE9OdVwyz84l+wIg5T+SbXbA60EQr
   Y=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 117488951
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:s8jFf65+UEhiPkHdUZymQAxRtPzGchMFZxGqfqrLsTDasY5as4F+v
 mZJXW3SPPiOYTTyL98iPd/npk1T78LXnN5qTwNp/Cw2Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35ZwehBtC5gZlPa8R4weH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 9EWOGsVazm4oM2K3I++YMVohJR+I5y+VG8fkikIITDxK98DGMqGb4CUoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnUooj+aF3Nn9I7RmQe1PmUmVv
 CTe9nnRCRAGLt2PjzGC9xpAg8eWxHynCNJDSeTQGvhCgEKD5GwhGRItDgWnjOal1BfmZvADN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml1a788wufQG8eQVZpeNEg8cM7WzEu/
 luIhM/yQyxitqWPTnCQ/avSqim9UQAZNXQHZDMEZQId7sP/vZooiRbSUtdkFrXzhdrwcQwc2
 BiPpSk6wrkW08gC0vzh+Uid2m3y4J/UUgQy+wPbGHq/6R90b5KkYIru7kXH6fFHL8CSSVzpU
 GU4pvVyJdsmVfml/BFhis1UdF11z55p6AHhvGM=
IronPort-HdrOrdr: A9a23:fb7m7qyTSU8c25CZlSx6KrPwKb1zdoMgy1knxilNoH1uA6qlfq
 WV98jzuiWE7Ar5NEtBpTniAtjmfZq/z/NICOAqVN/JYOCBghrKEGgI1/qG/9SPIVydygdr78
 tdmnlFaeEZXDBB4/oTvmGDfOod/A==
X-Talos-CUID: 9a23:8TDJZm0pNpJo68ENLNDcGbxfMO0rYibFyV7rBGCEFVtsYpGRSw/N9/Yx
X-Talos-MUID: 9a23:KTd1jwSYnZDUVhfqRXTsmyFANPV57J/1VlwgjolY4pG5F3BvbmI=
X-IronPort-AV: E=Sophos;i="6.01,234,1684814400"; 
   d="scan'208";a="117488951"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWQ84w2o3hjClyPPfg/MU4Oq4hEpblX+Wvp52uoLUYXyqR2/q6M1kBappmPFk5CLxLuW83OGXKAbEHpKGGGNFji5VlXLov/UW7KEP8DSFJCIMfsbJv9LSRuwdyMkmkGROqOcB5kDN7/fXOLGSx0HCwbL3HHTQklCOL+V3UTFeXh9+UWWHX6oYtFCh7r/5dFQH75Ioao0QnZdz3w1e0u3ADdWSJnGyTu/bCUfXGfv+9drHcRiduKmT0BLT7NTLebQX/lku2ru8u9JWPdSB3Tkq/FfQZds2vhq6JS1wJNb4N2P4PgUBqxCJ6y2QxBpeHyj+nyc0hqPDLvnZhkbRBKwYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNjCh4pwS6BGBBQD4CbzVFwJV4oSjIKiofyVPcj8q3A=;
 b=Q58FlUjMsKRoz2Q2LjsU5SYKY7gKubcwTUIhm8hTBUd5gah1D8eQ5sI4CTS6Br7qEUdigQPavPw9jnD4zZGGEtohhqhnHvKkhIyfOH8LtbxH0aFDW4tPuZ68n+m3sqtfJRz0L8V7gK8LeRLerxlnREpP+JOns+/bKApswRvYUD8DUTD7bRoPOot4JBqhva8oxaziioGSdXTOsPwwahnqOr1jcMnBErQUppbknVv8moHmHzwXsGL1hM0nhGU9zJ3eUAREU+9Tpj7Y0P8AtNbiA4y3YELXkoHlWmYF36Wa64edyvTLYIvCKPamAWq0rsFjOT2P2KQmQWkSVg1a8Z9zZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNjCh4pwS6BGBBQD4CbzVFwJV4oSjIKiofyVPcj8q3A=;
 b=wyWW2+Ef4ApTGyJKM5okJTONHk3JGFvii6/e5WRaUXzZfh1t1/A2MkYYKtwu4ALBsBagG4c1VB3zvmwiloHUUwpZ6PI+EQRYTh3B9UoY+u2wdutI1ZAG8waOCSxG6Z29sbzK5gbTS04oIwaGBhYQNAD6wjW+kBS8FFNr0eeSrWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Thu, 27 Jul 2023 10:25:37 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH v2] vpci: add permission checks to map_range()
Message-ID: <ZMIqAdIUvegizoQS@MacBook-Air-de-Roger.local>
References: <20230726140132.80151-1-roger.pau@citrix.com>
 <a277dacd-56f6-a5ab-6982-b5cc4f9d507c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a277dacd-56f6-a5ab-6982-b5cc4f9d507c@suse.com>
X-ClientProxiedBy: LO4P265CA0060.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::6) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|CH2PR03MB5318:EE_
X-MS-Office365-Filtering-Correlation-Id: 338905a5-702c-4d33-900f-08db8e7b1d11
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	RA4F8vRwIK5tmezzdSiY/B2ENpgUXFi+nJtBel2zV4QuhdnJ4JSkeo2kII55khsNjY1dMX4N3K8UQdib6BiHM2uqdr7BaGnUSu13w4cAc8xix8ZlVmBjD30j8Okz/Df1HVZz7iahXWgF16xSm9sT2sQJuVdg3lTGPedqN/GjPDkyIcBMiOztR1m6P4GOf3SbQ6soMMEHc6Bwnu7bt9v73SjNk4txQIxDlnPdspgzgkEhqmNsgmivv2cN2Rmpyp08/45O4lOzPss61ZOTTELIImDSvCLDmZ4X1xc+mZRpkVwNkP3tP8hZ8SDgPT9BhgwRpXquoz40Hil3vZxfiVd6zPhU33tppbAOkZn8sYNDgRgNSFG3JtLdPFrvVdyk5iYBnPgVOR0og68egiU29avq9C6nAtorHthez+OFSqR5ydzGHi7h9d2MNNWzTZ1y7vhBa00CFx0fNqfpjckmCjWeFozhsWlUTHyBiff6rXP0+KqTnqiA/75YZhEac6xEDYrjwxkcbeFNKrgY+JncBDufeQojCCplWXXtxcj7H2rV1Ead73H7yeUmXMpn4yi8kLEh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(396003)(366004)(376002)(39860400002)(451199021)(9686003)(6512007)(6666004)(54906003)(6486002)(478600001)(66556008)(53546011)(186003)(26005)(6506007)(2906002)(66476007)(4326008)(316002)(5660300002)(8936002)(8676002)(41300700001)(66946007)(82960400001)(6916009)(38100700002)(85182001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk9HTzhOQlVXSXZuYkFDcUZ4Z1dLL1lBR3l5SW1IT1hwSXBnMWVZZnYxdEhk?=
 =?utf-8?B?RUVQR1FkZ1BLNVdzbXRRNnF4QTBYWlhYSFUvcUptdVkydFJWZ2RTL0oxNWRT?=
 =?utf-8?B?NWhrcXFLMExQd3Q1WG1xeGc3TFZDVW9TZXZUdEUvWFk2anNXYVBhLytGbHBE?=
 =?utf-8?B?aDkzRmZuK1ZSb2VCODdsYXVMb2U5TlUvOG41Ty82b3owRXNJSWVnYWVKT3F2?=
 =?utf-8?B?Q2hwREx6TFBJQTV6QTFlaGY4RkxjVlF0Q0ZyTVdUTTRNbVhINXR2emlDMUIy?=
 =?utf-8?B?eGNpN09QS053TDlLYTJuWG0wS0djUmo4d3BGVTFJaWtjWCsrcVIydlBJZEUz?=
 =?utf-8?B?WGd2cjBlNzljOWhtdjdxbE9uR0dNQWo2SEEyc0YzTWU3MkZmdjhqRVd5QU9T?=
 =?utf-8?B?dXpKOCtSVlJkalo3MGFFczJVK0wrdkRYelV1VU42TG1XOU0zaEFvb0RPemhF?=
 =?utf-8?B?ODNoVU9vLys4cForZWtlVEdzMGxidDhVamxIR3ZoZWtkNTZxcjZFT01Obk44?=
 =?utf-8?B?aWxxcFNHbmtFRlNFN2F0eWZOMVdWVkowcm5TY2wxNkd3djVGYmhXSEV6bDZY?=
 =?utf-8?B?ZCtzNXBvMW9vSitaQ2c5MmJJM3FkOXBPdXRub2RJS0U4WS94c05tWnBXNDhU?=
 =?utf-8?B?bThrRDdrU2lVRUI4azZrR3dmRTNxY3RpUnJtemhwMllqMldVRThsSVJIc2Ez?=
 =?utf-8?B?SHJpZFRaS3lsaktGa01lTXVwdXRkY1JlUXhpc1gyeVVIQmpnaGlaS2NaQTAx?=
 =?utf-8?B?VGkwTVMrQjJRMDRCcVk1aklXUWFkYlpSVHU3Rk9URUJKdUdxNkErckFuNEZj?=
 =?utf-8?B?ckNkKy9wdjNRb3VPRlVsTkVDT2JXazh1UGRqNmVyaUFOT0dOMGdJd2ZCR0gx?=
 =?utf-8?B?cExpWVN5WW9taUZDTGU2dXlxVnpYSDZYQmhEOG9UaVlaSUFKam5GUjlvWTVp?=
 =?utf-8?B?bXkxQjM5cnMvUk9EczJSOHdrYXdJNW9rZG1URzl6U3czb1hmMUtWNEVXemls?=
 =?utf-8?B?VWYxNmgySm41RWpra0lidWJKdFZ5NW5GQUE5SWROZTdZaGxVSklFaEN0Tkg1?=
 =?utf-8?B?RXZSQ1I5OWZ2Tzl2NmxleDRhL3k3bC9VYUpka0VYVmE1UmFjVU9oREVBWVFl?=
 =?utf-8?B?OFhibTZlMno4aGlXd0tBdmZqU3Z2akJXbTIycXJabDdJM2V3Q1JBWmRRUm9J?=
 =?utf-8?B?QUxpVHoyaFE2OWw2Nlk0NVg1QlpWemNvQUxWaE4weFVMWFBGYzYra1J4ZEdK?=
 =?utf-8?B?TDFNbUtoZEwwOFhQbGFxMnNrRXh3Zm1vYmxZbS83NzQyRVE0T2dIM0ZENml5?=
 =?utf-8?B?d3BJalJlNnhQZU5GYVY1dDhhNzhLemttcUJWZHdUWjhoeUJXVTFXczNKL0RT?=
 =?utf-8?B?ZzF1VytjR3ZhNEJEa29OR0tPN3V1eURIN242ZVdjeVliY0JQOXo4dlRhZCtq?=
 =?utf-8?B?Mi9UZ3NlL0dxQXpQSW45dlZCUGRUbytoejMzYkhyOWd4NnBzNnNvbDFMcVdp?=
 =?utf-8?B?R2RpTm9mT0h5T2ZYaHRpL1dmQnQwM0ZQYk5Ud1VObjBRRENwNzhQS2lqZHFu?=
 =?utf-8?B?cVJDSmZnYzR3V3VjTHZObnU2WEJOd2ZjYVdjZGlXQ21rcDhkZlg1UUU4Wi9V?=
 =?utf-8?B?NE8wYU0zSW5aOUVnOHBEZFV0ZWJVV0tIWDdKaHNxOTAxRkkxdnZTaGNGNnpY?=
 =?utf-8?B?TVNaWnp2SnVUdDZPcXE1aWxCQlZmSW9kdzAvaGJsNis2ZWpOVnlTSTdSRmk2?=
 =?utf-8?B?dDFVYWVWL0hNUzF2Vm9POU5mR2pMWStoTHdwQjl6R1hFdEo2NTIwbk5PcVlX?=
 =?utf-8?B?Nkk5NWJpYVh5SzNOVkJub2pUVnh1cmgvYlR3QlhTTDFZUXRaenc2UUt1REF0?=
 =?utf-8?B?aWFvTVlSRnM3M2JlRU0vYjdlbW1SMzBZWXE1amlDMk9IWjlvOWhoMloydnlq?=
 =?utf-8?B?VmhaV3hHbUZTRGJZdG9nUnZxVTkwVTN4S3BvM0pzd2xNQUVzc0pqWjF2dGtt?=
 =?utf-8?B?UjRSOWFpbnIxKzhDK3ZpeENPSWxEWFRNRXJDNURVeVE4V1Rwbkx0ZFRYU3Uv?=
 =?utf-8?B?WHNIUmY4cGxKbUdNbEFVbjZJQWJJdEdXQ0huR2FLd2UxRmI1QXlTR2EyZHlJ?=
 =?utf-8?B?VXB6T29SQTJ3KzE4dWMycDFUMkJBVjdYQVlUMkJad1FFa2tSaEhEeG9YalJ2?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4j6HrFxF/+Okg46lK9Lnzpl8fD3TsWZuQ/WRpNIks6CjFLeyG7PKSi0Ez0HrC0UvQQXBM2Rfo6Owgf6djYpHrJoZXxEo72Z7SSyIaDAec5Tsm80/6hNPBVb+y4MsKUptiIsiUsvopYfWgMgh9H9u9ycpcjI/VtcCQv0yNkbXeYDWbvqKbnWtcl9nC/v5xBc/BdtukpDC4bkzK6RPz85XSEFtmMdq/wzeJPljbErak6uB/x1rlrjuBNEyy483hTok5RR74/IANcaC31XK2OqxL7SWc//nqDTTo4M8FLePWouVZeNCsQrj+PtTWi5Hbk7Qs4JP+WSX7bRK6PSXF8dIZeqOz4eGy3zcJu+aumzFpMukyRuwZsZhb2EYRpKcRSejmVLsfTOxGdj4SmNJ8rDKxd+WHENg3pska+B7Kffl0KOvMDlA2CSJWIBx6mkyPB7C9uVUXp2vSMLQ76iE/QGlmCBLsMfYrMH1KD7LLzDJwQHh+ry046NW8AOB72X2psT5rKm7GN0Z1qe19mlRqAdRyTWLtLmbGJVddXv6eOaIFAOtXsx2SiE01h6n/pX2JGlMXPqfHo605T99BZhFyGJtbc2GNx/PAesFCpoQv/4DobXE7nlxjTNJeKiVLmWxSqEJzOo3myEaZlNxWpE88FOoxJFaTY0mDO1dVtvovr1A3/TNLWYNmA1Rjj7lY6AXPmS3UsQxhW+BiH2J2FopR87eOMeemsp370gGAaF3Y2J/imQkgjb5cNPWIiUF+7A//0EOUChScxj2sQ83annvJtH3tCYm4sWlZCGoYl6ZDBoWFmBs55V7vLbcXyKz3YM/b64gTZiksWkcYKIbw6Rp1G0L7snHkvKI9pnxGRV4Rw1jIv8d4x7qquLpoQjR4752uH36
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 338905a5-702c-4d33-900f-08db8e7b1d11
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 08:26:02.4348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CD9zzxyZzsZbK5h/4g3SbUYz8UW3Z5yex0WTho9b5l+X1GAm4Nz9cujn7EBSVgxOInxzhKra1R+elDOPYnmvQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5318

On Thu, Jul 27, 2023 at 09:56:08AM +0200, Jan Beulich wrote:
> On 26.07.2023 16:01, Roger Pau Monne wrote:
> > Just like it's done for the XEN_DOMCTL_memory_mapping hypercall, add
> > the permissions checks to vPCI map_range(), which is used to map the
> > BARs into the domain p2m.
> > 
> > Adding those checks requires that for x86 PVH hardware domain builder
> > the permissions are set before initializing the IOMMU, or else
> > attempts to initialize vPCI done as part of IOMMU device setup will
> > fail due to missing permissions to create the BAR mappings.
> > 
> > While moving the call to dom0_setup_permissions() convert the panic()
> > used for error handling to a printk, the caller will already panic if
> > required.
> > 
> > Fixes: 9c244fdef7e7 ('vpci: add header handlers')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> 
> I've committed this, but despite the Fixes: tag I'm not sure this
> wants backporting. Thoughts?

It was IMO an omission from that commit, however given vPCI so far is
only used by dom0 (an in experimental mode) I don't see much reason to
backport it.

Thanks, Roger.

