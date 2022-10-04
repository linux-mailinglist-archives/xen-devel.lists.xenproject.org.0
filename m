Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 092465F3DA6
	for <lists+xen-devel@lfdr.de>; Tue,  4 Oct 2022 10:06:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.415199.659708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofcvA-0004Ag-Ub; Tue, 04 Oct 2022 08:04:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 415199.659708; Tue, 04 Oct 2022 08:04:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ofcvA-00048g-Ra; Tue, 04 Oct 2022 08:04:56 +0000
Received: by outflank-mailman (input) for mailman id 415199;
 Tue, 04 Oct 2022 08:04:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0IF=2F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ofcv8-00048a-QE
 for xen-devel@lists.xenproject.org; Tue, 04 Oct 2022 08:04:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3a364d80-43bb-11ed-964a-05401a9f4f97;
 Tue, 04 Oct 2022 10:04:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB9319.eurprd04.prod.outlook.com (2603:10a6:102:2a6::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Tue, 4 Oct
 2022 08:04:51 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2459:15ae:e6cb:218a%7]) with mapi id 15.20.5676.031; Tue, 4 Oct 2022
 08:04:50 +0000
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
X-Inumbo-ID: 3a364d80-43bb-11ed-964a-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oftjpAYp+Q9GuUVgn4tsj4293hGyomNfHKGiVgNxzZE/MO07T4ulEXqt3s+YlTYQ1aS/svRM/enPTSqhd40w0pWkin5tuAed3EbY4qNk4HULH52SXXnK5OzIOZhOOFSthbXhTUSilf4Nr0BlTGdQJOj4JKSkMYyktuhZmR4WMfFNVdz/amTOdAL7ijxVZGfnDx3f+jYRCrLDekxGXrLlyHHqL0OCgt3OS3SijsELn0jCCtqicyg+sCQoI2WfHrYu904FpIhhEoC5Scb00NpFY0YiPctmSVcJNZ080NjDQl7ak3i/ad2cvfe4cU27K1s8IAmua3ZQAeGGPw6C8O5k8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PJfDgo1stwc+B/8QrVp+aOsZxzWQCQsFoyG42hsukcs=;
 b=TYwEOAV77smVgQgkr4jVszNlcjvZ76KzQM5wmF0MhH8eV82ChsJ6p/9lI/xhrI/jRaTdABy5hkhmIy3Cs9pw5Qod0yqGlvRk8TcnACtzzYPmhwhdxENKijii5Co754uinKI34AHtdAjYLHK0P7GYG+++rZcqDQPRhZMDuDYhn0+sRROUH4AKtg8b16KL68Fkl2FJkWKcE3VHT+mRsa6LRMg0SwN4XpNYcUF3H9Ivtzv9EJug8BSi9+cIhpRFNwENA6na+veByyA/xPF6g/AM2Uf3MYvJGqqjot5vXVmiwqHQI7n26IhM5gEyrM8BjJ1sFLPjnJnSPcwx/KkwEFV+TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PJfDgo1stwc+B/8QrVp+aOsZxzWQCQsFoyG42hsukcs=;
 b=ZKAEmVksfq2HhrTRkgHzpyVfq67FhoEozPbILAGAXshLxCBwfD9THeSg5gRB2vgOz0Qixb7iowNgaQzudaLctiYLQMtIaydO9SJHKvEZcKwZ2Lt+rexCRK1bDtpFiI/dX4nMNRwzwmhyFp/1j/DQ9IRfARF0akow76GclcOqkW6Ut+fHjEAA8hTF6ymGT9vJiju+lKENqsSfVqwotB2VgQlQvFMXkZjbONlbJjPiZXLz0yRtofAiwbGsrfpsVnOKg8Ns7+TUhO8q1g74axbmF50TX30TAsocha1A4WXHevlHtfvRgrU0tnXfhmz2Zzfi72P102OroU63XWYkjfFAYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7752d091-bdcc-88a3-6bd8-5fb5d830e33a@suse.com>
