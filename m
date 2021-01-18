Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7531E2FA928
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 19:46:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69983.125519 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ZXI-0000o6-Gs; Mon, 18 Jan 2021 18:45:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69983.125519; Mon, 18 Jan 2021 18:45:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1ZXI-0000nh-Dc; Mon, 18 Jan 2021 18:45:56 +0000
Received: by outflank-mailman (input) for mailman id 69983;
 Mon, 18 Jan 2021 18:45:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RMBa=GV=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1ZXH-0000na-4z
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 18:45:55 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3dd1c9d8-278b-42d8-952e-fc1bac828561;
 Mon, 18 Jan 2021 18:45:54 +0000 (UTC)
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
X-Inumbo-ID: 3dd1c9d8-278b-42d8-952e-fc1bac828561
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610995553;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hErWpb06kcRRkxMY0vx6xcnqT4jbZd7yVW+c+MPpjNQ=;
  b=al0fOVvAbZBqdNfxPFDIW2gr7x5xXQC4wvX/C5hYUcko1DC1YdSYfe0z
   Uv8zhGeY04+lv95MMntc750bj1KzmkUjjZUr28PaNcID2cyjGFclrNf9h
   bevIxCQUFAwTCdc20QiL2bfW7CIfuCR6KVk6VqctiBfYVvs77Qs3S8D41
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pvvHy5domP2czZ5Ls1ndCeC/S+ASiZFGRiC/x0OqQOBj56z/JzL0jb4LPFJuUs4qJrG6IUdnil
 1AunZyUiAtalaub7querI6hZc8onXD8LEn1wi0yTozwNRmG38s5D1amFct7/pW89RROSxSqgMZ
 9y7dQd+YcHk67az8zuAQ08+F/ORmDBPlTG4GIcRGnyMT+qMMYQnbvkl64c+8Gd4tX+w18sWNO6
 O2arUFGA5yDgqlJ8Ak5FHs03DeGn7bENVA1RR1qelROhxA2ZG3jWknPVA4HJ2ro/5Nj9MtRxlR
 AeQ=
X-SBRS: 5.2
X-MesageID: 35308983
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,357,1602561600"; 
   d="scan'208";a="35308983"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JL2KKMjyKiLpwYi4lqv/3phZDVoD/ChK/TFtqcHfJK3ChYgmIBRyDXwhZv0tlfUyCN7kZyUFyu/GCuibGAqpUH66ROILgCk3kCTEtX7Dp7bxjdPDy9m/2GYlQuEuR9QgmP/yjtTsoFT4FAqwgufmb6pNH5mAz6RT6rPgocuuvHeMwDtv3aJBnqBh7An3SW0qPbTxqWkCQcl5Sj33fQ481mh4CKdBNcrNtQnL5YTXHdG5v9OAr6Z+Wicr1nGMEH07jvRYCmqJT0j60BwA+7Ed3fWnrEwDFXoAbZBDyXdaRRTkY4DtysXbQAohhU+w4A6CwSAXK+tSDYJ+xBRC20B0zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RY5Tux6K6OmR16Unwf+Ela/uhSG9dwPc5lRZQsb5Gs0=;
 b=l6URtP2g3krDhmZwGNIbca2WX0QB8Z4k0W1qWXktRqJ/hV/rVUsM22CbERnhcBH406XnWbcZ/xPKZ3DUba+BfMEkOiHh7uqp0Qet8MTGpTHTBBksYhn4amO8J2d5d0XwpaAlbDlbBCHSffVtbeFcetu68pEtQUaDzi2B+CY7l8IGqJr9F25K77wUR1Vg3/TMc7P/PapYuPY+eMIGSAMYtzVcjKH4jCGUzr5BN55Yu29SqZqxHD1yCcb6aDl6PhspP5BWMnV1v/Q3sT2bZbS+E0R9Vj0hauGm3zBIi9kBWg8Sa606lMvf/Uiuc6WRqT2ZBIhcSEOtrVRhBc3pRzF/KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RY5Tux6K6OmR16Unwf+Ela/uhSG9dwPc5lRZQsb5Gs0=;
 b=MZl4qdyAkxPbWWD9XFL7I/QKkf43jC7QNSqxWj3sif/b8JckSLSOC8oAS7p7ijREk9RVICEJWdnAShraHDpYMe9qMNxX6drF66upQOK+NzKykpxoQ646AtU/GUuQqeYj3keNKi1MdRkimUiSKjSUspgZntoBkzh1lxEQJLewim8=
Subject: Re: [PATCH] gdbsx: use right path for privcmd
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Manuel Bouyer
	<bouyer@antioche.eu.org>
