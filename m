Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A84A03C6B65
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 09:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155057.286381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3D2R-0000Ya-Gx; Tue, 13 Jul 2021 07:41:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155057.286381; Tue, 13 Jul 2021 07:41:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3D2R-0000Vt-Dl; Tue, 13 Jul 2021 07:41:07 +0000
Received: by outflank-mailman (input) for mailman id 155057;
 Tue, 13 Jul 2021 07:41:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G3ja=MF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1m3D2P-0000Vl-Ry
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 07:41:05 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd4433e2-9d83-4822-b88a-5658fb06b6d7;
 Tue, 13 Jul 2021 07:41:05 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01lp2050.outbound.protection.outlook.com [104.47.0.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-21-6XPprlsLNPWeMx3RMa_hIA-1; Tue, 13 Jul 2021 09:41:02 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB7087.eurprd04.prod.outlook.com (2603:10a6:800:12a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 13 Jul
 2021 07:41:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4308.027; Tue, 13 Jul 2021
 07:41:00 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.21 via Frontend Transport; Tue, 13 Jul 2021 07:41:00 +0000
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
X-Inumbo-ID: dd4433e2-9d83-4822-b88a-5658fb06b6d7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1626162064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WeskLsgQzCKIXI6FsZlZmD2fkaezCdSKwu1Qyucblno=;
	b=CmTarmoIXlYmK09vbbyOs2bnw5gmdacCGS8bZc7HMLvL4NdI02jYK3BHL2PdrUYVRWEnQc
	6qZiAaCD6A87Ps1IeJRd3kDh3Oizx2Dv9tUR4Dza8otPcojx/OhTuvoNR1CqsQI4B0jCQ4
	V+3HLbSnpDcYcqKOfCo5iPimxWs5CcQ=
X-MC-Unique: 6XPprlsLNPWeMx3RMa_hIA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jy5trdU0jBdCZYpxk4B5MWN5yesOezR6A/K7D7AeJJQkdT1yfqWMjcFXAtXK3JOoHV4lZ4tYX/yrlTVQI3w9FBSjWywVspAAP0aIHSCcGOeNAVIK9JYYK7CVC4XGSXVwLdl83Y4vuW0nHbFLE60TxKg+4us7dPaAn20UJMcF38V3EjM4wC7s1691xJf8dzlYSAK8qCMpBHAGicvXvqzHdm2vZ3CTR/qIdLd5pNfecW00s2eyffRNMdzTSOgxJuH5btdx8o0+oHEvWAI42AphE262eOm71OFncke3qQrlH9IBXy8p+Hg2Hwe4tqJupH4vL/BVGt/SNrGIbVC4PbcR8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WeskLsgQzCKIXI6FsZlZmD2fkaezCdSKwu1Qyucblno=;
 b=STPWZJTNYWPzvnMc5oJUniTbzuLql3ai0qw4CQohIsAWzXSdhocT8VBRVn3L2poc7no0IW0pvbC1v7wwTEtL6oQqOSYYUc4IHJkwD5hqbd5sXbd1e6vdAOJAGPGi7siQYc0f1k19zNiXaZtWaaTnWffcTZKFI67GREJtyqyQXZs24p6yWxVeAiXtOvLAkBdpqVd5HDmYjl1nrAtw4LVLWprmLPteoM5RELTuCivnMFuenNJUlrCnQOSTM4hSl4/PzS1GgdaE3gErBquqlpdohu+WWYR/fjfNXKV8lvHt66Q7D83fJUsFVys/ayg13J+zEiwCyiVl0DtZDgJb80eqGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [XEN PATCH v6 12/31] build: use subdir-y in test/Makefile
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210701141011.785641-1-anthony.perard@citrix.com>
 <20210701141011.785641-13-anthony.perard@citrix.com>
 <b93fcbc5-8b4f-7d17-7d0a-cd2cbf6fd2fe@suse.com> <YOxeI1Bn1nxNMjb2@perard>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <65edfaec-4525-c3ff-3658-1088e4b65f9d@suse.com>
Date: Tue, 13 Jul 2021 09:41:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <YOxeI1Bn1nxNMjb2@perard>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR3P191CA0006.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8def2eaf-d0bd-4629-34d3-08d945d18f60
X-MS-TrafficTypeDiagnostic: VI1PR04MB7087:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB7087BC8170C8F38765340FCAB3149@VI1PR04MB7087.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d/PFAfAAnWs//d8w6nYoA6akOlps4zL9V/sp9Y09etrkbpRS9Klec2a7HtWfuVJJCGPT9JqMuJsX8A6iF9Y5OkX8iJ3PyHSMPtG+VXTdUtI7cv9E37FW3wxrmDWckPCARItkgyCNkJ5ZaicqIqJ3m2xomcRElxkIsPdmG567jLFBVF0xqf2rxZLeekbTYAXj1x2TjBSRfctQFSmrBFD36h2eHxvDMdHbf3kN24btuKNcXcR5vaKgrk0UD2VFtMiZ0bSuNe3BCUcn9SiQUbuWsz/zjfMLRmV32vMmMHeUTl2c/S/N8sCVtTE1vfR6kUENmzlmdLNtqhl5HtBKoMMFvouPnFoQjewIB7hMwI8ob0WX2IZHiZMCq2Te4UH/HDco8/D3vi6zAzAqzM5bQDEo3AsHMAXmR14n8hMSOrXEjH6JWc9RMD+Lh6bR3cgEh39EVMNXN81vJEom+IHUNYluD+w7hrywijT9FmGT2MAhGGuvjtXnWTnU58YUnhApheiAgeyj4OUEHaJDUXVwkgif5A/QCfVmmolAUywviv3Oqbuzs0z7Oz5uJq8maxkL7ryaX4MjXOnw4QFjSJ9UWP+EbNB24koxRXsW9ixIEPnWXfyxvRG30X+tmnXqNscbAhgLLOyEfEn6gKTSfllgIZJN9nDyicsEBb/YTT26hr06KROHLmF4twtAlNkjzjI1zbPIL94/15lzSWeFRYVVVft56G7qTSn7AxS7+kFyB2gWupw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(136003)(396003)(376002)(39850400004)(54906003)(83380400001)(5660300002)(6916009)(31686004)(186003)(53546011)(4326008)(478600001)(31696002)(2906002)(8676002)(36756003)(86362001)(956004)(26005)(66476007)(38100700002)(66946007)(2616005)(316002)(66556008)(8936002)(6486002)(16576012)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWxqaVVBN1B1VTNHNFA4dEVjRUd3Y0pyR0pnN2pNVWIzNC9LS1BMMDJZNE1H?=
 =?utf-8?B?MTFCNzkzZENZTXZDT2dEd3Bvak9Ua01PQmFZQm13b21DZ0RHWDFKc2hDd1Vy?=
 =?utf-8?B?aXhDQWNNY2pzbHgrNHZLR2g4azQzMkt4cjNzQTF5cFp3SGtka1IrT3R0d2ZW?=
 =?utf-8?B?WFk5WnFCNXZBcFRYbU52Y0ZpWWJIMVJZTStNZjRJUU5nbmhQS08zekdpZkRZ?=
 =?utf-8?B?dTNZNjN1ekpZOUU3ZVMvdWNzNk1pMW9uaHVEZ2pZTUpDNytmSEZFWGpla2NI?=
 =?utf-8?B?SC9EUHBXRmtFUXdxUmwwd0pPTElDVjV1Qk1vUnpoN3JJMFdHWThTSUdRT1lW?=
 =?utf-8?B?S3dObGFhd0E0TGFySVh5TFNBbHVLREF4VDlFRVJsU2JYdWdMYmJ5NTZ0bGR0?=
 =?utf-8?B?UDRwT3puYXhYSHVDN3NHOWh3K25CTUVJOTVucEtxVm1QT1dkNFhZTGM2cEVR?=
 =?utf-8?B?anNBNHozS2VDQjl4aXhOTG1QTXJ0bXRVSzJqQXhyb1JhR2t0Z2pYM05WM1E2?=
 =?utf-8?B?aDVuMDBWUzdra0NBUEhTQXJxVnY2UkJrNCthUFNGQk95MjdTczNna1I3UVpX?=
 =?utf-8?B?ajNyZStDRkJ2Zm9VNHYvWDNlWDRwSUw0N0diR3hQcVp0VGF2dkpmRHgybkd2?=
 =?utf-8?B?Wm42NHN1bkZVVTNPUDM3aGhKcitUT1dhM3A3endKWGw3WldxR1V5OTdPOXY2?=
 =?utf-8?B?ZCtpY05BM09hK2h5TkVPcTQ0cmRwamhjWXVrNXFvV2R5YnlLdHI1Z0FQTHpY?=
 =?utf-8?B?b0l3MTlncm9aYUJOTzEwcUs3RGhCdFprN2E5UlBsSHB5Z1dmTXh4bU1lRGIz?=
 =?utf-8?B?bEdnL2g4OXVHZFdncXRhTG5XQVpnZGdTcWtabXRwMm8zRHpxQmN1YWx1OTRK?=
 =?utf-8?B?WjhweHVuUmZNRC83eHZlMElyT0FGaW1YM3M3RlZMZTR5Z1JDYUV2aVJzOHA1?=
 =?utf-8?B?SDZTS0ZtdkRoQWFYNkRPNnQ1VFlxT0RNUGZjWkNxeU0reEJSVmZxOTBOSG01?=
 =?utf-8?B?RDRGUmQyWjFTRjFUazRxYURWRWNtd2k0QnY2RHpkeUo3cDErNW9sU3l0SmdZ?=
 =?utf-8?B?QUlOWDRzaUtCUnp0MGgybUZDT290NEpXTUREOWUwbXYwVzdxQzZGMXBnWkJP?=
 =?utf-8?B?bE5xMGdKRmVmaDR2eEw2Y1FSZExzb1NJdUFOaXVmLzhkbGs5Y0pCeDV5akZh?=
 =?utf-8?B?dGowRG1wYlFsOW5kNy9XZjJUSDEzQTYvZFkxQS8yR1BDZFd4QlhzcytWOFV1?=
 =?utf-8?B?cWsvSUlwVDdxYUlpWlp6S1RLbVMxS0hQbTZhTWlVdVhDalhLVlNlOXg1aERt?=
 =?utf-8?B?QlNJUWV6NEJwZ3hMVDNpTXdJeUZNWUJ2UDdld1BpeXRYUldzMXRkbGdwUVJi?=
 =?utf-8?B?S3NveGJibGI2bFlFQ2RvVWk0Qi9VNEwyMlkvbmdCaVVGQkZUTm4xcFZtWmJr?=
 =?utf-8?B?R3BkYXVJZjJuckJXTFFwYi9Ib0h0aFlnR0ZpRkZNMlJRWWdhYnBGeGg2U0VN?=
 =?utf-8?B?dWVsb3ZSeUY2aUwxUU9abTAvek1tNWtkdGJUcSs1akYwYzgzaTROYTVsRzdW?=
 =?utf-8?B?Sk9DY29JbU05QkJQbGV0bUlJM0htT25GeDhxcTd0WmZwMVZpbm00azlEMW5a?=
 =?utf-8?B?azRRZU1tRWVjcmcwemExS2VSUC9OcHdROFc3bnRCUDFoS2FhNG5DNU0ybUJH?=
 =?utf-8?B?QmcyQmk2azNIak56aWhBbU9sY2Z6cWtPV2VIdFpCaXg1V1pEU3d4SWcveW1q?=
 =?utf-8?Q?cDORxEk14G1H/chbIP9K8J6G/hDx8StOjsN69kj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8def2eaf-d0bd-4629-34d3-08d945d18f60
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2021 07:41:00.6363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: srFg4QtT3ha8tiE0/S7VA3vJtV7AKRCL83JFfePSoYZ1OR6KFsyCg/erHzki5J6K6+RCK63GPzpDBBfSWUlDPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7087

On 12.07.2021 17:22, Anthony PERARD wrote:
> On Wed, Jul 07, 2021 at 05:26:13PM +0200, Jan Beulich wrote:
>> On 01.07.2021 16:09, Anthony PERARD wrote:
>>> --- a/xen/test/Makefile
>>> +++ b/xen/test/Makefile
>>> @@ -4,15 +4,10 @@ tests all: build
>>>  
>>>  ifneq ($(XEN_TARGET_ARCH),x86_32)
>>>  # Xen 32-bit x86 hypervisor no longer supported, so has no test livepatches
>>> -SUBDIRS += livepatch
>>> +subdir-y += livepatch
>>>  endif
>>
>> As per xen/Rules.mk having
>>
>> subdir-y := $(subdir-y) $(filter %/, $(obj-y))
>> obj-y    := $(patsubst %/, %/built_in.o, $(obj-y))
>> ...
>> subdir-obj-y := $(filter %/built_in.o, $(obj-y))
>>
>> this will result in building of livepatch/built_in.o afaict. Is
>> this an intended but benign side effect?
> 
> Actually, nothing in Rules.mk is using $(subdir-y) other than updating
> it with possible subdir from $(obj-y).
> Recursion into a subdir only happen if it is listed in $(obj-y) and thus
> should be part of a built_in.o. Rules.mk doesn't have a mean to recurs
> otherwise.
> 
> So nothing is actually going to try to build livepatch/build_in.o due to
> $(subdir-y).

Question then is: Isn't this actually a bug?

>>>  install build subtree-force-update uninstall: %:
>>> -	set -e; for s in $(SUBDIRS); do \
>>> +	set -e; for s in $(subdir-y); do \
>>>  		$(MAKE) -f $(BASEDIR)/Rules.mk -C $$s $*; \
>>>  	done
>>> -
>>> -clean::
>>> -	set -e; for s in $(SUBDIRS); do \
>>> -		$(MAKE) -f $(BASEDIR)/Rules.mk -C $$s $@; \
>>> -	done
>>
>> And then why can't the generic recursion rule in xen/Rules.mk
>> not also be used for the "build" target? (I guess "install" and
>> "uninstall" need to remain separate, and don't think I know what
>> "subtree-force-update" is about.)
> 
> There's some more changed in a later patch[1] to Rules.mk which would
> make it possible to remove the need for a "build" target and I actually
> remove the "build" target as well as the "subtree-force-update" target.
> Some more changes in tests/livepatch/ are done in patch[2] which
> actually allow to remove the "build" target.
> 
>     [1] build: build everything from the root dir, use obj=$subdir
>     [2] build: rework test/livepatch/Makefile
> 
> I think the "subtree-force-update" target as to do with having the same
> logic to deal with $(SUBDIRS) as the logic in tools/ and the top
> makefile, but might not have been actually hooked up.

Okay, I guess I need to get further through the series to see the final
effects.

Jan


