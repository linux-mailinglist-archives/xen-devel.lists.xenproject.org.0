Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA580733037
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jun 2023 13:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550099.858997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA7r9-0004mH-Pm; Fri, 16 Jun 2023 11:43:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550099.858997; Fri, 16 Jun 2023 11:43:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qA7r9-0004jk-MI; Fri, 16 Jun 2023 11:43:07 +0000
Received: by outflank-mailman (input) for mailman id 550099;
 Fri, 16 Jun 2023 11:43:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vb2W=CE=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qA7r7-0004jd-CL
 for xen-devel@lists.xenproject.org; Fri, 16 Jun 2023 11:43:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7d00::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f266cb0f-0c3a-11ee-8611-37d641c3527e;
 Fri, 16 Jun 2023 13:43:02 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7550.eurprd04.prod.outlook.com (2603:10a6:102:f0::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.29; Fri, 16 Jun
 2023 11:42:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Fri, 16 Jun 2023
 11:42:58 +0000
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
X-Inumbo-ID: f266cb0f-0c3a-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F6QFeHvK2s+3+jKuXLppLtV0TFYasbiLTOfqoDdZsmnDViHjRw7kxI8x4fZ3uqpjDYw3fp/oJyUW6sYElg9WGApNyxC9f4Plf6C6fF2FbkSpV6dvXsnJ0D2Wko/VcYySIpc3etYpA/ozhnSl9j2LxOluJdqFIFjFENmAINha+L+vGj+X24cJxGC/D1M49PUSmw4NtwvHYAZU50JAulO9ZQGIbc7KBB/VQaOoGngleO98fYfxgqCyF94tbB7JPSunRr1FB8nBz0j9cNIg0hhWg8hZyFEjrIG0ByBzH8SZcABmFepygSddplLa0N5M0wI+tcxm/C3gepdRSHVJ8xKzwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvsuY0KXe1k/byvGoH2kqL1CJQK+C/t1rDWLZ1M6AoI=;
 b=N5PBnPy4KSyrqxOKT2Jqcq9Ic5l/gRl/IB3bEDNllPGQcTZM/wWEqEnPPFs9jxCJ3nv87kFRKc7eU77aS8dmSUMHdfsFKG4Ftcq7PgcWr+t3BMqheqFlJ9B2F5sIeMv5ytwgUTT5y2uXs56iVpeadsrkb3R0JrjPhgloY9hJUWJcZcLjEuDFO/rbQBdnpQDihrZrNQGFe8LdUf749vb5BV6euhhLiAWBd4rboVOlqdlT2qhrsAeVIyWaNpaTXFTuJgWRhWb4b07WKkHtPNsajrSa7HN4JedsG++nSMg9zMmrrCMS9z3lO17ZtUCmLvERuvbrAQMgqqeWTe8Rfi79+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvsuY0KXe1k/byvGoH2kqL1CJQK+C/t1rDWLZ1M6AoI=;
 b=UQWG2tJhqwzpAOV4gSQI4Iv4D1w7fR/l+wTL9gZaODzoO2RKSx0HSHzbD9eemPLEGJd7fsNeX94gMQoDCw4+Gt4eQkZg30AyQQc5HJpLBqypuuGfYtMWLd5185t+sUm8oSqIw6jy6Li9PIW7O0FVQG8XGaSt7wvU7BNDCSNJB6fTj5tOZ7oCIdom36zvyIKH/mAzTDhQCphmu/CxRiRsn9lGyYuVyNv866kdBSnTloxUk9Sxy+VfMCKVKsrzS5/A1wyB+czEjuoAxoHGFUGvTz16lO6GleC4zKhrNjttBuvh2chWkDL9lZ4166enPM5O5vs8d9BKKswy5whUukKvKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <eb64eac1-38ea-ee86-bc3f-5e5f0e9ab42c@suse.com>
Date: Fri, 16 Jun 2023 13:42:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: compat code lacks support for __attribute__
Content-Language: en-US
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org
References: <20230614104234.56835aa9.olaf@aepfle.de>
 <ea515188-732e-50b2-7e0b-39721e859e11@suse.com>
 <20230616115103.1fc88699.olaf@aepfle.de>
 <554d9f6d-0ff4-c387-3f7b-4f04e24f5197@suse.com>
 <20230616122251.5c7a1498.olaf@aepfle.de>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230616122251.5c7a1498.olaf@aepfle.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7550:EE_
X-MS-Office365-Filtering-Correlation-Id: 51d687a1-b741-450f-b619-08db6e5ed465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HCshRr9lE992J1CKpMejJL4wdy6zBaleGVXiIMbHWKsTn0gxl1GIU2QH1NFzbCQyQTSSqJU+4+vI5eip2TrEeL6p+FHj7ARvOu8+YAbMCqr8EWiBf/hKtOxXua+jf+j33g6qTq+kuUVFdFBTqoOxajKRH2TjUZkveatdUqR9Pudwz1t9zKDIjQwlbQ0baDuiuEwhp940wabEHaGNyw+2gSFtzpwppWXP6KxKS4ZrvKXwtNWJetT4Ca3VHjFtRhG8V4CANeofy3sXPuWILpYEMgGsMGnKlahYZAilcE8OeuOnOKKbtGBy7VdqBZkA/mXHz531deqkWT+743z/tGWm+QBPaG0kJ2Mdccu95CyBodPPwALSqxersE70CnMjHGDOyjLFEhKc673rHEkVnSZBgyTkRddpFumr9d4+ihUGuY7/8nNGra7RAmMBvrLW0AkRpdswfbMcjdcnPLysyWMzm5ce2bKZPkzv3R7ELrv6OSkS/AwwYGo+9MKWnnoRH3xhquhFYaLwPFStNZfekmYnNrYGeHg501k0EslmnmuLJLlQpldy4TbdKGXrRHxiAzu5DfGmxAc1KIuXMxYaxNRrbhDatC18HxqhS1KeEgIkXhGfY77IDW4NmU5f7zv3Nd4JU9Hi8LD1GatvyY+lxy05mA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199021)(478600001)(66476007)(66556008)(66946007)(38100700002)(316002)(6486002)(8676002)(8936002)(6666004)(4326008)(6916009)(41300700001)(31686004)(186003)(5660300002)(26005)(53546011)(6506007)(6512007)(83380400001)(2616005)(31696002)(36756003)(86362001)(2906002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amxOSmpjOHM3MWN4bTY5WFdxSnBaeGhRNnF5eW1OUllaV1JpTnN1NENLMnhy?=
 =?utf-8?B?bktVT3NOZ0IvdXl3SFNoLzNxckFQUjh0eHN5MTZGcU9JZHJjNzFuREI0aG9i?=
 =?utf-8?B?d250eSs3VWJjaTJDUWJjQ0E4aG9qbDh6VGE1WVJlUWlRQ0tLR2lJRXJyTjJi?=
 =?utf-8?B?c2s3Mk1WMFpTU1RDQTBzNXd2UEdMVDZ4b1M3dm9ra25WR0VSdldJdVd5SXVN?=
 =?utf-8?B?WFVxNVNpSTBlUjFEdkFlOGRYeDBGUDZJbmxNQ015UzZmT0lhSkwvTmVtRmJB?=
 =?utf-8?B?L1c1WnUveHl5cFpYMW1Lanh3Q3U0Yy85V01OYyt3ZnJVQzdpSnFhWmJmcExI?=
 =?utf-8?B?azhZWFhWbHhSaTFyTGZ4R1dYdXAwWjJwVndaYktwcFkvMExMTHprSEQzdXNn?=
 =?utf-8?B?anpUY2FudGdkNWdWL1BLai9zWjAxVlJrUmV6d2dkY25xaVkvazU3bThyRndS?=
 =?utf-8?B?VlN5QTQxSDdwbU1FKzFmNHZrR1haT0NBdk5HMzBYdzMybGtJK1ZTSS9IT2hY?=
 =?utf-8?B?cVZ2SXgrVEJzckR3bUMyQlloNWszYW1rNDYyTmJRMFh1Z0lvZlBOUVRXZUFi?=
 =?utf-8?B?Zi9ML3B2N1RGTDhRa0lJem1vR0Z2dUtrZ2h5VWtUU2RCa1FhL2x0NVZibnVw?=
 =?utf-8?B?UmJsTVBja3FoaFNjb0FnV2xXWVRVV0FWTnl0d1Fla3FsSXpiOTVLYUcxQlBI?=
 =?utf-8?B?T1FIM014dU81UlNCNWhjUWRCWUQxTFVsd1FwNGFITkh4NDZQTEF4QVJMUTEv?=
 =?utf-8?B?dXZtWGVKVE5BbmxQSVovRS9tNXloVkNtZE9uZytZR0oyN3RTeWloa2s5elpo?=
 =?utf-8?B?K2xnUVRsWjZRamhHVHNIVkVCZHhaazZ6L0JUbldKMXc3RHo1dkM4REwvc3ZU?=
 =?utf-8?B?M091UUpsWTV5b3gwM24vM1NLLzRFUGZiajZnZHU5VHIyNE8zWE56ejVIemtY?=
 =?utf-8?B?VXVwRy9MNUg4MVo5QzdaU2ZCc0RGYjNISjE3Vi96U1Z3K2Z5TXNaL2I3UkdD?=
 =?utf-8?B?R3lzSHRqdmtmTHZqYlI4ZUpYeUxXN0hxRFpEMm53OTE2MmlTTVk1bFdjbDAr?=
 =?utf-8?B?N1Z0b1lObGZtZUdKS2l1VjF0ellBY29qdDE2a00vTUY0SFB0dXdLRkZUWmp5?=
 =?utf-8?B?b2UwcHoxTmhmc2NiU3BpcU5GYkVtWDlibUs5bFNGdEl0c3U3cU1DV2hXTzJy?=
 =?utf-8?B?Yk44YnFORXZKVm5vbVhZNHZ6SllFUjJWQzI2UEU2c2NVMldLOUlTWUlySEda?=
 =?utf-8?B?ZW5LVWZNRTVjTThZWlNSSXZ5UDFlNXprRDBvTldZQ0ZGNkx0bE9KNVFFVEdx?=
 =?utf-8?B?ZXh5RGd4eVo5b1oxK1dzS0F2MEtKUUlRdFJHaGpvUGxHeW1iYU40ZlpuTGZX?=
 =?utf-8?B?cDNTUERKVmhVb01Vd0hXN05pcE9pLzNUdlRYaFl1WG4yQVlxY3ZNbjl2bU5G?=
 =?utf-8?B?RXF4S2IyaDlqaTVTVG9KVHpuSFRXRExIS0U1VjRjQUdFelEvYmEzR3RHZDVE?=
 =?utf-8?B?cXNTYWVDT00zZ3BZcWx3L0djWmpnam5vd1ZXMzh4UTFkVk9WdlJOQmF5dE5v?=
 =?utf-8?B?dCs5Q2RtNWdXSlZxQjJXb0JpSm1ZL0RkMVJMSCtSUFpyKzgxTEEyUERPaHBB?=
 =?utf-8?B?ZDhBZG1GQ2VQcnN2ektkSVg1aU9SbktBMDM2dE1yKzVKZEtGZkM4b28vbmlS?=
 =?utf-8?B?bXM2OWZMamZZbjI4cHN6dDg3OXhrSlZkLzVFdjZxd0s1VGx4Um5IaEd2em5E?=
 =?utf-8?B?OVFFK1FBTXpiM3BBSElocTZsMlU0bkkyMVFMV2hqeS9VWkltLy95UkkrbzZO?=
 =?utf-8?B?TEJLWGRtZlNzRUdiaWpFMysyRW5PRmZoWUJMSGIrTkZJQkQ1bUZiL1NjeWcv?=
 =?utf-8?B?d3dRQmVnbkVnMUNBYk51U01iMHF3WU8xamEyVS9YY3F6Z1dpb1ZwdmlLUXpL?=
 =?utf-8?B?Z29GSVpCV0tXNVdSZHZkMTl6NkwvOGR5N1laeVVMR2RpRitCTng1UHhTSGZQ?=
 =?utf-8?B?RkpmN3B5N1pBUFFwL0U5MmVLV2IvYmJRYkV4cVdpVFhsNGRBQzJ4bVg5aWlC?=
 =?utf-8?B?K1FwQ1lrSFVCV0ZxeWZZU0Z2Snp4VzZkaUlrVkNPRmpKcTZFWDFid0R0V3ZY?=
 =?utf-8?Q?a+rp4V11smK1Hxpk3kCU0DExI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d687a1-b741-450f-b619-08db6e5ed465
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2023 11:42:57.9003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YoS8+l6r/fShQWrwOn+w3sUTLWOy1Mgx7uLmedzUsg1XkxV8YVVaWy4Cs5fzpVBZaOZljWTk76RjgoP9ldrvVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7550

On 16.06.2023 12:22, Olaf Hering wrote:
> Fri, 16 Jun 2023 12:07:20 +0200 Jan Beulich <jbeulich@suse.com>:
> 
>> ... you're removing the line that's actually verifying this is the case.
> 
> Yeah, because it disappeared. I think the other approach is to teach
> the python tool about __attribute__(()).
> 
> Let me know which way is preferred.

For the moment neither, I'm afraid. I don't know about other maintainers,
but I at least would first like to see the gain. And if there is agreement
that that's worth it, we could then try to determine what price we're
willing to pay.

Jan