CC: <xen-devel@lists.xenproject.org>, Manuel Bouyer <bouyer@netbsd.org>, Elena
 Ufimtseva <elena.ufimtseva@oracle.com>, Ian Jackson <iwj@xenproject.org>, Wei
 Liu <wl@xen.org>
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <20210112181242.1570-8-bouyer@antioche.eu.org>
 <20210118180349.l52rbadmmfe4l6qm@Air-de-Roger>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <c1375ce9-7750-8443-22aa-41e4cf4713d7@citrix.com>
Date: Mon, 18 Jan 2021 18:45:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210118180349.l52rbadmmfe4l6qm@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0484.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::21) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4fa6c67-b906-4481-d5ae-08d8bbe14630
X-MS-TrafficTypeDiagnostic: BYAPR03MB4054:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB405463A3D94968019D1303DEBAA40@BYAPR03MB4054.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jRSOFg0lGW1ZycHkra6lF3a8xb4pHyttyaadihlndC5g+sAGVbn5JASVt6uZZy/oPNbYN4jP861HuG6gXQAiBsxfJimTzYOejyiGtKVKLlaSsUz5QzaypvNgddP5Uyuo/uyl+T2dODI6DhXEwhMCbFzXQnVhCo7dXReXnCLIsHG2yzIlf48Yu37Gw454qjlSudiisEFo7a/AYUwj2i/HyGgGbhIPTD4f3aPLEx0x5u2USPri/eT6J4RaefFkqJQh1igAdMTZYtBbYC27in5PCcYBWT35MslZl6UWIIObu4eE4wZODr9cJDUQEgQKDa8XtAoU2sfRQZQG/glOcG5UH7kLN8pwCn0oNxXmPRRNYzy0psaux9YlTqmOOnqtY7rvAIyuwaeXiUCVYZOQLu/Q9BngYnMjslh48EF6rGfU7PdoeC2gEjnc7wIf6TZ4Wy2NFy/CKeVNVbm4bvU+Au1e46XLvt0v65XVV4VIBfGoqBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(6486002)(8676002)(16576012)(54906003)(186003)(6666004)(31696002)(2616005)(478600001)(83380400001)(316002)(110136005)(2906002)(66476007)(36756003)(4326008)(53546011)(66556008)(31686004)(26005)(86362001)(8936002)(956004)(16526019)(66946007)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VUJ2TzVnRmVwSkd2ZzNBV1hDWk9IR0QvVkpRM2VwN2lqK3RDaHd0T2ZTdEM5?=
 =?utf-8?B?UnJrL2YrTWlYNkdtRzNIVlVXcHZFZHFjd0E5Wm5ZMHpJSDM2S01rVDJzMlc0?=
 =?utf-8?B?UEt5WWg4OGNFUmJxL2lmQ2JtSXdldEpwZ1h4TlNMdnYybGxPM3hidEUzRDBi?=
 =?utf-8?B?QTlPZUxxK0V5L3J2bTRDa3ljQ0NKYjFrYmFhd25Vc1BqQ3F4UkFoTkZzTy9D?=
 =?utf-8?B?TDBUY1dpaWYweFp2U2p4VWNab2JsUFRjVUNWVG9pLzlGNG1oQlVFTEhQT1BO?=
 =?utf-8?B?U0JCU0FoKzVHQXdXZkpQdVJEems2bVVrNVFtZnhoMitMUnNLeXV3amV6UkdR?=
 =?utf-8?B?TWF6eTVvWW9QM0xqT0N0elVvdldHaXBYKzFlNm1qSVJmWW1DcTFyVDk1M2N5?=
 =?utf-8?B?enpFRGlzYkJEYVZYYWN0Nko2NWhhL1dFSi9uVGRFb0FsZjgycFhwbnVIMlRt?=
 =?utf-8?B?SHBZWEtaUHhLVXRVRGNCcWI2djhmdGh1MG9uUEpPbWJ0bDhVRGtJTXp5T1VQ?=
 =?utf-8?B?L0kzSDkwb1ZrMFFJUUN1UXRKS0lodXU4UWlCUmp4TmpYcVcrR0FSQnRReTZp?=
 =?utf-8?B?YnU4WE1oT2tsUHdPNjVoZFgwNWVmRUZSM1h5YzZkVFdYNG1Hcjlaalp5QVY5?=
 =?utf-8?B?MkxTdFgvZ1VweUMyWCsxS2xKakEwbG1TRzlRcE8vRUdjdHk3dzNWVmJVbVRq?=
 =?utf-8?B?ckIvbzB5dGxha3VNZG9FLyt2K3FrSERPZFdQbXY4dE51RnNOUzZwb24xZFNt?=
 =?utf-8?B?d2FRL2FHU1JUaFVxMG1DOVR4enZXR3JvUTdqTEhIdzQ3bmE2cGVNd2MwMXRC?=
 =?utf-8?B?cnQ5WVY5d0pneFR0VXBBMFRwaU5wb1ZVN3NJZmVyRjhvZkt3dytGM2I4cFhB?=
 =?utf-8?B?L3hVRmh2Y2l0QkVvNkRPN0ZiUnJ2ZFNld1h0UWdrdzQ0UjZUOElhS0dBN0hj?=
 =?utf-8?B?cFJITkptd1puWnBHOUZJanQrQUM0bmc1OXZvUmV3YjczRlhIdWQrRU9JWG1y?=
 =?utf-8?B?c3B3czM3bndmclBqZjYrVkt1dlZpVlJiSzBJWHptZU5QbGtOcFdDZ0VvV3Jn?=
 =?utf-8?B?RnkydHNYNGNiV21DZ3M0WU1qYXNRTm5sNjFkcXg5VENlN3dSbm9FSXExeXNn?=
 =?utf-8?B?YWppUkQ3NGdLNkY5SWhVMlZqWXdOMFc1NFgySUc4WVArelozSzNpUGxLYkFR?=
 =?utf-8?B?Nzg4Mi9ia2p1ZHAyWkxCV3NqRTlmVEptMU81TDJ3SHBrVlo3bGI5ZGF0VzNH?=
 =?utf-8?B?YjBXWUl6WTZWVVVGbTRVaC9KVmFKQmhOTXNiRVZCbmRXSTcrM2hKV252TGdY?=
 =?utf-8?Q?o3d0FFUfAYCuq6M+1XyiYTnS+CzV1oa0Hf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fa6c67-b906-4481-d5ae-08d8bbe14630
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 18:45:49.6314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/DrHrKePrVCtE2CAh0KIZVL3QNJ0zTBhxVIoBm/toedSs461VvXtBtcfDC7cUGvyHTVmBwzqNS9cVGFz8FdfMEjUDoh3K3nEdrqOfwfBy0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4054
X-OriginatorOrg: citrix.com