Date: Tue, 4 Oct 2022 10:04:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: x86 NUMA error on OSSTest box
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Henry Wang <Henry.Wang@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <5dba58e7-491c-d396-ea1c-de03dc0053bd@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5dba58e7-491c-d396-ea1c-de03dc0053bd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB9319:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a40040a-b02e-47fd-61ba-08daa5df1cd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aaXdsK1aNq8En8N/THorALU6R4CRE29CmdvPbK8jiWi8Om4PJsxgepxHlgSke2mYeUJE6YrNa+1NdQit7cJJZtakKHtpmVeT1AThSpO8Dns1MmpbtnGJpeqfj1dMtvOFmNWVgdtKwuiLJxb7JvTqWjP6iMzG9cejXi5cGToryywjoz6qa0afErqFRf5+MqLJz+BzqY3l2sv2MkXOOCQPGu4NIaS4xURUi3lRoA5+WZ5x+p9bbcHYL7tWlIoIOEoxcq+hfaT/8SCYUG3FAw4LvO2V+nvA71gJso9We6SRipTSHNbEkXmw6awSb3U2+Ej4ZNoSmT195mz/5qZ7QKcgwRas+RKFBS9KcJ3pmZH9V6C0K8pcocNcMJmj5tCe3u1C3L0p44R1r6olBKCWbpYLgaObgDDVfjDL9/fN9JkE1y6sZ4DsG2pyIjsCXJ5pc78wv7WO3P0GLxOjuyOU6QdYR/uaz5eAB6C5mZzv1kwjLr/ZmhkXpybdXmpr5tfh6JKBRH2APqhy0sPXe1ny09HgInE4bynhuhHlknP3TOkdGKWCgf+WTrA4/0FRslSpE3djSopJIFf6gT7NWEgZgSgoY5eeAMmnlM+GA8OTj+p3MvVnICrrrjBCtwwQMGQoHw5JVnss/9mrc/bCT9ur4VdLeqAbX1So+G5rzeHYD/0Qfqbp/PUw0fCoHBrqR1ymItqP1XcgxUpR6BhAc3U/wEqYUoCaV81EnwzY956kWKhe2Bw3KAdBd+bp473ru0iHNxdvHCx/GH54PAdPKbQGBJ1lBwLFYwU6TR0fT2Jd9M5t2fs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199015)(66946007)(4326008)(6916009)(38100700002)(478600001)(316002)(2906002)(31696002)(8676002)(66476007)(6486002)(66556008)(54906003)(86362001)(83380400001)(41300700001)(53546011)(186003)(5660300002)(2616005)(8936002)(31686004)(6506007)(36756003)(6512007)(26005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bmlSNjU2MjB3WlBmek1hRFk2eUYxQmJuUzl5akkrdDFyczN5MldMZ1ZQWW05?=
 =?utf-8?B?QWRxMjNkVi9leE1LNlQwYVVMVWozaFVPbnMzeWMwL29ld0dsejFYQnROT2Er?=
 =?utf-8?B?VGMyMU5vbXhwQ2w2eWJCVDJxRWwydlhQZmtUc1ZyaW9JK0VWcnNxWGlBNmVm?=
 =?utf-8?B?ZU9TQmRJMGdEc0R0aHdQSFUvOHZLclpHc1NCdDkrdithZVhObUt5Y2p4OU9w?=
 =?utf-8?B?d0RNOU5EWmV6Zm52N2lSYnh3Vk5uZWpOMGd1NE1mMXNRQkdCRVY0Y3ZZNjdO?=
 =?utf-8?B?WThvY29iQU5FMW1rMFU2R2pxcGZkQTNDaThpTjZ6MVJRRmhzRGRyVzVwZklT?=
 =?utf-8?B?ZkVqT1hFMkZBdkhaaFhpTGhHQkdXVUR4RHBaU1Vib3doWXhZdWcwZ2FIVTdY?=
 =?utf-8?B?ZzlhdWs4NWJBdHkzNHBoeVpHTS90YU1MMGFXN3dvck9HeDVuMFpKb1E5b3Fu?=
 =?utf-8?B?ZUZVSUVXTGVjRVZOT3V3endFeFU5TlQ5T05LdGJJNUcrejE3c3UyWFFidU5k?=
 =?utf-8?B?MUVMR1h5cGhXV0ozZXg1S3BXZ2JGdE1DbFQ5TVd3RnJzaUFoaDZ5TEl3NWRO?=
 =?utf-8?B?Yjd6SkZucUF0ZXFyYVBtVXRsSlFoaURXUFNUdmVqVzdadUZyaUg3YUw5bnhW?=
 =?utf-8?B?TVhXUnZhRDl2akd2VlV2bVN6alFTeURGMTNOU1c3Vk41czJFK3FnL1l5dTVs?=
 =?utf-8?B?VUhzaitJWFRDUXpvNmdPNjN2aWVYWE5lZzhiNURMTlR3U1RwekU2eFY5SXBn?=
 =?utf-8?B?Zm8zRndKamNFQjI5Z0tVd3M3T3VXSDVSb0hCWk5EcEVvNndxU2NpK28rUVVG?=
 =?utf-8?B?Rnh5eTZrdkh3cGNZWU4zREtFRzg4dnZ1STJlREs1VngyS0VWdis1ZmF0cTl6?=
 =?utf-8?B?UmVYTU0wTHU2WVc4SWozZUdPQkNqdDMyYXMwWEYvTDMzQUsyUTJsWlNRQy9i?=
 =?utf-8?B?SjFLSStlcktpbFFWMHQydFZKYVpmU0xMZ1d6L0VRZHZKR2c3SEo1VDZtbGs1?=
 =?utf-8?B?dytxSlZQaTVmWlVMRXZmVHBhcTlqZnJGNGd4cWtXejNvWjZPL0dMNm5idVdr?=
 =?utf-8?B?V2Q0TDBrOUhoQ2xzSDFKQ0FWVmlGT3NBd04xYmpRVkovVVVKTlpPMjVmVTll?=
 =?utf-8?B?VVZGS1Z0SXRBbE1RQWNVMnRJdFJ0azBGTDVFWkpwQ0lSTmlmWnFsUXBSU1Zp?=
 =?utf-8?B?Z0hBdGNCdDN3ZVBrN0E2WEZhbnE2SElOZlI5a21ER3JUOHNMZzdiRy92QzFk?=
 =?utf-8?B?dXZJUFd5a2JiR0tkM2U0UUJPN2tNOU9aR3I3Y2VETHR5eXowT2V5RDMxUTU4?=
 =?utf-8?B?S3FGSk5rdWRmdWNha0NocENPZ09PVjZqU3F3a0FCZmdMa0pKS2phczhRWE1u?=
 =?utf-8?B?THpBWlFXSmZEb2VycTJxSzlMUjNqRXUwMjEzT2VUMnJ0NERGZWJPY29mU2dE?=
 =?utf-8?B?MzF3bFU2dGdJRmxoNDdyMXFKeGJSV09RUC9OeHloRmZzZWtVOExQMWZlL1JU?=
 =?utf-8?B?b0hGNlhSWDFLaU10MUgvVVBsMzZod3VTcW15eUNyazJOZUdTYllneHNxUVl5?=
 =?utf-8?B?YUM3SFZqaVBOemV3aFp5UHZSZkFZUEZaeXhqRG5kdzR0TnM0cXhNenlYSTg2?=
 =?utf-8?B?aDVqd0Zub2IrVmF1TXdmTTRPVU9tUS9McmRMSUJPV3pvbFZldEE2KzRzSDEx?=
 =?utf-8?B?NTBjYmt4ZDhpVTYrcnNTOWs1MHcxRzFOMkpUQzBYcWxZVUNEQ3pXS2V4akdn?=
 =?utf-8?B?aXNFY0hYNVpQMUtuUjVnR01FZ0doaGx0QWFRTTVhVWVFMStqRWJmRUtBaVNK?=
 =?utf-8?B?QlFzRlliT0llRUdSeHN0YktuSVFoUTdhT1VpSjJ4RVpzYncwUzRUNExRMm1p?=
 =?utf-8?B?RzJMelFFc0lMN29zc2pqSWQ2eElDS0I1WkJiRkRvSWlNaFlnWkkzTWhXYmw1?=
 =?utf-8?B?ODJIbHIxSGlRbGw4dG5icnZROHNETnpnaVA3OFJsZ0RvYWVGQmxYemQvelU2?=
 =?utf-8?B?MS9JS0FZL2Zwc0YxaStuTTZEWitQdFdFWmZ1ZHlLRUhSbS8xQlhGT0dmN01W?=
 =?utf-8?B?dXhtMVRtMWhMYkxjSFN5a01NK09jOGJyMExDa0l5SHMwS3FNWnpwVnZRSGZx?=
 =?utf-8?Q?PIguaHnfWfn6sbs354f2M6mF1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a40040a-b02e-47fd-61ba-08daa5df1cd1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 08:04:50.8308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nW6ZJ0HMZg6O9hdvD0AGZymamrMrwbe9P6/5Je/MtoSZljcDvoqRIpidwHn4hQwd7ftDE1vCGWFv8tfH6DtBVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9319

On 03.10.2022 23:21, Andrew Cooper wrote:
> While working on another issue, I spotted this:
> 
> (XEN) ACPI: EINJ 6CB9D638, 0150 (r1 ORACLE     X7-2 41060300 INTL        1)
> (XEN) System RAM: 32429MB (33208204kB)
> (XEN) SRAT: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
> (XEN) SRAT: Node 0 PXM 0 [0000000100000000, 000000047fffffff]
> (XEN) SRAT: Node 1 PXM 1 [0000000480000000, 000000087fffffff]
> (XEN) NUMA: Using 19 for the hash shift.
> (XEN) Your memory is not aligned you need to rebuild your hypervisor
> with a bigger NODEMAPSIZE shift=19
> (XEN) SRAT: No NUMA node hash function found. Contact maintainer
> (XEN) SRAT: SRAT not used.
> (XEN) No NUMA configuration found
> (XEN) Faking a node at 0000000000000000-0000000880000000
> (XEN) Domain heap initialised
> 
> on sabro0 in OSSTest on current staging.  I do not know if it's a recent
> regression or not.
> 
> The SRAT looks reasonable (in fact, far better than most I've seen). 
> Given no legitimate requirement for aligned memory that I'm aware of, I
> think Xen's behaviour here is buggy and wants resolving.

Judging from flight 173273's logs (on sabro1) this is a recent issue,
which then must result from one of my changes. There we simply have

Sep 22 01:54:39.843438 (XEN) SRAT: Node 0 PXM 0 [0000000000000000, 000000007fffffff]
Sep 22 01:54:39.915465 (XEN) SRAT: Node 0 PXM 0 [0000000100000000, 000000047fffffff]
Sep 22 01:54:39.927478 (XEN) SRAT: Node 1 PXM 1 [0000000480000000, 000000087fffffff]
Sep 22 01:54:39.927500 (XEN) NUMA: Using 19 for the hash shift.

For the moment I can't make the connection, as we still pick 19 for the
shift value. I'll take a closer look.

Jan

