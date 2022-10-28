Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EC1610CAE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 11:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431827.684428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooLHH-0003Hu-FB; Fri, 28 Oct 2022 09:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431827.684428; Fri, 28 Oct 2022 09:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooLHH-0003FL-C4; Fri, 28 Oct 2022 09:03:47 +0000
Received: by outflank-mailman (input) for mailman id 431827;
 Fri, 28 Oct 2022 09:03:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jtyv=25=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1ooLHG-0003FA-80
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 09:03:46 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20059.outbound.protection.outlook.com [40.107.2.59])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cd8b4ec-569f-11ed-91b5-6bf2151ebd3b;
 Fri, 28 Oct 2022 11:03:45 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9379.eurprd04.prod.outlook.com (2603:10a6:10:369::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 09:03:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Fri, 28 Oct 2022
 09:03:41 +0000
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
X-Inumbo-ID: 6cd8b4ec-569f-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Thj45cOvF6xhvnzrL0CKBx3efBZaHnagkuakZMzkqFFuHS6jWo4SFsiyH0kNnxT5AwO0bnV1Ro5dyXYto1Bgrw6eXffQEIdY/+30VYGrTawPazbVfvUCDPYV15pG77M3nvkapmBe72cJn3Ga9b0YBlV1J/V9L75c6KsCMtloA1Kc/BICX+A2lkiup98mPQaYRLltC8RhqHiZTyvhv9JXtATtddwt6cYf9do6RLm6EiS0gRAZlGEdD//dYMet1p0WHmAaIxG3md1SUPEnyOAk16BeAGJU/yedHNyXtvQHvIJ+SRqSzPxCBqD3X3JT4ulNSY6EZQiCHVqO21Vz5NSt+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38HujbxyAcKqIYPwr5Xd2OBOLvK5AmFEiA/xyjMJjK4=;
 b=SChBokodAWUxin8E8f11rRUJ3aXR1nn7EVZnP550miuj709uCnzGm89a/t4ELS+hSJrLDl4J/JZ88i96TFDQ9OLdlP5wBgj5DpwPysA95K3DrmPAu0IgKbKphp0lbYSjYXNTO1eGWrnk3wty2+8dhe6/bzivZuIz+h8kgAr93MEyam+5sQvkJDH+JtDc62RFnBVkYjwp5iNbWuIyBGWkhxTC17fktbQfM2Fy24WNh+uOo0LFTMgcS43scVgRY748Cyjpzcj8vOSMYhXPu1hMIUj6Ie4mGLMKXSPmlerW8E29JTzJ6tTtG/leLUlt67gFBqkErV3wViXlqyxDPgKiAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38HujbxyAcKqIYPwr5Xd2OBOLvK5AmFEiA/xyjMJjK4=;
 b=OozcEDx8WrCmaeBFkpgFOwLAwv3krELDacLcpMsIbIOMdzApNOZCyUg7hnnwO69hcS+6AsOsviy08I3mm6DWvc2Ey/iHUL2qbztK2SKU5djtZcdFA3Fsbb+4GUP2lU7hrgWvGiIpF9Gu5HgCdc8G5SpS+hPP2PlixSjrcwRDBdZtsZ2EhqGjonJX2ktrmbGuBACEAt7rS2N0AIo3oS6T56QPiVn4rGzX0b2s/dTkBhQUBFJgirQA/nCvFo8QT9gsejW4Vuj2loB0hkIdAQ5FHwvDBgwUEnTPIZ7Tsi3XbMOQy1e4jzJcQqhkxQHVlcVvK55NinfsbVwg+QdZMR8F2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b1312717-15c8-f90a-c84f-1bf8709007ee@suse.com>
Date: Fri, 28 Oct 2022 11:03:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: Feedback for postponing the 4.17 release to a week later
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Henry Wang <Henry.Wang@arm.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 George Dunlap <george.dunlap@citrix.com>,
 "christopher.w.clark@gmail.com" <christopher.w.clark@gmail.com>,
 "christopher.clark@starlab.io" <christopher.clark@starlab.io>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Julien Grall
 <jgrall@amazon.com>, Stefano Stabellini <stefano.stabellini@xilinx.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
 "Wei Liu (LSG)" <liuwe@microsoft.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AS8PR08MB79919CCB4F14F5FDE8929DF092329@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e7c17d83-d9f2-bb9e-24ae-8bc44005deeb@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e7c17d83-d9f2-bb9e-24ae-8bc44005deeb@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9379:EE_
X-MS-Office365-Filtering-Correlation-Id: c28abc89-944e-454f-fb8d-08dab8c34f23
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QlBfKQofXqQPyd5gU6gjW8t53QSa7ThVmjVo/Z0aqG7Y1Cp4n4tIVaR3I929KVK9j1J9oPZcqnyViw4FXGOB9x/XTXRI+VjUNTAexDZc8BVqSM43WW7zFcmrefAczEtf3jid5Oxzj6Mu3y46zvEsoxVvJjgxXgTeBSk/wQoDPyIOTeMKjSEwGxb5px2Jqh7cQYo58KTI8RAnkVVzUZkzlnWK7wKZ0+Y2vNd+8QjKq4mSzgPbipSXRLCdSKPsIDhC8HzI/KCGWG6eFgC7+9/EnPi8fGQUVqDRzy4yAlULX1KVJByQZfJN7jeo5bmiAfDKdLaZgTHXyi2LjtJ3CZUTwlsO5J6s5HFFGZfITji39ivqOcE6Xnj5OZ3e0iPbAzDU+TMpzrIBi4c4dFO/j+jq33ReL7ggso823toL8rSeFSHb6/PMV72IkyW4uLBLqSAyynd1KJKyddcF1gQR2k463HXpnwx0D7pSoi8ItQmTFuq+95LZbUHiu8dM1zDqmm+3APU4ETiOYFEn8t+EvjnxZp+oaBh6P03PsUuTbGFV7v8m94JcQ5CAWSca3NQTlVNxF8yQyAnXhV0Q8AzpAt6uEkjNDKakMvThNvvie5P6aGCGuGvYnKQ1xkYnq+4WK8tuCNQxcB0P48F6XEayNQYZubki7avD7XVnx5BRe88CDrnRxA1GVyISKMxkjxzdeVfGTrp7F8njQ9Asq0WScOGFa08qNx8HG7W17vG1agdnXcDK8OGP6VObkmAid3Ow2E7fy1fzhznxw3F5jKnrReM+sJemBkjTV1SNCnNl2oPPkvs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(136003)(346002)(396003)(366004)(451199015)(86362001)(41300700001)(31696002)(8676002)(66556008)(110136005)(66476007)(66946007)(316002)(4326008)(8936002)(6486002)(478600001)(54906003)(66899015)(6512007)(38100700002)(26005)(2616005)(6506007)(53546011)(186003)(83380400001)(31686004)(2906002)(36756003)(5660300002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmtoRlpxNjU3Nk1Kd0ZQeVVCTlBGQWpKcWgwYXdtdnE1ajV0b0xsYnR0d0Vu?=
 =?utf-8?B?Y3d4Si8vMGd5cC9sUHhSVmhxckhLMUt5UlFTeW1PVUdJNEtIYWNBUFdjeUJK?=
 =?utf-8?B?ZFlCUWFURTJlMTJDcVFYeGZHL2d3QlVldHNWVC9sUVdJMW44SHZSNllFRUNp?=
 =?utf-8?B?YjhBVEN4ejJhR1Q3TkZpU0l3NjdoWi91MXBOR2tNSm8xUCt4aklPVS9RMEto?=
 =?utf-8?B?V0xNaHEvQWRNWHU5MWUwR2M4K21wZVoxd2N0Sy9pUnNDQkJiYjQzOXpMbE1v?=
 =?utf-8?B?NnFyeGNIUnQxdEVHRDlJTGozWkJEZkt1QThIT0Rrd1psRnRWeVF5YzJUdnJi?=
 =?utf-8?B?STRSVG5NN3BrekVwL3lOempQeXRSU0Y2ZVNFdEFzM1JOeWhxdGNIbFBHcjha?=
 =?utf-8?B?SjRtVnZob011WW4wdVlWR2RMZVBlb3RjUnl0Y2FDdVR3bXRRdUpMTTRPUVRh?=
 =?utf-8?B?MHNCejBCaDhBaUErVTRlY1A5QW1PQ0hmN2ZXa0NtWkhMVEFRR2tRbXVkbWla?=
 =?utf-8?B?LzhsNlJxY0tsY25nalZxY0t6MWlvUTI0U21RbHg0ZnJSbnQrdFdZZkpuZUlm?=
 =?utf-8?B?UXdWSEZweXJqemdQVTZPUm9abnp6bXIwSHI4WmovSlQ1Skg0MDNEVEhUTUlv?=
 =?utf-8?B?ZVF4QW1wb0tBUm5HM2RyMGVJU3krYW9FN1Z6NkttWitzNXh1dU1hYUdxY3Ay?=
 =?utf-8?B?MWUxNjhxSlRBMVBWd2RQR3ZEbmprRjBmdk96S20xRHUzMWMybmUzWksyN0Fa?=
 =?utf-8?B?d0FZY2RLV1dKd0ZQanhWVDRneGVZQjNNU1REVzQ5NEk3SkEyL0hBY1BDcVlR?=
 =?utf-8?B?RXgvSHEzR3BZK2hzZjNVOUswd2RwVVRHTXNHOWlpek50WDFqcFBhNzEvK25X?=
 =?utf-8?B?OHdmRGJrL01OVmg4N0QzQXFJRXcwcTZ6Q1RHQ0tya01ZYTNlZ096NGVtcU5Y?=
 =?utf-8?B?eDI2NkFmdzk2dnFnWmlGdlI2WTdIeU1Cb3hQTjdqYitmUXp0L3c1REswcmx6?=
 =?utf-8?B?c1JJaFI1U20yWjlWVmFycWp5MjAvbkdFRzg3SE5OcUhpV0VxY3BLR29RR1dX?=
 =?utf-8?B?Snh5cXFONDBtRUVud0RaZlJKcEc4Nk5QLzlzYlBxVFdBZFd2SERJb2RqQjNY?=
 =?utf-8?B?b29KZG5EN28wazlJT2xOQXZSWkxRZE5meE1MQmpyUEkraC9pVmZEbVd4SjVy?=
 =?utf-8?B?ZUZYM09LM0VsWWdpZkJFV0RzL3ltY25HaHQ0Z2dsT0NLVzd1M3QwSEliTmhs?=
 =?utf-8?B?bXk4OEtJbHl2bERuRlBoU1d0d3U3Lzc5VGpzUlJodUhUUElWcjFzQ0pVQ3BP?=
 =?utf-8?B?c2h6QTdienB5aE1jSTJoRG5CRlA3RFl6WFNSOHp4ZUIwNUJsS3k1MkFOYm1V?=
 =?utf-8?B?VTJNY1pDWVpoaDFKWEgrbG8wSmQzVnBsZ0tQZDYyN0R4VjFDZGtlOGpZVXA4?=
 =?utf-8?B?eFUzUHBsa2FEMEtoM3FaSHJOOG12cHVUL2hUVGYrUGVsYW5NZE1EY2dSMFdJ?=
 =?utf-8?B?MTVXMnBjREZ1OU52WHFVbVFWWU8vU1VheWhMVGxLODhYNm4xS2l5RWMrT2Ur?=
 =?utf-8?B?M1AxMnFJQzV6UUU1N3hiZENoSk90MXlaVWZNelJZSjkxWDFUajFkTC9qbE9Q?=
 =?utf-8?B?d1FBbEpGUzJ1OVhOKzMwdjhBREhwQmxDQW56SUZGemFOK2xRNGRPSU1teUV5?=
 =?utf-8?B?QUJ5d2dwblFOa2JWclNWOUxqb2pVK3pVMGxHRVNTR3ZVL2xoaUQ5cXlYOTVQ?=
 =?utf-8?B?cU1adTcyc01NY1d1Y044dnYzb0ZQajJKS0MybkNNUW1RV3dVd2N0Q0hreGRJ?=
 =?utf-8?B?ZXVrbEFYSW4wU1R5WWFVYjkrT213MjdHQ0xuQUQ4Z204d245cEZvdzB4RVNQ?=
 =?utf-8?B?d2xKaS8xaWNDTmFCMUdldXh5UkdCOE1xOU54bHQ3dHR4UE9XMERHamZrM3Jo?=
 =?utf-8?B?ZkVrK3NPWWdyVDdoQ0RQMG1qVXI4NGhPMGs0T1NZMTRsWDQ3RkhTL1R5VUZE?=
 =?utf-8?B?WDJLdURoQ3k3STdpd0hpMXVaa1pzd2h0RkhxcE83OGtQYTNkT1d6dFhjZFJr?=
 =?utf-8?B?bjlneUl5eU9XYVRza21tMHRjS3MyMldCVnhWWFlGT0FoOFZzZTQ3ZHRqdVBM?=
 =?utf-8?Q?qElIfyE0y4l0n/GSWI9gka6tn?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28abc89-944e-454f-fb8d-08dab8c34f23
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 09:03:41.3175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IBh2SjM/UG8b8Oj3/phaIjNGAbm2TvqsmmE9nG9NU3HE5ybnxjAzCQU/lVplpr9P25SM9v+E/tLTzzmcwYj6Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9379

On 28.10.2022 10:57, Julien Grall wrote:
> On 28/10/2022 05:43, Henry Wang wrote:
>> Since there will be a batch of XSAs released on Nov. 1 [1] and the original date for
>> the 4.17 release was supposed to be Nov. 2, I am thinking to postpone the 4.17
>> release to a week later (Nov. 11) to give a little bit longer time so that:
>>
>> - The security team won't do anything in rush.
>> - We can have more feedback after merging these XSAs.
>> - Include more release-relevant bugfixes.
>>
>> May I please have some feedback on this proposal? Thanks very much!
> 
> Somewhat related. When should we branch for the release and set 
> CONFIG_DEBUG=n?
> 
> I think we would at least need a RC with CONFIG_DEBUG=n but IIUC we 
> usually do it at a point where the tree is nearly frozen.
> 
> 
> AFAICT, there are still a few things in flight (including fix for 
> XSA-409). So I am not sure we are in position yet to branch. Any opinions?

+1 to it being too early to branch. I would suggest that the XSA batch
should have gone in first and release blockers should have been dealt
with (unless for some it is clear that they're going to be unintrusive),
to limit what needs applying to staging and the new branch.

Jan

