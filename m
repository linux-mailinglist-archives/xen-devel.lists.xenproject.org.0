Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7F4402062
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 21:23:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180223.326794 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNKDT-0002sa-63; Mon, 06 Sep 2021 19:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180223.326794; Mon, 06 Sep 2021 19:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNKDT-0002ql-2Q; Mon, 06 Sep 2021 19:23:39 +0000
Received: by outflank-mailman (input) for mailman id 180223;
 Mon, 06 Sep 2021 19:23:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4nFA=N4=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mNKDR-0002qf-M9
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 19:23:37 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eeafac2a-0f47-11ec-b0b7-12813bfff9fa;
 Mon, 06 Sep 2021 19:23:36 +0000 (UTC)
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
X-Inumbo-ID: eeafac2a-0f47-11ec-b0b7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630956216;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HhdcBXvKAHOjeRXnQDNqYRtYE6DpLidMQx5V6Wm9xSg=;
  b=K8R0nO0A054KveB+MX64tWirwlVFL9uYE7KdIxeU20BXDVk1r6DiAIYD
   UEl27BA8c49e3N4XxhVeNtN62uZC8aFSx9oHbvcxBIeUxbsbNcSXQ6sH0
   ol8n8vC6Yi3RIZTUCdTfFgpApEAW6saciFDpg5dZtrxT7OQbP2rdT08B+
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 0lMz85qtU7JE6sIzM2Gmge97+Vp5v8v4YaLVP0BLPbmi0Em5JRTSnCV9nd7wsyALhX3Z8hr5Wl
 DTtwt3x5lS6SLEbGmcPhHZ4i9xRgbt041D7gyd+i4cuj+sUOSlWxgaOYcaLbOV4mNAnMrOp2ko
 H1yE0pNlElOGBJIVhutncGeIOegC1JCatwM2LLPYW4P7wm3dpzSREwIKO9uk2C3ALhoFWUt5RN
 ERmcyUbPdx1aLuhHgVjHpPN8Z/D7J1bsrCfsQRkVMDSacfSS4qrPzNw2RZWi1zOUMI9DRxQoix
 iZymO7lNz4YoQZ1m7k/WMq5n
X-SBRS: 5.1
X-MesageID: 52508760
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:OyIpnqCr86S9l/PlHeg7sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LS90dq7MAzhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSuwEIdxeOkNK1kJ
 0QCZSWa+eAfWSS7/yKmTVQeuxIqLLskNHK9JTjJjVWPGZXgslbnnZE422gYy9LrWd9dP8E/d
 anl7F6T23KQwVoUi33PAhIY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX222oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iCnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDw4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWAoqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocXTbqjVQGdgoBT+q3pYpxqdS32BXTq+/blkgS+pUoJjXfxn6ck7zE9HJFUcegN2w
 2LCNUwqFniJvVmGp6VP91xNPdfPFa9CC4kAFjiU2gPK5t3T04li6SHqondt9vaNaDh8vMJ6e
 L8uRVjxDYPR34=
X-IronPort-AV: E=Sophos;i="5.85,273,1624334400"; 
   d="scan'208";a="52508760"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ag9pRZsMEtDDmFEPfgaiAV78PBfhrV7rpAweLAWjqWYfTBfhzv85CtRCSeE8m3ErB0YKQNja0izaZ55r0rM9R2S22LtR0HuaewiyUVpFCFXbMz+0pW4mYqzpZbqb2SmfN9fPnjf9KurkCGUaE1knUR8ITqq+2q7LY6EHf28iShh5VR4t5ZdqNy0jGTz9J9T71yNGmyqlt3jlL2w3E//Zwp3/2ps5sYTV6DrLhIl3FCXxFn6IkwitAcN8pRRroFEmJcpXtJQyyVCkZ/dMNceXS0PyVBgISu61vzwMLGV5hBdUuMd8JZm0ao/maG7NA4Ct3bDF1H+tPHUtIdfFPaqK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhdcBXvKAHOjeRXnQDNqYRtYE6DpLidMQx5V6Wm9xSg=;
 b=CJEx8dAL9Eqrb4KSQJKYTEy1zeBS6BzZ07/WtWERETKh7ATe8z2VbNxIa+Sr/we6cr6EISTqzsMTn5Xr5n6TDIQLkSnGqkcNeqpgvkQpFV1Stk7p7qVKNjsxKXmTiqpVFsFKFb0eknr4hrT+4iLQJ5deVC3z+CDDpeGXhTyHGyW+UcsQzhC2bWJc8ysYZnCPzmIxhtbAUzLmWGUg4hwcsWP7YPSYSoysU9vVlMncB+RNP9I890FmHCcJgWRTzVz48a4rbjXJCu1tIbn0vF/Rk6TS71JubZnbJU/LSpW83yVUcjgc0DaVzIVM7YPDt6O1MAhEWt6IwxrQ3aeufuYTXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhdcBXvKAHOjeRXnQDNqYRtYE6DpLidMQx5V6Wm9xSg=;
 b=B733muLDt5WehOn24iLdHi2mC+sVGziaf7tVrMqFHRMjpZo65dsSsKdwJpsKYsb4t6Sp10/Q9uvsVvSSo2eB30ecePVdcMFWRaOsbsn3lt04sQWBpKr6QHkG3UK4tybS70fnxBvwVeqOIEw4oOVetLi9+HyD+rc5OEbeh+yczUk=
