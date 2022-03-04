Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 924DB4CD56D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 14:47:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284297.483508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ8Gb-0004Ej-Kt; Fri, 04 Mar 2022 13:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284297.483508; Fri, 04 Mar 2022 13:46:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQ8Gb-0004Bk-Gv; Fri, 04 Mar 2022 13:46:45 +0000
Received: by outflank-mailman (input) for mailman id 284297;
 Fri, 04 Mar 2022 13:46:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mKET=TP=santannapisa.it=Andrea.Stevanato@srs-se1.protection.inumbo.net>)
 id 1nQ8GZ-0004Be-Dg
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 13:46:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20629.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8358337b-9bc1-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 14:46:38 +0100 (CET)
Received: from DB7PR03MB5002.eurprd03.prod.outlook.com (2603:10a6:10:74::22)
 by VI1PR0301MB2191.eurprd03.prod.outlook.com (2603:10a6:800:27::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Fri, 4 Mar
 2022 13:46:35 +0000
Received: from DB7PR03MB5002.eurprd03.prod.outlook.com
 ([fe80::746a:e27:47ff:3e90]) by DB7PR03MB5002.eurprd03.prod.outlook.com
 ([fe80::746a:e27:47ff:3e90%7]) with mapi id 15.20.5038.015; Fri, 4 Mar 2022
 13:46:34 +0000
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
X-Inumbo-ID: 8358337b-9bc1-11ec-8539-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U0tVR84QImKx/cLK+a0buBB5NagxASLvW/rP1u5u+T3xVLO+LUPUapuT6kZk/l7a8d6yiig6T96eqUeX1RB1ueaGpixFi886VldBpMepzTkNYMxiDqaB+ZE3B8tBWeeQGnzqOPH6V1O089gvESdHPaY0rhR/8E295hg+vRkQqXXF7oUo7SLLnyTBe1N8aLSPU+3m+ko0mhuUcHlpLodp+c8lMyv3sKconn7qHpVYuceL548Qp/tuqqPRnDr/qZ10e9FlzxdgcOhZNgrcQ3cStIllH80NDiInYxLva5CdtKqnDj5Nz/GpMm/pXTIHH9a8GGmE4UaI92Kj/8ne1BNr7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6eUl3G7/1+pk5GgG+vF6SKRGjenX5dou3XDLrKuLQh4=;
 b=lhocGC3zqX1DXV3blMdtP42EFeWs85FT3ck7PCo/AQWKrB3nz/0A2PRrSnwDXB5juFN06HwNlliMR+eKG6QgCFVpgHgu/W1MiSwoA6qFC5awAEMC9XcH5MI6/kUdT4RxSOiCHNLtQ3vOpt2Bq4XERwzjVhy2v+cQBaHf+lI9ze+iItTtPu+Nx1vYts/37tfyPH7gRUNKZs7zi6XtWkEnTx/7hjj8nVE03u+c++HVYrUxdsdJplXbo4jzuav+F250FmHgp7zb98FythEae0Bndg2h3hTy2DDZH2+vdDQ6AXlp/r3mGP+Fx8MZgPxH2VMmuPg/jbj6WXoZ6AD4xsyMSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=santannapisa.it; dmarc=pass action=none
 header.from=santannapisa.it; dkim=pass header.d=santannapisa.it; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=santannapisa.it;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6eUl3G7/1+pk5GgG+vF6SKRGjenX5dou3XDLrKuLQh4=;
 b=atcRuv094aJUVthQTcmgKHz2gpls4GnU9ICUdU2Evm04yZTOEuP/1+GgpIEaMvp8nD1AiIIL0UVnkDlrzv1igmZJAMsjTdP5OCaSTBhN9n/JzCGi5NxouLjOodtblM9Wm5TV/DKdJDrpNGmuGvOvvbKJpLIL/m+UBmLAgIwAS58=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=santannapisa.it;
Message-ID: <0ce52d38-f542-9336-a100-1cbfc559f218@santannapisa.it>
Date: Fri, 4 Mar 2022 14:46:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: Network driver domain broken
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <DB7PR03MB50027EE92E11BFFF71AADC4598049@DB7PR03MB5002.eurprd03.prod.outlook.com>
 <92827eec-b6e9-9c95-8f9e-fcf063d45090@santannapisa.it>
 <YiDt7fX92n6Luc2l@Air-de-Roger>
 <CAKf6xpsnmQG7-LXn5+Uz4mncWsN0EZ8wpagY8f8OydvZNb6g5A@mail.gmail.com>
 <YiH9cee6NIKA6MWg@Air-de-Roger>
 <53a4fe6b-efc8-bfa1-8475-0aa58774051a@santannapisa.it>
 <YiIFyRUNXpUfzwRB@Air-de-Roger>
From: Andrea Stevanato <andrea.stevanato@santannapisa.it>
In-Reply-To: <YiIFyRUNXpUfzwRB@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0061.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::25) To DB7PR03MB5002.eurprd03.prod.outlook.com
 (2603:10a6:10:74::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb279990-6592-4915-fd99-08d9fde565cf
X-MS-TrafficTypeDiagnostic: VI1PR0301MB2191:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0301MB2191F63D3C868868D0B9BAE798059@VI1PR0301MB2191.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	K4/Qh2Oa4QvtjeBFkk/3x4I3E7pQSFOZkB0L4TJMdDjZ9XYuKpHIQl2YjJSDHa5OzRsfVvIksnZO35qyuI85Dey5yPqtv4ssqgNcmi3iAozpcA7PCW9zqeHoRJIvpsgFfTxynAvY3gMm8/9hdKG0u8kIUdYk2CaSh4nR9xxtXKfnSZiZ5uzJ71lDEznIloQJR6l8GMiOZ13DpkQOPN7r9DR6fEwPgAIW8GCXE8Tm6Dvy8tOZRmaucFGzheeh/Eojj4IguI0EKwNrO+nrETOGzqA7rvesFQ7w+n1Yq4KYWXt9S3GEX6jVcVyeugjtmJDUMTR++ZrtzWllnCk9QCCOxu4bhBoMP+lL5+T+M3Emq+E1D/T89VpqN85U0nR+ytQj+paHs8Yvs6+h+Y3yNm2J+HKxUU8a4RjX5hvGRvi545RoL61MgblN9PkaGUeOlNvmi7dvgpPYkhj5D+qKJYJoCUrbHPGZwTTtedIEs++JSLxxqEiCP3Afj51Nyoqdl9CqsxouN/pBye6+TUGrYLo4Ksb0GJ+/6UdV/x/0fqLpOGGs7QCsO6JM7hMzXOirLNq+spreP4iYYk9CmzNiHDsp7FRCZgGgpxqBLI7tgsMh/0FvQcDHhfc0p9EC2nInNYhaHb3dveNiuBAtEfh0zw9aVJoRxSmF6KJN1umLCi/AYUzuzxq8m1ZaijP4We8Y4bArMTp3uej1moMjz9xxHdFQmS5C2udUHgdBodfkTndM/ao7jeP7Hspq8r4eaohKCW2V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB5002.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(786003)(53546011)(6916009)(316002)(66946007)(52116002)(86362001)(8936002)(54906003)(6506007)(4326008)(8676002)(66476007)(83380400001)(2906002)(66556008)(3480700007)(2616005)(6512007)(5660300002)(30864003)(38350700002)(38100700002)(44832011)(26005)(186003)(31686004)(36756003)(508600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Nm5DQ3lCbUIxSWgweGxsQXRwd3ZIZFVucjM2ODlJaHdPeE9jTEIzeERHVHJ3?=
 =?utf-8?B?WmphNGdRL05tWktJUE44RjA3aDZicVNSNXIyN1ppQTQrdXA4Ylp1WDBtWjZB?=
 =?utf-8?B?Q0JhbU5kRHR2MmRia2RmYzVDV0loMjhxaVpIdStPY21YSUl5TU9Kby9GYzVB?=
 =?utf-8?B?TW95bnNWRjhoakVPdC9vcTNBbXFEd2JsM2lKcll0N0xzVjdGZmN2dWhkd3pj?=
 =?utf-8?B?Z3lwYkZGdDFSaHB2c2M4OWFFTFlsZFBMMjBWVmliTFVFNDhjSUxPQXdKaUFl?=
 =?utf-8?B?NlNPSU5DcnJWcDZRcS9aQndLVGhqVkdGdDVmR1F6VjBrdTZaU09FWmhnZnlO?=
 =?utf-8?B?M3U2UDAxZzZhSExPZ0FHR2FvNmtBN0p4ZXBqYndWK1Q1aVZpelBNVktKVzl6?=
 =?utf-8?B?c0xmZmFEcmgvc3dEN00rNGhqUlE4Ni9BZlZXa0V1Tm12b1Zjc1dpOVl6OHlt?=
 =?utf-8?B?Z25nb0kyQ09LQWtBRDhDYjlGZmZCRHNuTEwzSUlkKzBFQXlNN1V3alVOVjNu?=
 =?utf-8?B?TWhSVVdId3k4MzVTMXZtc3RwZEV3VUZYMWQ2cEZGWkk1TnMrYmpFVElRbXZM?=
 =?utf-8?B?dW5JYUNOTEowNGhWUnlkTGN5c2ExUXIwRDFmcDk4UWhOL3pHb2lyWHdsV1Fz?=
 =?utf-8?B?VHQ2NTVHZzlpeVo5NFFxSHJ2ekxFL09JcTROSlppa2VoZm5SQll4dk9PMlI4?=
 =?utf-8?B?ZCtVMStsamt5RUk2KzF0bFR5aXJNSDJ0ckhJTzl2QkxjZlNiWGNiSVZRSlNJ?=
 =?utf-8?B?YTBRc1ZoQmhsVnZhaURwNmp4bVVzY0NRcHpxZ0VueG4rZm1mVUp2KzA3MFpM?=
 =?utf-8?B?b3RRc0RjSDFNNmFKY0pERGQyWFVYQTJSRHB0a1RCd3RRdERNMmh6WG1sYklQ?=
 =?utf-8?B?QzE5aW95ZVVRazByZmR4VjJ1YXlOdGVJU3Q0cDZPTWRGWVZaYzdkREtWTkZa?=
 =?utf-8?B?VEVxVDVJcXpkQXQ4SEt5aS8rYnR0MFhiMk5IdGhQemo0VjJaRTdHbmxtcUhV?=
 =?utf-8?B?d1hkV1Q4SWZIOGlYTFJpcTd1V3U4d1F6d2RTVVhzREFaTWJyS3RtVEVWRDli?=
 =?utf-8?B?a0x0Ni90WCtmR08wY1lEMGFvYXltZnJYMWRRWnM0ZEpzOHNhOXdTc0lHaHNY?=
 =?utf-8?B?WW1nQXhsaW1rdmx3YytnamptOTRwdi9iWGtTOEZqR3ZpZFlVSThESEMzTUJh?=
 =?utf-8?B?cUtIRFVWSDRNb1laVkIyOUxNUmt0UEQyMG5OWE94ZVB2TGZ2NWlMVEk4K0ZV?=
 =?utf-8?B?cEs0dXM3UUdJR255UEd0ajJJTHZqUzdRRGRwOFBMd2k3amZaVEhDbHZMNTQy?=
 =?utf-8?B?dytjWVhFTFhaU1grbVU3UFEvcGJ6S0dmRVpveFZtRFRRRmk3bTlnbUZ1NktK?=
 =?utf-8?B?MlBKWVRWaFRhanQza3RkQzBFanZOTWZSR3FYSWc4S1RDWDlzbThBQk56bjRq?=
 =?utf-8?B?TVM4d3RpQVJUcEplYTdOR2UrY2dCK0V3UUM3TFN5Z2xaVjN6VVhhSG9icUhO?=
 =?utf-8?B?M2ZrbWRmVXpSYUNjMlhVbHZtQUkzTml5SkJHWSt4eHJiQTJnUTFITUljclE0?=
 =?utf-8?B?WkI5akxzM096T0NsSTZZZ2VBeWJUdW5xeG5kWWJZTDdVZWVMTkVBSTFhcHpu?=
 =?utf-8?B?bGw2bGg3djhFcVIxWENjMzBSU0pObEFqQjlxUEpPM3lCMTU3YWE1ZlJ6UnZD?=
 =?utf-8?B?dE1ka3c1V25wb3JPVjRLOG5mMlNlcU1OdmJrUXhnR0hONHRhcDJSeW1qdnR3?=
 =?utf-8?B?TytCOGN3MlFndjlKZzdkbEkwc3MrOE1rT2NINDdibTZzRDBJRytxVythR1ZT?=
 =?utf-8?B?U2hsWE0wRXJyOTV6ZmUrY1VhSk5NQ0NScEJta0NRWitkbE03T2lBSVMrMDY4?=
 =?utf-8?B?eWpHNUhSQko1Z00wV0kycWtEdTM2OW5xYW9iZzhBMkhEdEp3ck56QURyRnVq?=
 =?utf-8?B?eDJ1bGZNK2pHb1E5aGVvUjBVbWxNNVFOaXVaVWtVaXRwcGl4dnhOMUl1WGZF?=
 =?utf-8?B?cThNeDYxenJuTDFicGVOSlkxVG01NytMNXIxbXBDdzl3a1gwbXkwV2VJemNY?=
 =?utf-8?B?S3lwNzRtaW1XbUphR2tMRzlCbFJNditFTWtTNnZhZGo3T1BiOFpVSGxTUlVU?=
 =?utf-8?B?d1UycTJsazYvZlhTSlBSN1NLUkdpanJ1TVVZaFlySk1WT0tQSXNGR0o0ci9o?=
 =?utf-8?B?TW9iZTlzNXRza005YUdQYkZON05PUGwzenIzdEo4MWROMVdtTDZsYUQzUnBj?=
 =?utf-8?B?VjN4TWI2bWQ3Y3dVQ3ZxUnJmRlArcE83QzNGTmlmK2lrVUx2bytwQXVYNUpo?=
 =?utf-8?B?MUllbjM1T21xbFBtTDlwNnRZU0NsMVNzSUlnYVZSQTdXK1gxNHMrQT09?=
X-OriginatorOrg: santannapisa.it
X-MS-Exchange-CrossTenant-Network-Message-Id: eb279990-6592-4915-fd99-08d9fde565cf
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB5002.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2022 13:46:34.8822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d97360e3-138d-4b5f-956f-a646c364a01e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ++0w85VJObNyDrtlqZMNbhClwi1rskdMo9d7Up1np0MpA54C8c02XemOWP/41ZGt4h2+6+en4/vBeRD4hCGCScvMnpy5gqP2wijOOdJCe9ChgYWpyG4ie2m0f/nkwiVA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0301MB2191

On 3/4/2022 1:27 PM, Roger Pau Monné wrote:
> On Fri, Mar 04, 2022 at 01:05:55PM +0100, Andrea Stevanato wrote:
>> On 3/4/2022 12:52 PM, Roger Pau Monné wrote:
>>> On Thu, Mar 03, 2022 at 01:08:31PM -0500, Jason Andryuk wrote:
>>>> On Thu, Mar 3, 2022 at 11:34 AM Roger Pau Monné <roger.pau@citrix.com> wrote:
>>>>>
>>>>> On Thu, Mar 03, 2022 at 05:01:23PM +0100, Andrea Stevanato wrote:
>>>>>> On 03/03/2022 15:54, Andrea Stevanato wrote:
>>>>>>> Hi all,
>>>>>>>
>>>>>>> according to the conversation that I had with royger, aa67b97ed34  broke the driver domain support.
>>>>>>>
>>>>>>> What I'm trying to do is to setup networking between guests using driver domain. Therefore, the guest (driver) has been started with the following cfg.
>>>>>>>
>>>>>>> name    = "guest0"
>>>>>>> kernel  = "/media/sd-mmcblk0p1/Image"
>>>>>>> ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
>>>>>>> extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
>>>>>>> memory  = 1024 vcpus   = 2
>>>>>>> driver_domain = 1
>>>>>>>
>>>>>>> On guest0 I created the bridge, assigned a static IP and started the udhcpd on xenbr0 interface.
>>>>>>> While the second guest has been started with the following cfg:
>>>>>>>
>>>>>>> name    = "guest1"
>>>>>>> kernel  = "/media/sd-mmcblk0p1/Image"
>>>>>>> ramdisk = "/media/sd-mmcblk0p1/rootfs.cpio.gz"
>>>>>>> extra   = "console=hvc0 rdinit=/sbin/init root=/dev/ram0"
>>>>>>> memory  = 1024 vcpus   = 2
>>>>>>> vcpus   = 2
>>>>>>> vif = [ 'bridge=xenbr0, backend=guest0' ]
>>>>>>>
>>>>>>> Follows the result of strace xl devd:
>>>>>>>
>>>>>>> # strace xl devd
>>>>>>> execve("/usr/sbin/xl", ["xl", "devd"], 0xffffdf0420c8 /* 13 vars */) = 0
>>>>
>>>>>>> ioctl(5, _IOC(_IOC_NONE, 0x50, 0, 0x30), 0xffffe6e41b40) = -1 EPERM (Operation not permitted)
>>>>>>> write(2, "libxl: ", 7libxl: )                  = 7
>>>>>>> write(2, "error: ", 7error: )                  = 7
>>>>>>> write(2, "libxl_utils.c:820:libxl_cpu_bitm"..., 87libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus) = 87
>>>>>>> write(2, "\n", 1
>>>>>>> )                       = 1
>>>>>>> clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0xffff9ee7a0e0) = 814
>>>>>>> wait4(814, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 814
>>>>>>> --- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=814, si_uid=0, si_status=0, si_utime=2, si_stime=2} ---
>>>>
>>>> xl devd is daemonizing, but strace is only following the first
>>>> process.  Use `strace xl devd -F` to prevent the daemonizing (or
>>>> `strace -f xl devd` to follow children).
>>>
>>> Or as a first step try to see what kind of messages you get from `xl
>>> devd -F` when trying to attach a device using the driver domain.
>>
>> Nothing has changed. On guest0 (the driver domain):
>>
>> # xl devd -F
>> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
>> the maximum number of cpus
>> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
>> the maximum number of cpus
>> libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to retrieve
>> the maximum number of cpus
>> [  696.805619] xenbr0: port 1(vif2.0) entered blocking state
>> [  696.810334] xenbr0: port 1(vif2.0) entered disabled state
>> [  696.824518] device vif2.0 entered promiscuous mode
> 
> Can you use `xl -vvv devd -F` here?

# xl -vvv devd -F
libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to 
retrieve the maximum number of cpus
libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to 
retrieve the maximum number of cpus
libxl: error: libxl_utils.c:820:libxl_cpu_bitmap_alloc: failed to 
retrieve the maximum number of cpus
libxl: debug: libxl_device.c:1749:libxl_device_events_handler: ao 
0xaaaaece52130: create: how=(nil) callback=(nil) poller=0xaaaaece52430
libxl: debug: libxl_event.c:813:libxl__ev_xswatch_register: watch 
w=0xffffe628caf8 wpath=/local/domain/1/backend token=3/0: register slotnum=3
libxl: debug: libxl_device.c:1806:libxl_device_events_handler: ao 
0xaaaaece52130: inprogress: poller=0xaaaaece52430, flags=i
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event epath=/local/domain/1/backend
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece51b90: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece51b90: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece4e7b0: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece4e7b0: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece4e990: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece4e990: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/frontend
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece4eaa0: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece4eaa0: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/frontend-id
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece4ebb0: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece4ebb0: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/online
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece52830: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_device.c:1714:backend_watch_callback: Domain 2:Added 
domain to the list of active guests
libxl: debug: libxl_device.c:1569:add_device: Domain 2:Added device 
/local/domain/1/backend/vif/2/0 to the list of active devices
libxl: debug: libxl_event.c:813:libxl__ev_xswatch_register: watch 
w=0xaaaaece52a10 wpath=/local/domain/1/backend/vif/2/0/state token=2/1: 
register slotnum=2
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/state
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece52d50: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/script
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece52f30: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece52f30: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/mac
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/bridge
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/handle
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/type
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-sg
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-gso-tcpv4
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-gso-tcpv6
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-ipv6-csum-offload
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-rx-copy
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-xdp-headroom
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-rx-flip
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-multicast-control
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-dynamic-multicast-control
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-split-event-channels
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/multi-queue-max-queues
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-ctrl-ring
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-sg
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-gso-tcpv4
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-gso-tcpv6
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-ipv6-csum-offload
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-rx-copy
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-xdp-headroom
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-rx-flip
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-multicast-control
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-dynamic-multicast-control
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-split-event-channels
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/multi-queue-max-queues
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/feature-ctrl-ring
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:2035:libxl__ao__destroy: ao 0xaaaaece53110: 
destroy
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/state
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53110: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xaaaaece52a10 
wpath=/local/domain/1/backend/vif/2/0/state token=2/1: event 
epath=/local/domain/1/backend/vif/2/0/state
libxl: debug: libxl_event.c:1055:devstate_callback: backend 
/local/domain/1/backend/vif/2/0/state wanted state 2 still waiting state 5
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/state
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece53fa0: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xaaaaece52a10 
wpath=/local/domain/1/backend/vif/2/0/state token=2/1: event 
epath=/local/domain/1/backend/vif/2/0/state
libxl: debug: libxl_event.c:1055:devstate_callback: backend 
/local/domain/1/backend/vif/2/0/state wanted state 2 still waiting state 5
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xffffe628caf8 
wpath=/local/domain/1/backend token=3/0: event 
epath=/local/domain/1/backend/vif/2/0/state
libxl: debug: libxl_event.c:2445:libxl__nested_ao_create: ao 
0xaaaaece54180: nested ao, parent 0xaaaaece52130
libxl: debug: libxl_event.c:750:watchfd_callback: watch w=0xaaaaece52a10 
wpath=/local/domain/1/backend/vif/2/0/state token=2/1: event 
epath=/local/domain/1/backend/vif/2/0/state
libxl: debug: libxl_event.c:1055:devstate_callback: backend 
/local/domain/1/backend/vif/2/0/state wanted state 2 still waiting state 6


> I assume the process doesn't die unexpectedly?

No, it does not.

> Thanks, Roger.

Regards,
Andrea

