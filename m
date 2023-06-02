Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC7371FC54
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 10:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543000.847525 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50OC-0005qG-3L; Fri, 02 Jun 2023 08:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543000.847525; Fri, 02 Jun 2023 08:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q50OC-0005oK-0I; Fri, 02 Jun 2023 08:44:04 +0000
Received: by outflank-mailman (input) for mailman id 543000;
 Fri, 02 Jun 2023 08:44:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NqWc=BW=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q50OA-0005nv-Vn
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 08:44:02 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20625.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9df64cf9-0121-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 10:43:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9202.eurprd04.prod.outlook.com (2603:10a6:102:221::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24; Fri, 2 Jun
 2023 08:43:56 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6433.024; Fri, 2 Jun 2023
 08:43:56 +0000
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
X-Inumbo-ID: 9df64cf9-0121-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n4TnGsABnIlGoy2FE8ghVTN0+UO1wg+cDvMbFLxSLGTWk3OehkU7k1/MnMCm9u1tb5P4lrNeDyWu/ds5JRTPfILFif1N9518jzZMjKEyaa1ng+nu9UDqYRMPxokjl9HPMJOjnsziek8F83hLDHLnisg/5tbocsmvwB0syF16CagZijbvcWNp6HZCO2Lh1kZJr+R+qlu6ArEE3KLPjHRiLt4AUKFT8Hv8zYeJ2HlJOmoHc7qh+OxmK9xgZ3612b5h6v4v2rkIm4ry9SAljxH7mnyJ6rpOWy1e4NPojYCduKxgileBI8UubcXnYatq14AcXLLAyfY5HaUnCwE8Q0WesA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OgykzNIkOKeBygkc0tNwHF1BSFTXhBw87Hi0S5ViX7k=;
 b=Y7EV+hc+fR4jMG3QSSIva4Fl3jZ92vRUep1fgZ68N2JPA711t6BOoRnxvgcpBUKHcYcjUhg7+wyFwJFCoQaUFT6GzhPf1We+UpwFDDdFgiQY1hxKOHasdULwYec+23P05PyDdQE039C4KZRd/9A6MWdagt86HGsr2jmalhAxrU3I8fopQDzDl+2cKU5Ty3f6bAAHJ64KhtJdaeWa1NlA1Q4rvFwddCX7CnYRGWr7fgUfbmXvYh5/Pyu2tFsNcEqK4rbcVSbu3wUC2tpN8kLMl5PVkNymSs+SJ/vcUJZKZXQRT6L1HOSO9lraeiSg4XR8aiL09CxlSzXuu7zYw/cCCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OgykzNIkOKeBygkc0tNwHF1BSFTXhBw87Hi0S5ViX7k=;
 b=ud0t7xH+oj4SR6uGRPAbWvTkwbL/sde3ImO3PAuM4c5hkVrNUl5PKmudAs+Tehw+6GfxYgGPBhqIAy4CZrZPucFbePW4D6MfmQ5ZIZav89vH60H1eZ7j4JdeaVB1I1CNAbS802yFhuWu3lnjKM07w0MVX4bQun4KxWdwgYCoRG/gaCZ8UxlXpqH8wgS4WIBM9PTYPwXPuVdttyGImbnM9g4jvnO4lf3WN8HKj4Ify8v38qC6i7X06qdNY6ikSYryjIovB+sBYAREC3g+qZ8841ONRazxEnTfC/yIFrf4AKs5OW4cgoncMidHVMiZWsc3AtAr5NfUwBXCEgJfWmvvPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <252ec541-bcc7-1b10-9831-520c959e06f9@suse.com>
Date: Fri, 2 Jun 2023 10:43:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [linux-linus test] 181082: regressions - FAIL
Content-Language: en-US
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-181082-mainreport@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <osstest-181082-mainreport@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0109.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9202:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d4ad4ad-4407-426f-65ea-08db63458059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VcaYGTBVnL0s0C7ygI7cQvSoVZQoYkjhmLb3v1Ab1jQKBni1znOIGTRWYXBpDjZVxioNbVVSJeNtncCzMkguFlST3gKT64PFNmpr0HCLErkyh38Aydj6Et+1HF1kgtHSS9a0rArtWRQWnJRvrzax6/DpJSdrfFa12hIXSo87jE3qPA4jjoNdGeN+NQLzHJiP3L+OYoL2v995wD08akcBhvlqk0KoqYBnlKZ/5O2hJ+gqJYzAmJ9/TVG9UqzzZrfkEn1xRHRIdt0luXz+nPZ3JBW9s8ePvB8E/9ET81qTyltx3IbpJ+YZeIImDzqN+dS5SrGqPOWQx+EVtwa3Ge3tSUkqQm4mNvLf5+9Sz8Rj7Yc+HlDHCcWKeAYyynV6wlRVS8JtBUS+NThUHcaR5vBoVjkLhW0WcEB3IZeea08veYFiDM2ydtgBHl5DxcM2fCq8qYM3QNELUX6sfhxqImzJMYNSvFw4IpT1x+LaZpGjukuRl09PtAjB4Jd1kX9voAdGOrrHoYTWWqhtJ/mVfHGWNrkJGuBWC37KsM4ULt+y3lLzM19T9MJuAvEb673C69+v8OQFtY+XgEHPZT5Z/qPEl2xNeL1VZF5U5v8gNnPrYmomCGFB0pq0+hj+D+62kpoAh9yBlUKhUVN5qFFGD7Rvcw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199021)(31686004)(83380400001)(36756003)(41300700001)(38100700002)(316002)(53546011)(26005)(6506007)(966005)(6486002)(66476007)(66946007)(66556008)(6512007)(478600001)(2906002)(8936002)(8676002)(31696002)(5660300002)(2616005)(86362001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUlmcG94TFBhTk1tZHlGbExvZ2ZZTG5JczRpV3FlVldwNVBCbFRxeG4xL25m?=
 =?utf-8?B?Sk8zM1dDOXNwMStrQmdnRnh3Zk9rL21STUF4ek84d25xU01JQ3d0OVE3eDJ0?=
 =?utf-8?B?cUpBWU9mSlpkSTNYN2lhMUFMbzlheHJpZ0JuQk8zYnBEYkpiOFBrZlFrY3cz?=
 =?utf-8?B?ek9CcGxVaFUvdENOWitJUjRLTXRGZzFIV0ZJVmpDYjFGZ0pER1NmU1RnWW9r?=
 =?utf-8?B?djNBbi9CRmRpeEVvbHd1U3VKZXZXZ2lqejczc0FGcWZTbmM5V3ZaU2hCTEE3?=
 =?utf-8?B?NkFSc3BzaWp1cWdzbEZQbitzQSt6d2JSMmtGWHpoNWdXNmpjdXVOR2hmWEM3?=
 =?utf-8?B?aUdpOWlJVXB6YWlxcnYzYnpPS2lYOU1pbTdkY2RFaGt0REpYaWtncXRySnNm?=
 =?utf-8?B?YzIwUUVIaHhibUExeWdsb3Uva05jc0RUL2xPRVhJWFpDc21Mcjh5dkZ6NVI0?=
 =?utf-8?B?SHFpSi9tK0NWVVc2bmdNR05FQWwvWUw1YnE2NmYzaHN2N0ZESDFjeWlVbFZY?=
 =?utf-8?B?SC9uQkFPVHBjYnV5MHozSmZlZTdDQjNwNWFnUTJUSElvclN0Z2x4RXE2NXRN?=
 =?utf-8?B?blZObVUyZzJiS3Jab3J5ZnpKeWtqeFNVSjlOT3FZa00xRU82SWlDTlhOWHRy?=
 =?utf-8?B?bElXeXd2WjU3NEFEQWxlOWlGTTE3U01xUjRLK2pMcklUcVdLQUJLMDVTVEQ2?=
 =?utf-8?B?T3BHWXFUZTJyZUVCWFl5K01LSHZBVUFEOG9sMng0SUpIVjJqS3lIOElWaEFL?=
 =?utf-8?B?S1lybUJjQWljU1FUN3lrdXlTQnE1dk1BVTlJNjZEUHg4WlpxRlFQQ1pGL1ht?=
 =?utf-8?B?UXRVcExISkVpZFJ0VE9DUmMvdW4yanFTMnJaV2x4emw2U042VFB2cXl5dk5s?=
 =?utf-8?B?L3VEQ0FRMU1ISTZnbVEzSEkvRmlJZDVRSEJ6RDFSdURKT1pPRUdKZ04yKyto?=
 =?utf-8?B?aERRd1h6Y3cvNTh4Wm5RamxVTXhXK0ZkZ0JnNGwzNERMUnV5OWx5c1ExSFJl?=
 =?utf-8?B?NitWNWcrRU5YTDNRNzlSUzJIb3dWVFBJUmpsQmZjZWoyTjZJSjM0MnBRUTNi?=
 =?utf-8?B?WldocEtuVktOZDc2bGhESDJmdzZGOG1JcXR6dkVKVWE4ZWpuampvY1Y0a2RS?=
 =?utf-8?B?Q2dXV01UZk91YUZkNmo0QnlPYWlUTnpwNzgwWHFReVFYWE5VYlcrdnJJK1l4?=
 =?utf-8?B?cUx3UFJ5RkpRaHhUa2tpclk4ZW11Y0YxMHpuTU8yV0FmOXh0TFFCb2lCc1hr?=
 =?utf-8?B?dHhxTy9NRWZyZU5nL2syeUw0L1NldjhKbmNjYzVkejZBUFlDekVlYldpRkIy?=
 =?utf-8?B?Y0FHcGdaL1Q3MGxKWVNteDExcm1KbFdDN3djUytKdCtMMUtuRFZHSktRRUFI?=
 =?utf-8?B?bjZRaG5tL0loQXM3NUhxeVBXTG4weW5IY1FSS1VkYzRXZStFYTJqRC9WMDRG?=
 =?utf-8?B?Z29LSFZVQUVadEpWMG1EcnRFZ3JyMXBRdTEzOFg4Q2N3a2lOV2NwQ0x2RU1j?=
 =?utf-8?B?YjNyV2NnS1hqSXJsMno0TU5sd0J0QUtwREpVdDNINFpTT3VLM0xhbk5iTGgy?=
 =?utf-8?B?ajBQVmtGRnpoTjRRWlVDZkNqZ0NrZ1NDWnpUQTFqYzNwL0w3M2ZsYk83WGpv?=
 =?utf-8?B?OFdIb3B4WkFzT2hpUmpMSDh2NmNyYmVTaER3N0VzazhkcDd1VlB6NFpFMTM0?=
 =?utf-8?B?MnlpZVBZemFUcklHWUtTTkc2VHVqVXUyeFBmdnc4SzdwTU9sR0k5ZktjaTEv?=
 =?utf-8?B?QUt4b2tlazhjeGJSdElaZ3VYUG1tSmNJdnF0OWtMeFE5alNoRTNoSFBsV3dk?=
 =?utf-8?B?S1E4ZXI1NHliSFppaUt0d0M1RkR5MUdxOUV1a3ZucGFkeW5GUmo5VEhQZE15?=
 =?utf-8?B?RjN5cDhSajloWFpNTFFMcUpubDRoYmYra2dlZ0F3K1EwRWxpUnJTZGQ4WXFR?=
 =?utf-8?B?YmNsSGd6K1NZdTZCL21jK1hVNncvVHlOQVhESVBqZmxkN1A3YmdtcnVXaHVI?=
 =?utf-8?B?Tm83UlZlZlhCZGpFMUN6c3hxUERURmM5MktraVpMZm5tMlRmY1RTUW9YajZv?=
 =?utf-8?B?eXVaK3VZNSsvVy85Uy9INUhleGRjYld2eHR5UTdteGthWks1WEZpYzZ3anB0?=
 =?utf-8?Q?bLED5beQX5Vhgwk5sdrscKDPr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d4ad4ad-4407-426f-65ea-08db63458059
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 08:43:56.1943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Eo3civKiKeW1XXZ/hU4kB7+jCWwBCwiOTGed+8hzbuCNXXrajDqeBi8FIW98KwiSuUaf25a/sH7jWaDGDp6l9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9202

On 02.06.2023 05:21, osstest service owner wrote:
> flight 181082 linux-linus real [real]
> flight 181098 linux-linus real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/181082/
> http://logs.test-lab.xenproject.org/osstest/logs/181098/
> 
> Regressions :-(
> 
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>  test-armhf-armhf-xl-credit1   8 xen-boot                 fail REGR. vs. 180278

Following up from yesterday's discussion, I've noticed only now that
we had an apparently random success once in mid April. Without that,
we'd see ... 

> Tests which did not succeed, but are not blocking:
>  test-armhf-armhf-examine      8 reboot                       fail  like 180278
>  test-armhf-armhf-xl-arndale   8 xen-boot                     fail  like 180278
>  test-amd64-amd64-xl-qemut-win7-amd64 19 guest-stop            fail like 180278
>  test-amd64-amd64-xl-qemuu-win7-amd64 19 guest-stop            fail like 180278
>  test-armhf-armhf-xl-credit2   8 xen-boot                     fail  like 180278
>  test-amd64-amd64-qemuu-nested-amd 20 debian-hvm-install/l1/l2 fail like 180278
>  test-amd64-amd64-xl-qemuu-ws16-amd64 19 guest-stop            fail like 180278
>  test-armhf-armhf-xl-multivcpu  8 xen-boot                     fail like 180278
>  test-armhf-armhf-libvirt-raw  8 xen-boot                     fail  like 180278
>  test-armhf-armhf-libvirt      8 xen-boot                     fail  like 180278
>  test-armhf-armhf-libvirt-qcow2  8 xen-boot                    fail like 180278
>  test-armhf-armhf-xl           8 xen-boot                     fail  like 180278
>  test-armhf-armhf-xl-vhd       8 xen-boot                     fail  like 180278
>  test-armhf-armhf-xl-rtds      8 xen-boot                     fail  like 180278

that singular test in the same group as all the other armhf ones. I
wonder whether we shouldn't try to get those in sync. Which direction
depends - aiui a force push would allow subsequent automatic pushes
if only the armhf tests fail. Whereas clearing the "fail like" state
for all of them would give a better picture of what's actually
broken right now.

Jan

