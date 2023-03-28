Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B44CC6CBED6
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 14:17:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515746.798885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph8Fu-0002JY-2v; Tue, 28 Mar 2023 12:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515746.798885; Tue, 28 Mar 2023 12:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph8Fu-0002H9-07; Tue, 28 Mar 2023 12:16:50 +0000
Received: by outflank-mailman (input) for mailman id 515746;
 Tue, 28 Mar 2023 12:16:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6aKL=7U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ph8Fs-0002H3-N9
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 12:16:48 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6823f663-cd62-11ed-b464-930f4c7d94ae;
 Tue, 28 Mar 2023 14:16:46 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by PAXPR04MB8174.eurprd04.prod.outlook.com (2603:10a6:102:1c4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 12:16:43 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::4189:2d2a:eb83:5965%3]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 12:16:43 +0000
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
X-Inumbo-ID: 6823f663-cd62-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oa/PAlTOyaD2+pukA+xRy8QZN+lt3jf2G6bUHa5rfmqd/sRrz1/e8bsVtRxyZF8QeBqa6E5Z7odo8vlcGogQ3pMt2t1cfY40yuVdht4oTphaiBocQRsHNPDYRx/7iLRGNxzspA2Ij4iI0OYQhcm3aJ3udZeRCOKxBBV8myOTGpTi3Qsl8UXpeAq1ZjQt1JMETW09S0P4ENhdzuTccBf8njSLHrq5SC9yfHnPo9UmouWLl3LJJI6NLlk1n4NDPGRp+Oy42eHMUoCIsRCN2goAWLHqrViS3fx/ovBUAlc4ZixYWVDgTDW6JEi96SZHC+kyAdUJxltWmNtAxEtQO1as5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRmXVPK24nPfY7pgIbbDlalW9xrFtKsQ5snuwt5GU44=;
 b=OtPakWgbToTp4AD46tFcVhtTziPWfNTXHadNlGH2XcCBr++l85q9E54JMum6QXBh2HXSw2VPg3HNYkoHNmrcc7F9wNfNyp5VVjpvuTsILE7OsxYddebMavG4zK2ASsSV/nLbsODObjC6FKE1cvlQbkXtA7wTiSxqCmJVEjs8R9Qu71LDWSUV2s1UkMAtPa+M4cK1jLwxT0v9xVwMpV/dqZv40hVpkvqwy9CUQgpVMwAPa+LwR1Gd3Q4w6BmbS/cLkLhWFjoIDzmiGaqQlTjKF/Jj1fGTeSzoieTgIGTP8iJGrsIEOfja6XakLGqbmwTqiCW8fLgIdNUYbb9yzY4OKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRmXVPK24nPfY7pgIbbDlalW9xrFtKsQ5snuwt5GU44=;
 b=gBYcq7ZwYlxC0xZNDz9rvHq/nQQ7rxtHbYSagh65u7iVUC6610aUoC10usbFICPgCkinGjq42v2lQXmPkkQX3kPcKpU89IzKaP3fccDuqtK1t1oaSRkZB/t36aT+XEL+g1C+DjceRjOtlgd58Rmn8beutYoPUUecEnh33tgDu/yB81CGXmM3U/FEcZh11ckYfjmLa5LIsJ9KgAPwLGmQXDiQhu5sMoFgBTAXIunjw2+zYndBb+TpOId1QVZvrH3/mt44TruNZuw45Rir10CvJTYlAzd3JyrZAxq2qWfu+6Gv90Yh/5G6HwUPz8+EC6yoP/jfx+yIEz6C9qI0VCO15A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <857b9f24-437b-52e8-a195-5bb990a2b647@suse.com>
