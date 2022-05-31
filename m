Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFEA53932D
	for <lists+xen-devel@lfdr.de>; Tue, 31 May 2022 16:29:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.339684.564568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw2ro-0002ql-Ls; Tue, 31 May 2022 14:29:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 339684.564568; Tue, 31 May 2022 14:29:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nw2ro-0002oA-IM; Tue, 31 May 2022 14:29:04 +0000
Received: by outflank-mailman (input) for mailman id 339684;
 Tue, 31 May 2022 14:29:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nw2rn-0002o4-8x
 for xen-devel@lists.xenproject.org; Tue, 31 May 2022 14:29:03 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04059e35-e0ee-11ec-837f-e5687231ffcc;
 Tue, 31 May 2022 16:29:01 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-45-jl5pgO8qPmGnuhzRAT8trw-2; Tue, 31 May 2022 16:28:59 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB6PR0402MB2933.eurprd04.prod.outlook.com (2603:10a6:4:9c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.19; Tue, 31 May
 2022 14:28:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5293.019; Tue, 31 May 2022
 14:28:57 +0000
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
X-Inumbo-ID: 04059e35-e0ee-11ec-837f-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1654007341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6j9mqNrhmK9XxBuGTNN7DA3oCNdIfkJ/LVoT20sdNOo=;
	b=W4SPIMxCL6EwoyBuEj0Ig7qx6w1g+n1IGV65Ix0Xi6dYTbN9QXdaL+XuQsRn2ZUM5ai7tf
	CXN7rdNuVkbfkY+oIxp89+K38l/+12j1j8/0qccDw0qNwY+ur5y1Qc0+3tG/BDRH6ZM0SE
	IiqrJX5YGnH0B7N5FH5R+uQQbEd8nP8=
X-MC-Unique: jl5pgO8qPmGnuhzRAT8trw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9YmhSOHLUYihU8vXm52nvilljZ8t4x0GV3aLiBNklW6L/ZaVPXgwBSwzgZl0sxMYyXH9/kJh79KqrP8+WiX9xVCJic9ViAfeIilxWN4qT9HS1PkGIc6alh6eZ1cTtS/ikuP++XA3jPxcPWEdZaJsiGzqrMNwSugrmmCHeFBkWAATurtEiMp79CGhcMN24//4bypFcjIN8Iges3K0udBPnQ4GdlzCi4tY9DXaapqOVCiAdrvqWfqr2v7zxFIuGlC/YOmH4LCT3oFQNhT039CMMu9zk7KAIAwhPXDrcap96h+DfXtSVN7QSrmyPaBLRLfTLBymiuHGjaqJi3A1tlltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6j9mqNrhmK9XxBuGTNN7DA3oCNdIfkJ/LVoT20sdNOo=;
 b=YFdjCzm+h+HS5XzkBvwmKfN6ImWGzX68YDYle3w0vL/D05LsA4OJMCPIYi7QwIhFsY+5ZCGWWDMjnOtWjkKuAtiEIdi3IpsBf+5Z4cfOm74hJXbw07pG5upsl2/8wQDKT1iXWLmXmXix1WMd3W8E7KDn8RhGKPU6XpigWk+m06Wbzfm3zqtVNn8rTteiJAf23omvZpQ6bpvTFRczqAvvAIBEhYszslBGsommpFUwQ9Hq99O7ikj+jdwYkTMJBNJ2TZ6uS61scqUlXpSuywpyyD+/fGdfFkdoJlhq3Cd1XoayULHqBsSWT3fTV3j4JX7OTeBkGi0JoMXLAWHVyt5WGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b84ed70c-dc34-6eb8-4b0d-a14b3fb91710@suse.com>
Date: Tue, 31 May 2022 16:28:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] xen: Add MISRA support to cppcheck make rule
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5467d017fa1c6721436e21f8cc10c5d74adeb5bf.1654002661.git.bertrand.marquis@arm.com>
 <a6e11bdb-976f-fdf4-6e07-a130980af90f@suse.com>
 <F7B128AC-3DB1-40E3-B3C0-D95CA367E766@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <F7B128AC-3DB1-40E3-B3C0-D95CA367E766@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P250CA0007.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:532::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6eed766f-d7b5-4ea5-9db1-08da4311e574
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2933:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0402MB29330F6D467350919EAB6545B3DC9@DB6PR0402MB2933.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	lac44j5MGKBaptk+ez07VigrUHza0rIU6nJhfOI+nB+BH+2SCNY5pOj9b+RC+P+stNuJrG6zW5P9AvMEwtLwIe6weFYAu2Ca85tqc5twUeAqrOd4idh4L/Mybzl4IRdYRuOkFbDOFU0H3v++aVb4zRAeUTWzCaVJHGesWxLKi3MLoaYYY10CaUktNhfaIvIrgO/jndHu/EBm/ItEeoWrDUpFvhmu6JunNC7BKG3w85ht0LDiZeV6g8mKPKoaxAIR1P4jeEUVd9aZeGYR/iAITNd+i836Rr2WA/ZEaIIGh4TFcEJvVBJuKX+E/BRzWaxhKbaKtyKs0SUYH176CC4ScC/p2yzA5pRTYb4FZL4K8ss0L+sKirn6IzbeLXfwEkuwIo0sGnHacxP/rHRiZ2UHIFt/VTvBM6KHxeyR0enlVKI/f5IcBkNDHp0QOVUV2A37hdSoAELYgW+u6Tunmbu9iCOX8upk+AtKyp5iXf7r88nkiFwzFNBvyavaYbYkIRUrSeocICEWKKm1T0kdrMms6RA0bOEjjQMEldhFVNr8ABf392K+aLj6qJF6EGSd/9wp3mWb3pBNRIOlQeEaQFDHInPAyOHN8WQ7NTAiqmorvhuQfXyw/zFoEKa3dbU12TPjvxRiDXN/r1tE02XjdzJyA+mTLroQfKyCDqtvrvRj9c3NnvSaSJtwzyZP1SKhSJLi6xhSdUzFdd/qPy/PBJL0+TC5xdT9JvA5T5b6+0Dftb4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(83380400001)(6916009)(54906003)(36756003)(31686004)(53546011)(186003)(6506007)(6512007)(26005)(2616005)(6666004)(8676002)(2906002)(4326008)(86362001)(508600001)(66476007)(66946007)(66556008)(38100700002)(6486002)(31696002)(5660300002)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UE1YRDhoQ0FTdGZnQ3dtWTBObWV3MlNwcXFOUHZYbGVaZmtVM0lFenp1RnVS?=
 =?utf-8?B?S3pkNGJ4S085TTEvVWtSdC94czJxQzlvcWEyYTdEYWR2MENJOExzVkhhVWw0?=
 =?utf-8?B?dy9BbXVFa2RMa1NoaGhxSVpldWdmWmU5RHN1bkJpK3ZCNytjUi9QdXZEc1Vr?=
 =?utf-8?B?a3R0Zjg0VDVBeTNHVzUyN2kycGhUdyt1bFdETWIwMllmNnZ4bTgrdmhLL2sy?=
 =?utf-8?B?WXJ5UWp2bjFtZHFGa3A1cWEzenJhRUU2TE1XcDV1RVJXdkFNenhLaEt3NFBR?=
 =?utf-8?B?T2VmUVE1N3lTbmRWZHVQR1RXNG9JV2hhcU1JSkJPTENTZ3lQZWtpWE1VTXBr?=
 =?utf-8?B?VGRSY21QSU5XekRIbGJkaVhMd3lxM2orb0Q5ZFV4RnhGQjFuZElJVjJ1SU82?=
 =?utf-8?B?aUg1dU40T2NLeGZIMEVrdThtby8vNVN3em5UQmFvd2R5U1BMUE5HRytuY20w?=
 =?utf-8?B?MHdLWDV1L1F2b0ZKamprZ3lObWkxSlk1ZFYwRkhlckpCM21SZm1IR2R0T1Iv?=
 =?utf-8?B?aU1XZnUxR1JMcXdBSm1idHh0bURHNjhlZTExYk5ycXFIYW1UUmRxWkNDd0NO?=
 =?utf-8?B?bW42cHpUMUovT3dwUHJjQWdkWHl0NVRabUxmbUdYdnhWRWplSnJBd0hXRFY1?=
 =?utf-8?B?TDZEa3RYQStNTkhUTWZrbEVJMk1kNzVNTk9rYjRsZEFHUTdIdlRiMHhndUx5?=
 =?utf-8?B?VSsvRWQwdFZUNnEramRLZEFIYkRidUZQU2d0TzdMN0pPSUppM2RQVVJub1Fn?=
 =?utf-8?B?SzBaRXlGK2RrdGNCcHZGQ3pkbmNLL1VEN0J4dU5hVldEV3BLYlVVY1dQVXIv?=
 =?utf-8?B?K2ZRYjlyS3NEUEd6UE9pazJKS25MVjZ3Z045RmQxV1VjblNKaVhPREdEdkt0?=
 =?utf-8?B?bmNTUmhTeitXYjBKMXRXSER2aU1GQ2VyRlAwaHc0M3JpZ3dTRTFYYTBubk13?=
 =?utf-8?B?WUV4c0RBRC9hejZxVWovZWY5ZWdTcEFUMXhsZ3haK0JlZXpqM2pxSkVibFBR?=
 =?utf-8?B?M2dFTFZLQUluUTJsRmF0bTVna0JRQW9teTQ0Zm1MeG1rUGdqcFFXK1dnOFhF?=
 =?utf-8?B?UDFxYWtaeVRpVGRacEZON3lVVVc5dWxnZTM5M0VrTlhpTkdhbjk2QmhoNTNj?=
 =?utf-8?B?cGtsV2pCRHNSYU9Va0N2dWpyU0F3Sk9pV2wwTkYxRUVtSTJNOTJBZlFuejlJ?=
 =?utf-8?B?NEJxOU0xNUNFZitrampCT2NQd3ljbXB1dWFUMG1qTTZ2S0R1VlozSE1KK0s3?=
 =?utf-8?B?cUFCdlN4UHFoZUVrSzZ4bUlsb1FMNlMzVUs2dnBFc2lLdnJDZFRSSVlhUmhW?=
 =?utf-8?B?RlEyekhhbXFqdjZ2WVk1cGhZRFROWWVuemJRTW1QcHlWOHZXS1M0V20rOTk0?=
 =?utf-8?B?clNJYkxkTDg0d3NHOGtQZTJKRDkrN3JrTUFLSXFLcWgrblpUV01mSnhJOFBt?=
 =?utf-8?B?bmJtRzhsY0tSWHBvVW0zcnFaOEpSaTNFZ1pkcGhsSWR4MlVQMW51b09CaWNU?=
 =?utf-8?B?VWJxanp6am0xdi9pN0MyRGdhR05Tc3RCQ29XQkJjQzBHNURtckNhc0puYUpQ?=
 =?utf-8?B?QXFjOGUzb3ZFZ2hVa2U5UFFtaEI0aUw3M2hFYzA5dnZMM054dGxyV2xNbnZM?=
 =?utf-8?B?ZUdVUytIU2hxZVJvK09mNzN4ZEt4ZHhVUEdnQ2R4b1hsNWY1K0ZPRlhHa2Ny?=
 =?utf-8?B?SVhSNEF4S1RlbHZaWWI1L1FTMENTRVp5N3NWeW4yUWdiQkR1RWlRMU5sUGhx?=
 =?utf-8?B?cFFCcmdVVlpxN2dzRFVGWi9uZ1cxbEtvZEtwNWNXcWtsUVNxcFlQSEFNWjdW?=
 =?utf-8?B?V0syUWYyWUNsaDIxdFhqRC9Dc0xNV3RlQ0NBYzM5dWJhaStpbGV1d3VQc3B3?=
 =?utf-8?B?dDF4WjN4dVVoL3hSMW9HZHZaVW5qcE9IYUcyOVI4emhhRjVabnhiOWd3TWN3?=
 =?utf-8?B?VllacmltUWcyNjBjU0l0SjZwazZPOEdCMkU2cUpGTWh4M0YzWjZOTUl6YWVE?=
 =?utf-8?B?aC9yK0hoWU9aUTU5VUE1cGdTSWhrVkdFZnR0eHZId05rU3R0cTBYTzA4a2xF?=
 =?utf-8?B?TVFDTXhCRlNDdXVQaG81UU9BNmsrN01pUzNYZmEzYUpNUE5VRW9sNFdrcEpv?=
 =?utf-8?B?YlJ1T1paa1pNQnEwUUh6UndrU2h1MjE2cjJGNG12aktPZzdHWWo3YWNTbk1o?=
 =?utf-8?B?SUV4TkJzaUNTM2puMVNKYnh2K3lLUW54aWtpSTBoZGtuSTJkWTdycVJhcVhC?=
 =?utf-8?B?M0FqWTFkZGxDN1R5aEhrZ1d6bzVxa0lUa2hMb0V6ZC9MbmpTMnk4Rk5XRUhS?=
 =?utf-8?B?VmdwUXpBYjZ0YWk1OXJ1V3lKb1ZuWW15QTNjOENRbXBwQ3hScjZrQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eed766f-d7b5-4ea5-9db1-08da4311e574
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2022 14:28:57.1351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhhKGvDZFa/sLwcTMQHt5nutsx4M0whWDmoHkwgcF5wMYLOwoR5FtIZPxRa/26enYrOg5aKBl+BVzutVpUegzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2933

