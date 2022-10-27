Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5EB60FA6C
	for <lists+xen-devel@lfdr.de>; Thu, 27 Oct 2022 16:32:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.431080.683602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo3vA-00052V-EN; Thu, 27 Oct 2022 14:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 431080.683602; Thu, 27 Oct 2022 14:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oo3vA-0004zg-As; Thu, 27 Oct 2022 14:31:48 +0000
Received: by outflank-mailman (input) for mailman id 431080;
 Thu, 27 Oct 2022 14:31:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a7vm=24=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oo3v9-0004zY-HY
 for xen-devel@lists.xenproject.org; Thu, 27 Oct 2022 14:31:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15d35175-5604-11ed-91b5-6bf2151ebd3b;
 Thu, 27 Oct 2022 16:31:46 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8493.eurprd04.prod.outlook.com (2603:10a6:10:2c5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 14:31:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5746.021; Thu, 27 Oct 2022
 14:31:44 +0000
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
X-Inumbo-ID: 15d35175-5604-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgQUXbSfZMtffI3N6Y2NlJ2uZz43fSr9eohvv42Y4NJe4b2oR9C2iB3rKIcMBFLL3gcpzyRmPteWkY0/DCC1LSsiHJGpVGuw3yn/BIkYR46bUE4rFZbLfQXdfp4GsvvDpXF/LQBb9NgtCtvx8EJkjJ/LQkbGZFtrOHIa6uiKgcmw+EXP8F6SuMyZjrvA6f7ITvwopL66fZFbE61DXzL729COgluz7IkHcZCJWeAOwhkLwN487UGLjF/eXpvVG49CyOIb4DgUhoZ1zDYd/RucHjBXjJQZLqsn/zJsVbgVbIgrjT34bDD0YV7alYJaEP9C7r7bI9bN0GkVb9ZoeE36mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgEHVT/gYchzDXCf/78mHRzmvt3VdVeADW4P/SMvYxo=;
 b=gJ9FcTA13XFBM2xCqPfTUYeGTPrt4JGR/ejXwhhTt4h1vc376vzKd12zY6PX7QxusTNS02WWNXYscogBwM4v/pYlLC2jyq1C8yOpxvD6GkvwqTkGRPYoQofynJcGjrM8fu+6OsJWFCAAIakQkaQN2QjBGkMsTmoOvOpn8EbHXbaCH8OK5jOPokcN1zk87hnXRIOmCe7HUWoT+0onuFwwEDp95M40gt5bkDRz7W8Unu3mOU2zrptCjZQN3rbcYJaXFae5efYedf6inzBlbxsAE5bKbHg39UpcE5LJnjDd3Ryw2Remwv/f+Kb87YXuiVBvwGcfWwpSw8A8fZs5M/K4Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgEHVT/gYchzDXCf/78mHRzmvt3VdVeADW4P/SMvYxo=;
 b=LhWPhnR2w1or0W0M1jRlU5W2dQNOVeswiL7JIU/wCxEc6UieMb/G8POTVRDDV1fxHD7Vu+oI/6IwirN5C4MGjo79SRtpFccBZz/EC4kdQti81zPV1Y8PhiUfKhBjRpOf6O484OfJ4UDmLcM8FVXqoOlrgyI8qCdonu1xXAoCIvu2H1sJCldB7JESiFvDo6O7Jc2CMkUoieQCTf6zluUl10xgvg7UlVNDgDiqsORHWfEoRJ7Smu7DOhGOCC1Vvgylo7Wy6hCAirmds7WjIS6fYJwBU246PYSEV6hwHefG+8aqPsnijpf/gZtHon2eC0GAUx7cnijq9a5wbjeRNY7YVw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7d880aaf-bf23-92ec-c193-b1bc5b84baa6@suse.com>
Date: Thu, 27 Oct 2022 16:31:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH for-4.17 v3 2/2] vpci: refuse BAR writes only if the BAR
 is mapped
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Henry.Wang@arm.com, xen-devel@lists.xenproject.org
References: <20221027132315.80592-1-roger.pau@citrix.com>
 <20221027132315.80592-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221027132315.80592-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0099.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::16) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: 2326f240-fc30-44d8-fb2a-08dab827f8ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VVmqBxh/eT0ZYaJQjLngl+d3JoqZEuW+hvNQXuaqPjkFmdbVl2ZOY3ifc7zfv+EL8R5TSQcU988qMq+AXrL+rkmgrJ11e9syXJC6IN/TpHh3CHTCfD0xfg6GsPw2RXBFmJzpe0piOTmgM9aw2RAcBlf+I28LwfN4C6U5vRbjdJgOkRsgO38p5n0Hh8bTAflTdJxsIiu/iq7DeGW+WElOqxVgouFmoKASmU9i58DqQH+aCCAqdqsqqw0rBCfeXI+5j9552TMirjctONYczrvlNKvLKBFth+uHX8lMyPmQZrtURU6OuXLFPQxHrwvDiLC3RguOK18IPiRdpoL58g0fQ6TyJey/MS3a8oZd7ZOIlHh/ujXyB2aywnvXDshJeElHmO6CQCeudUCFeA8z3X92LvM4MBDVS6JzwWgZBbPO8xA64HyVhp3eG87NbXDw35usFoMxJg8ViW2+HcnrZN9eDxGG+Bgds+V7itORBSBVYwMjkPUpI8hOCCCUSOqnO1HGmUDawMplYIfyvk5HfPLGP1ttvHDCz8VLlsvJRuUDGH7MK5S7Ar+lhv7b6L8BOfW0qYHF3yLkmVevVZsm3cOGYcD0JwKoO9TWB/q/WhJXpL/wJvdMlolb5UniWRyHg/8IKmaBvH8Yka3nbrt8vhIRX+KXu1dQxJtySnhfaMTus9WicfWt9ioIkbEHj4gXwvqReOpuH45hpWmUJCn+cLwtFX78OTi3ntLG08VKcFRn0x/BdSLyTmIrXObpkWLS96ApqcvfsQuioBZiy3yTPdMS8IJv4HNMeKvAPt1rRgileXw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199015)(38100700002)(66556008)(66946007)(36756003)(41300700001)(66476007)(2906002)(478600001)(5660300002)(6486002)(8936002)(8676002)(31686004)(83380400001)(4326008)(26005)(186003)(53546011)(6506007)(31696002)(86362001)(6512007)(2616005)(316002)(6916009)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MjE4WnFUelloTkZSQzViS28yVVpjL2U4a01hcUh3Y2FPaWxYcXFXNUpKczVs?=
 =?utf-8?B?dDh6SFRkOFZ0cmk0OHdXSmRjTzUvOEpZOHYyRUc3eTd6bTEraWQvU0RDWXJI?=
 =?utf-8?B?ZytKOGlOQkdzNzIzUGFrYmt3eGcyM1h3ZWRYZThJbDNjTVdzQ0FjVldnTWR1?=
 =?utf-8?B?ZXhTWURXZEh1SFNJTjh2Z1MveWJFT3NibGdlUEYydkhod0NNTkRDa1lKMEJ4?=
 =?utf-8?B?UGt3eGcrU21HZWM2aW1TK1lQSVRiV3VsS2hubmttZnpKZ0Y4WUZwU2VRUzdF?=
 =?utf-8?B?OU5ySmh5OFloMFJ6ZTYrRm50SG5nYnluR0JDa3ZZQVc2VjgyTCt0dkY2WEtB?=
 =?utf-8?B?bHd5QmlqV1Eyb29QTm1BQVltZzZaTTQ4ZWdRdW82QlJWc2J0cDNKT0pFVkhy?=
 =?utf-8?B?R01tcDZWYmFTTzUvYTJUL000Y1IrWEZyNjZkdERUWjR0djJEVElBQ3ozbE8r?=
 =?utf-8?B?VkdML3l5TVRzNUhQejljWnZNUnhENGhaVmlaVmhqTkpxMnRCWVBaTHcrazI0?=
 =?utf-8?B?b3JFdi92KzEzZ2NaQlpuSnBiMUlyRjdmcVR5c25mbFMvTHlkcm1hUkFLYjI0?=
 =?utf-8?B?ZlBNbS95QWFYYlRIWU15bVVLajQwaGtpVmtuREdoZmU3VXdkekpyNVk0VllC?=
 =?utf-8?B?dlVvZzgwNUUxM3ZmbjVJZkljMjk0bzhRc1hKM0diMnYzQy9zSk1PWU4rOEcr?=
 =?utf-8?B?ejl1MldBa0Mra0VkTUd1aGJtUEVRYXNjRjArd3JWWmR2Zll1MVdoVGgzRmVr?=
 =?utf-8?B?VWh6RW5VYkdaUVBkY1RRUTliZnV0NXJpSU1VQzlVaTczR0UyOEZZbWFpT2x6?=
 =?utf-8?B?OER3QkdrRTJEZE1Dd0dnR0NRelQwOThwU3lrWlRFaDRmckpCRy8vSEVQTENn?=
 =?utf-8?B?b2NwVExOREFxMk5FajE4N09SRTdBdTlsNUN6L3BjbWM3amJQd3FxMXc4WlY4?=
 =?utf-8?B?U2Z4R1dNSVpyUjFtaktpaFE5b3VNbGJVbnVFby90Q0tPc2ZHaElBc204MGtu?=
 =?utf-8?B?Yklia3hFRWVoRTdwTUIzUGd1NGo3alA4dUZHT3lDQWpnUVlZNFM0TTV4T2ZO?=
 =?utf-8?B?OGdwVEJPSWV6SndPWlZ0VU1saCsyYmZjYzQwbFZrK05rc0xiRjd3NmcxOHBF?=
 =?utf-8?B?WWdlY0JrSGtxdStOYityYzgzU2gyNFQrekFUM1VIdG5Tem03cVJKNEtkY3pk?=
 =?utf-8?B?ZXk5dE5ZclRDeHNCYnNKcGNkVWNnNDJZempDOE1ENmRLWGVlM29UUS9LMXVn?=
 =?utf-8?B?Y05vb2VXc3dTOVkwTTB0SWdSSUpCVlJPOXViSTlZbkZoT3dyRG44UEtOR0lS?=
 =?utf-8?B?a2lyWGEzdk56eUJtVW5oUkc4QWJlYW5YSWhsUDFPdjhEOWFKd05PcnVVQmlL?=
 =?utf-8?B?VG5JNmswQWpxdlhmZmJsTUNFeFhjNkIyeXMwVDZlYWNUeWFtdWI4MmxCeFcz?=
 =?utf-8?B?K3RKaTQvTTU1L285Q3ozcEcwbkozcEdIVU9nV2tlTytlQ0svWTFkTGUxQmZZ?=
 =?utf-8?B?WlhUMHhFZEwxdU81T1JLcmVHdjFzazExMDRaVW5rc0R4UXlGcG9lTXFqK25t?=
 =?utf-8?B?UlZZdTF1UFBPTXpIM3ZjaHZSaXZiNk5WYlFxL1lZZWxxOXdoMnRTcG9UMjZQ?=
 =?utf-8?B?REFvZ3lBVG9sMGZpQnBQVmJDVzJNNzJBZi9oSFhKWVEybHRGdlBRdGhITURs?=
 =?utf-8?B?UVptMXlKd2czeU1udE44SWlWYktjSjl3YkVYUFVDZzdRM0EvOEN2VGZSb3Bw?=
 =?utf-8?B?U25CTDFkOXVjUXZOZG5jcUVWcmhGcThveGZCMFE5T2M0Sit0L2ZUc3d3UXpn?=
 =?utf-8?B?eTR3TzRQSVIxTG12UUhrVTdYNUp5dzFnY1hqWUx5dDJYalNYdFJySVdaSnRN?=
 =?utf-8?B?MFFJZjF1dWFxSjhFMWpVZWtUamhlU3AxWXMwVHN1cFVXOU5oNzI5cnhCd2hq?=
 =?utf-8?B?MEdORUZEMEVmS3AydmFUOTJURTZpejVEWGZZakt2SzJiU0ZuMFVYYys4cndQ?=
 =?utf-8?B?RzZFV1VFRmlxbDl2OG11eWtTZlZtNjJxUExUcm1lcjNJY2hGNXBYQTJ5dVFw?=
 =?utf-8?B?eE81bjB5OUUrV2F1eDNIVVFXeHNjTFdUdnZ5OU9HS0kxeFBCY0NhRHJmM2g1?=
 =?utf-8?Q?ZwUO4DAPqINZWur2yBnYct3vX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2326f240-fc30-44d8-fb2a-08dab827f8ce
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 14:31:44.4989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/zyix/kywJcYLvrroMs3odUp/8F9jLgATw31+KDwPV8Cuh8+HbofYUSeksTTsFPxqKhpGZBjB6KCQNJJPvJPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8493

On 27.10.2022 15:23, Roger Pau Monne wrote:
> Writes to the BARs are ignored if memory decoding is enabled for the
> device, and the same happen with ROM BARs if the write is an attempt
> to change the position of the BAR without disabling it first.
> 
> The reason of ignoring such writes is a limitation in Xen, as it would
> need to unmap the BAR, change the address, and remap the BAR at the
> new position, which the current logic doesn't support.
> 
> Some devices however seem to (wrongly) have the memory decoding bit
> hardcoded to enabled, and attempts to disable it don't get reflected
> on the command register.
> 
> This causes issues for well behaved domains that disable memory
> decoding and then try to size the BARs, as vPCI will think memory
> decoding is still enabled and ignore the write.
> 
> Since vPCI doesn't explicitly care about whether the memory decoding
> bit is disabled as long as the BAR is not mapped in the domain p2m use
> the information in the vpci_bar to check whether the BAR is mapped,
> and refuse writes only based on that information.  This workarounds
> the issue, and allows domains to size and reposition the BARs properly.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