On 18/01/2021 18:03, Roger Pau Monné wrote:
> On Tue, Jan 12, 2021 at 07:12:28PM +0100, Manuel Bouyer wrote:
>> From: Manuel Bouyer <bouyer@netbsd.org>
>>
>> On NetBSD the privcmd interface node is /kern/xen/privcmd
>>
>> Signed-off-by: Manuel Bouyer <bouyer@netbsd.org>
>> ---
>>  tools/debugger/gdbsx/xg/xg_main.c | 10 +++++-----
>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/tools/debugger/gdbsx/xg/xg_main.c b/tools/debugger/gdbsx/xg/xg_main.c
>> index ce95648e7e..83a009c195 100644
>> --- a/tools/debugger/gdbsx/xg/xg_main.c
>> +++ b/tools/debugger/gdbsx/xg/xg_main.c
>> @@ -130,11 +130,11 @@ xg_init()
>>      int flags, saved_errno;
>>  
>>      XGTRC("E\n");
>> -    if ((_dom0_fd=open("/dev/xen/privcmd", O_RDWR)) == -1) {
>> -        if ((_dom0_fd=open("/proc/xen/privcmd", O_RDWR)) == -1) {
>> -            perror("Failed to open /dev/xen/privcmd or /proc/xen/privcmd\n");
>> -            return -1;
>> -        }
>> +    if ((_dom0_fd=open("/dev/xen/privcmd", O_RDWR)) == -1 &&
>> +        (_dom0_fd=open("/proc/xen/privcmd", O_RDWR)) == -1 &&
>> +	(_dom0_fd=open("/kern/xen/privcmd", O_RDWR)) == -1) {
> Nit: hard tab instead of spaces.
>
>> +        perror("Failed to open /dev/xen/privcmd or /proc/xen/privcmd or /kern/xen/privcmd\n");
> I would have split the line, so:
>
>         perror("Failed to open /dev/xen/privcmd or /proc/xen/privcmd or "
> 	       "/kern/xen/privcmd\n");
>
> If you can resend with those fixed please add:
>
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I'd shorten it to just "Failed to open privcmd".  I can fix on commit if
you're happy.

~Andrew

P.S. Part of me doesn't want to know why we're opencoding libxencall here...