Subject: Re: [PATCH v2 2/6] x86/P2M: relax permissions of PVH Dom0's MMIO
 entries
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <5972ce4c-bdb0-6d07-afad-cf4dd5615488@suse.com>
 <457637e2-d35c-18d0-ead8-0b513b257927@suse.com>
 <9b7936fc-f81a-d5e7-5ceb-6e10588503dc@citrix.com>
 <28646a17-420e-bfaf-8f7d-6d109818ffc3@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <80dc4625-a53e-1f18-2a77-a4e45c690cc2@citrix.com>
Date: Mon, 6 Sep 2021 20:23:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <28646a17-420e-bfaf-8f7d-6d109818ffc3@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0100.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 996d6716-c469-434c-54f8-08d9716bcfb5
X-MS-TrafficTypeDiagnostic: BYAPR03MB3735:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3735F7C8CCFD9EC29CE9AE77BAD29@BYAPR03MB3735.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zqpel8VDUBjZRih4xbXby2J2PELVLN9eAGPPtIiGdwhumNXnyxKKg3Os8LUeN5GQSNtRWZ/0WDOub2A+wZLROEB2cZKQkKIMzv4CqzK+BFJ12ztoNUuDi5iZxdABPKw0WUHK5w/xc1dso2yguat+4VO+d/dobcYIM+vp9WmIB6bfp12p7U5qvKATmLRWWsq9+Aadt63Uanb6p61Wk2AGz4ieYfnconzfYcGBA8lUCWBpH6C4/4K6A/1b5KrD6C/Nd6la3BE0rYTA+wZSQKjMVn/sbEwRqUvqY20U5hEDWVtwUaKK4w569MlTHlzUxZvMEl9FWPMRXBNq7267Sqhpdu57mxyzMvLnBMO1Mnxd07OTL8ZOJ+1Qh3FSoZw0I+4eb/ljQHsb6saghtCdSfH1/Qmb8cDwuI4+dNvKE36l3sXQER6o9QFelqRiR4RevJKcPCuyFXtU6Blpv4lUT1ev41PxkolYZQSuILyNOZBKYpBu5K+536NU2YPR/E/504Sfky2fV2GqiezFpghNfXAt8F2zFP88nl7nXxVFbQCOr5afKjewVOdodjNuH+KL5ZKbrwjOFVg2WJhhZwMiTEj+QYMX6GY5irZ0qKeoZOfMJKRrnUtexsUNg1mHY5CuloY38lTPepB5cXfkLwgZFTR9qDIYPvkng8WDvnKE5jT6TFfEQt6ytCdT9rOkk/nFwHhYK+4fkRa1bT3lSRj5F3/uo3p6h1tBcCub9Jdpdo1D7ScjWXXovK8I5HE+8BFRheeN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(186003)(53546011)(36756003)(956004)(31686004)(6666004)(38100700002)(66556008)(8936002)(26005)(6486002)(8676002)(54906003)(66476007)(86362001)(83380400001)(4744005)(316002)(2906002)(16576012)(4326008)(6916009)(2616005)(5660300002)(478600001)(55236004)(31696002)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEFyOTFsVFZjaTl6Q1JzcmhCbGFnZHpYNnFVbTNEWFBDU1NGeTIvM3NZTTFW?=
 =?utf-8?B?eUQraWVTQWxJWnlybGZVM0tSNTZaMGlWMWJoa1RYdW5weWxKbW9YallmU3Rq?=
 =?utf-8?B?TVR1WkRab0swYkQrVytPcnRNdnByNDZtNHU3WklMYmpFR096b3Q3aldzbVh0?=
 =?utf-8?B?Z2dGNnVFK0xSVWhGOUlKd3lINHBCMkhrYU40N2tzUUNPQTRtckhwblRCVE5Z?=
 =?utf-8?B?NEVrbytBZzZWcXdDUCtmTkd0M09MNlJZQ0xYcS9UN2NyUExuTjUyQmlXcVlX?=
 =?utf-8?B?dHdwVDllTkZpSnppa0xaN3FZUVk1THI2aHYwUEtqMDJYYkxvWnRkTURCZkFT?=
 =?utf-8?B?Zk1saVpVczh3cjJsUy9YdDZ5ekpwcUptc1BRUCsxWUQ0Q3NyKytCTEMyd2do?=
 =?utf-8?B?a0RCUE1NZjBDQ0pUeUxBWUVJQjB0WnRia1ByRUdxWkYzSjJVUm9WSnp6Rnhm?=
 =?utf-8?B?cHdOV2NWODVlT2tyOFpDZlRRZWtPZFdEZlA4UGVuVDhReGRtQTBXeDJsZDRV?=
 =?utf-8?B?TjhjYU1JVi9mUGRIdUdFNnhGbU5SVFQ0K2Y1dXRqRHFWaGE0NEh3bEUwVyt3?=
 =?utf-8?B?a2tFdFVCMGM3SEdtVlVmRnhZVlllNU1Da1NKMXVySWZiOGJiVDhhUUplRnBJ?=
 =?utf-8?B?a3AybHNiU051bEwwaVprMmQybkZsa2xVQ2hOZDdpZG9jeE0vSUlYZVNjclkz?=
 =?utf-8?B?SXZJdGNUYTdZOW40d3llYUpCdk45djZPdWYreHdoY0lGOWRtZW41QUpvTjZo?=
 =?utf-8?B?RGZ4a1NnOTNWNllzMFdKTGFKeEtZc2hLQVk1T0UxTFltQlVNRzdxbFJaR2tX?=
 =?utf-8?B?cXFlMThJNEFnajJBWEtKVmhWWFJnQ09DalRPN3J0NC9NMEF6aVlVc3MyaXRw?=
 =?utf-8?B?WFdKZ2N5RHdTWllSZHZHRmNjNCtsTFJ4YlUrSlU3YXVpSFRnd0JXZWV4dVcz?=
 =?utf-8?B?U3hOREFnQ2c1bVZ5eno2aWtqU2drSHZ4OEtjc2wxQjE1ZWk0K2VmVHVTejVh?=
 =?utf-8?B?Vkc3RjJGaDBnV05JOGhhaitDUVNETm94K1hnTEhad1l0NEJDSFVid21QTHNZ?=
 =?utf-8?B?RmZCZ09KQkROd2lPRkVjRnErcWVFZE9yQzRRSnlWUXMzRGxsdEZ2NFMyVmZT?=
 =?utf-8?B?WGZJUko5V1IxNU1ackVvY3pDZit0L0lSVjVnUmFFbmRYdHp4Rk9Pemk2SnVF?=
 =?utf-8?B?cll0elYydjRocHJpR1NNUjJ0dlMrcDlramxQRDdYUUNjWnh5TEkzNGpvZEwz?=
 =?utf-8?B?MmlGQ2UyZVNPMjZRSEVVR3g1VHFsclFUck91RUtvNU1Bc0x6b2ppaFpWVHRj?=
 =?utf-8?B?N09zK2JOTGN2ZVUyYXdUQmZyclZ5YXhPRXNUbnBZMWVRc21GUEtiUmlkSmFE?=
 =?utf-8?B?Rm0yTzZ0amMwWHpQbFpXNEZEd2lSZmxOM0NLVlRCekkrRm1pQ3ZjQThxSi84?=
 =?utf-8?B?ZVpaUWNKdUE1RUkzd0c5MFZRK1VVeXBzVitpMFhDRXhVTnJVN041Wis5VS9v?=
 =?utf-8?B?WFROYkpKUE9nV2xDdnNuRExaK2EyNHdKaUQ0YWJDWU9VTCsxMzJZQUZqdjNK?=
 =?utf-8?B?ZUZQMWNSVG9SMGpsdXR2bm1DU3BWU3doZ05Kdnljb0NRb09ZbTM2VVVHWlkr?=
 =?utf-8?B?bWlOSE16T2FNUm9LdXYzcktZYjN5MnE2c3dsSDVJNk84dGdMaVplNEhYelk1?=
 =?utf-8?B?eGlrd0wrdVV6R1dUY3B3U1JvZjBVWHl3ZHhSTDNWRjBEaG5yZGRVckx6YjQx?=
 =?utf-8?Q?pDvMxIA+3YtgogMEbqMCwGPqUVJrJb/ZXy+X+1U?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 996d6716-c469-434c-54f8-08d9716bcfb5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2021 19:23:31.1002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBGUND6Unvhm42Cnj2nBrod5BhUh8tP3ANN9mI3c9dal8+EoYITZzsqdA8Gn1WB1gXRnVw+IhyNRKXlocQbG/LPA5/T2VhtJhg+7n3F4GE4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3735
X-OriginatorOrg: citrix.com

On 06/09/2021 16:55, Jan Beulich wrote:
> On 06.09.2021 17:48, Andrew Cooper wrote:
>> On 02/09/2021 09:33, Jan Beulich wrote:
>>> To become independent of the sequence of mapping operations, permit
>>> "access" to accumulate for Dom0, noting that there's not going to be an
>>> introspection agent for it which this might interfere with. While e.g.
>>> ideally only ROM regions would get mapped with X set, getting there is
>>> quite a bit of work.
>> ?
>>
>> That's literally the opposite of what needs to happen to fix this bug. 
>> Introspection is the only interface which should be restricting X
>> permissions.
> What agent would be handling access violations in Dom0?

None.  dom0 really shouldn't have any NX mappings in the first place.

~Andrew