Date: Tue, 28 Mar 2023 14:16:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4] vpci/msix: handle accesses adjacent to the MSI-X table
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20230324121738.4920-1-roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230324121738.4920-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::18) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|PAXPR04MB8174:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f21998-9537-4ac8-af0b-08db2f864b0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iImogDIusAz5mvT/P11WeRitbzhhvjUYr46UxTvozba5c9YCDpubH/BTwxvOBa0Mi0P+UGGDCH60OgQ/8uB4rhvTjDUsnzpe4/iYqPlddunI38DxdupNSoIcWUOL1pY4Z/N3VGOmY1Db/jz8wRAALXfsFURTLHgxNAbSVW4lWIz7xGyDrucCPHhvGJW8NsGyqZye4rps2ky6Jf+1nDJ0jMq0J1xVZrMkD9ibk5S7Tbu5KF0i2DNEXHhcbomXUVgqpAlaXCrY/unHYl5ccqQzcv+G2DZ16WQOnRtNlRvU6f1QoPdd1Ow+U+KFR+4UUJrIeO0qk6GhXiDIPuyeUYVE0zSzPXUle0IhOsL+iA5NFZHpv8anerZPzBL5Tmn92tRcMymvmb8cvkkIHhoEYC34OlBNHzGhkkkbxptr0GUgveCPTBzgjt7W2/GYCpTUcK1uNx1IQ7VMgbflxZHASATxyaMiiVXBWcFQ5LPR7hHocK4xGS4BPmXwoXSe4V4cUNaaABtWDjooU195ZP91e4nOyCtA8eti8cWjQVTmx+rGHwba9xKkeRHdLad9VRG48uY8COfNAnUCp0eMGhkktbN1xnad00AerZkmtYwOpZOFscSYBypslB3j8j7h7bVFarl/NngPBG3uq088Sfkchd3CPA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(346002)(376002)(39860400002)(451199021)(41300700001)(8676002)(6916009)(66476007)(66946007)(4326008)(66556008)(186003)(2906002)(36756003)(5660300002)(83380400001)(31696002)(38100700002)(86362001)(8936002)(2616005)(478600001)(6486002)(31686004)(53546011)(26005)(6512007)(6506007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VE9DZmFKVzBneVpNNzV1TTdzbTF3ZlloUlo1R1BmanZhY3dDNEQvR0xZVWxE?=
 =?utf-8?B?R2hUK0lSKzU0V3k3NG9hWVRaaVdMdlpPQUQzS1NIVzkvYU9nc0lLZDNxaDl1?=
 =?utf-8?B?TGRyQUlqT0pnMEFIMWJGblJ0Wm9IRDI2VlVKQ3JUd3llblc4YnIyM0hyaTMz?=
 =?utf-8?B?TDVrRzNhT0ZGVTVKZjJaMU5YR0ZPTEdZaHlSTmZGS2xBTWNjZk92a2g2L21J?=
 =?utf-8?B?ZjhsS2tvMlgzS1JnbzlybloremxYSkV4WlhHQU5Md0lrNEQ3b2hqUzZhSGJI?=
 =?utf-8?B?WEZQdEdNRy92UUE2NnlReVhYaFIrNzJkaVN3UytMOXFyRUNYZjhzRFl3TitG?=
 =?utf-8?B?bVJTa2RJUFhxakpaVHdvT3BMWTc5VnRXRU5RWFFJK0JhRWpWR0ZaMXBmaWRJ?=
 =?utf-8?B?S0JKOVpyY2dNWmU2bEtQbTFrRklBVnBBMmJWOWRBdXl1cFRDTTFJRXRSbWxm?=
 =?utf-8?B?MzRaYXNiNktCK1VncHlhMGZudXRST3NNVFFUUUFHQmp1V0Y5RFFNa0NPV1No?=
 =?utf-8?B?UFNxdERTKzB4Z1MyQWFYeU05ZkVhVlNDbTNvemJCZHYwSGZXZyt0U2VJTi9I?=
 =?utf-8?B?WFRtNUdTcUEzRUs0WU9IWUlyYWF0cm1Qb1N5WTNhZEhKYW5Jbm9iUjI3WFZT?=
 =?utf-8?B?ZVhKMHZveDlJdTlLZlVrR0ZQdHpiSHNyMCthcDVLd3ViemlhMU1JYkRNRlJx?=
 =?utf-8?B?QUljMWxxbkhzb3RFRGxUOEtiU3YyOFN1b05hMDBYd1NGdFJvUmQzN3B5QVpE?=
 =?utf-8?B?WDJXMHFBczU2TVM0bklpN01MeFNVZGJHNFVQVndxTnpRWE5CbEp3bStWUE5r?=
 =?utf-8?B?WWRVUHFUajNTMUczYTU4Rm1LWHRFZUhjQVN5OThtMFhqaHhiM3FncEZRYmpp?=
 =?utf-8?B?ME14RkhlYVdHZHpETDdBYnBzREhFSnpydkY2RTB0V3JCalNWWUc4Tzc0UE5u?=
 =?utf-8?B?aHVkZWFYeTNaVHNJK1JBdEk1cUlHZXYvSjBxTEQ2RUlpNXIzenhobjVxcFRZ?=
 =?utf-8?B?WS81dHRUbjJFa0tjMjJYbG1Ja20zaHIrZGJ3Y1gvbnp1RitFZ1hobXJ2Vlo1?=
 =?utf-8?B?WnV5R1hGK2ZUQ2pVazdMSXkrQzBmZ0tOL2xaMHlRMG9xUTBiWCs0MU1aVjAx?=
 =?utf-8?B?R1ltYlNuR0pyN24wQk85b2dEVzB6WWg2UVo3ME5GN3BsVFh4cC9IeHM0aCtp?=
 =?utf-8?B?R1RFK1FqdjVrRWdyMlV1VXp2aFR5UnN3VFNYTlpqellvdDN0ZGRzcFpNcjJM?=
 =?utf-8?B?Sys3ODJSS0docVZSYkpVdDRNNmpKdHBmSncySklVMXVXNXFvaDJhb1FVWWdD?=
 =?utf-8?B?VUViRmQrZmxZaXczUUpyVmkrMFJuV3pYV25GZ0UrWEdQZ3NOVWdOTjhxODJs?=
 =?utf-8?B?azZqMGd5Z2NVS0JPRzhTWlZNWDlLT24yYUtHN3ByVWlQL0lFV0REZVJFQzRY?=
 =?utf-8?B?Vm15RCtWbG94M3hqUldrd1RvT0ZDRVRLM2l1R2FtcDNqd0s5MHZSbExQMlpD?=
 =?utf-8?B?TmsrSzRuOUtyNXhQamFaeFNsOGRjWDlTc2tXdzZxOGNHTlNPL0FyTEcxZ3hl?=
 =?utf-8?B?eDhZOGoyQzllRXhUclFTVkhVclBvOGNNUFNXMENmRE5SU05YcjhqeGVRcWZP?=
 =?utf-8?B?bHdDM0I5LzBUMFJvRHozcjBGY1o3VmRMYmlOdStHTk1mS2JOQ2I3d2EyQmMz?=
 =?utf-8?B?YldTdjVOekZ2WHcvM1FVK3AwZlNMQkMxd3NKR2xWcTU4bHY1aXB2bEx3Y3RP?=
 =?utf-8?B?dU5DSGNXdmc5Vkd4SGhlSHBKc0FTeU81TTRRQjlHSmtvTWlPODdYd1JIZzZ4?=
 =?utf-8?B?WFZMbEJRZ3BvaUhrK09jVjZ2cDdPWU5UOGY5OTlDUUZRdEEzVXMxRkhXUEZX?=
 =?utf-8?B?REFkcHRQczZGTnpqUEZKNDA5NUlybHhWZ0l3MmNvQXZMeXFaVlZwR0doT3dx?=
 =?utf-8?B?MVRnMmpPZTV6SkVlbXJNUDJURkFSQXQ3QnFOaWYvUlpLVFd6M0dFU2R2V2gx?=
 =?utf-8?B?a0M2bnRGeGZ3aThXTzU4U2NYTllpZDFlSXZ4ZnU2c0F3Zk9HazVlc1FKb3lh?=
 =?utf-8?B?amlsVUJtZXluTzRjTGhlRFEvVytVWWpXS3ZDTjY2RE5rV3dIOHFhWHZDV1dO?=
 =?utf-8?Q?oBwzqMvx0W7W2SuiwKvVmzzt/?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f21998-9537-4ac8-af0b-08db2f864b0d
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 12:16:43.5779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VU4HycEDQY0ApE1rWT0QkO5LhQy1BOYenzh35CXw07r7EMlAOy9c2aTkUbLz7a6ar4ojrd1767ONZ/RnayK8Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8174

On 24.03.2023 13:17, Roger Pau Monne wrote:
> The handling of the MSI-X table accesses by Xen requires that any
> pages part of the MSI-X related tables are not mapped into the domain
> physmap.  As a result, any device registers in the same pages as the
> start or the end of the MSIX or PBA tables is not currently
> accessible, as the accesses are just dropped.
> 
> Note the spec forbids such placing of registers, as the MSIX and PBA
> tables must be 4K isolated from any other registers:
> 
> "If a Base Address register that maps address space for the MSI-X
> Table or MSI-X PBA also maps other usable address space that is not
> associated with MSI-X structures, locations (e.g., for CSRs) used in
> the other address space must not share any naturally aligned 4-KB
> address range with one where either MSI-X structure resides."
> 
> Yet the 'Intel Wi-Fi 6 AX201' device on one of my boxes has registers
> in the same page as the MSIX tables, and thus won't work on a PVH dom0
> without this fix.
> 
> In order to cope with the behavior passthrough any accesses that fall
> on the same page as the MSIX tables (but don't fall in between) to the
> underlying hardware.  Such forwarding also takes care of the PBA
> accesses, so it allows to remove the code doing this handling in
> msix_{read,write}.  Note that as a result accesses to the PBA array
> are no longer limited to 4 and 8 byte sizes, there's no access size
> restriction for PBA accesses documented in the specification.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> Changes since v3:
>  - Keep the vpci lock taken for the duration of the access to the
>    mapped region.
>  - Move back the handling of unaligned accesses before getting the
>    table map.

I can see why you've done this; let's hope the excessive logging won't
trigger in reality.

Jan