On 31.05.2022 16:14, Bertrand Marquis wrote:
>> On 31 May 2022, at 14:50, Jan Beulich <jbeulich@suse.com> wrote:
>> On 31.05.2022 15:30, Bertrand Marquis wrote:
>>> +# Replace current by goal in the dependency to generate an analysis for all
>>> +# rules we would like to respect.
>>> +cppcheck-misra.json cppcheck-misra.txt: $(XEN_ROOT)/docs/misra/rules.rst
>>> +	$(Q)$(srctree)/tools/convert_misra_doc.py -i $< -o cppcheck-misra.txt \
>>> +		-j cppcheck-misra.json
>>> +
>>> +# Prevent parallel make issues as script is generating both files
>>> +cppcheck-misra.json: cppcheck-misra.txt
>>
>> With this dependency the earlier rule should not list multiple targets
>> (and it generally should not, for not being a pattern rule). If I'm not
>> mistaken the way you have it the Python script would be invoked twice,
>> and all you prevent is that it is invoked twice in parallel. And then
>> please use $@ inside the rule. Additionally, with the script being an
>> in-tree one, the rule should also have a dependency on that script
>> (such that the targets would be rebuilt if the script alone changes).
> 
> I am a bit lost on the $@, previous patch adding cppcheck was changed
> to use $(Q) instead. So can you justify this request ?

I'm talking of $@ (a macro expansion), not @ as a prefix to suppress
command echoing.

Jan


