Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 200CC3D76EA
	for <lists+xen-devel@lfdr.de>; Tue, 27 Jul 2021 15:37:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161204.295998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8NFx-0001B9-Je; Tue, 27 Jul 2021 13:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161204.295998; Tue, 27 Jul 2021 13:36:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8NFx-00018n-GR; Tue, 27 Jul 2021 13:36:25 +0000
Received: by outflank-mailman (input) for mailman id 161204;
 Tue, 27 Jul 2021 13:36:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ggmi=MT=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m8NFv-00018h-Ha
 for xen-devel@lists.xenproject.org; Tue, 27 Jul 2021 13:36:23 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a109f17a-eedf-11eb-96f6-12813bfff9fa;
 Tue, 27 Jul 2021 13:36:22 +0000 (UTC)
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
X-Inumbo-ID: a109f17a-eedf-11eb-96f6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1627392981;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=wFD60ybjZ/68Z7KQ3tdxlzFgC9WkJZstH9j8ETv7pJM=;
  b=MkgV0X/KGJxHH0sLIMqi+H5+j036AyKDx6oyk5Vo6irFr57vqPgd3JZ/
   ux9gRxTgZUuzzZvMZuXSrsyLvAOj6Q01SbV3GuMlAA/gdj62apDs5yvk2
   OxKBDG/CurEoDaFPsmizm4oOmm2XYlJAaLzlUmvHuQIdtB8wylxrcpvSv
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: ZV/SeQbrKxbNeYzaQpmwHX8LvoDfiLBf7erIXnC2xJcS7lVR1TgcnkOqG0Gnz3w3hc5F+/m5e1
 2JQ5cEFaHdj6Xnnywo3vfnL5RGEjynqXko09J9iKVdJGSfXhYNvEiHQI4yDBsXHAzR4KaW1HmN
 kfuOrQ+YyL2w/CpsTCZ2LFXe/1XP+UswabSAn7xBnTwEecrjq/+ADRvGpQxH5PUmMjn0hLhIMn
 +S/WQW5gKCvCDaGWAqwK8doLpBjk80WQTigZhWPQFHT0Cud8D4nwPA/oyALXA/aS/np4MEemkM
 i7hR90/OH5AfQOGP71/RV5yJ
X-SBRS: 5.1
X-MesageID: 50850982
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:sqqCOamRxZ5dB1wSFz1KOkqw20jpDfOlimdD5ihNYBxZY6Wkfp
 +V8sjzhCWatN9OYh0dcLC7WJVpQRvnhPpICPoqTMmftW7dyRSVxeBZnPffKljbehEWmdQtrp
 uIH5IObuEYSGIK8PoSgzPIYOrIouP3iJxA7N22pxwGIHAIGsMQmjuRSDzrdXGeLDM2dabRf6
 Dsn/avyQDQHEj/Iv7LfEXsCIP41qz2fd/dEFE7Li9izDPLoSKj6bb8HRTd9hACUwlXybNn1W
 TeiQT26oiqrvn+k3bnpi7uxqUTvOGk5spIBcSKhMRQAjLwijywbIAkf7GZpjg6rMym9V5vut
 jRpBULOdh19hrqDy+IiCqo/zOl/Ccl6nfkx1PdqXz/ofbhTDZ/MMZFjZIxSGqS12MQ+PVHlI
 5b1WOQsJRaSTnamj7m2tTOXxZ20mKpvHsLi4co/j5ieLpbTIUUgZ0U/UtTHptFNjn98pobHO
 5nC9yZzOpKcGmdc2vSsgBUsZ+Rt0wIb1O7q3U5y4uoO2A8pgE+86JY/r1eop44zuN5d3EejN
 60a5iB/dp1P70rhaEUPpZLfSL4MB2Uffv2ChPkHb3QLtBOB5v8ke+C3FwL3pDdRHUp9up+pH
 2TaiIViYYNE3ieQPFmmqc7qSzwfA==
X-IronPort-AV: E=Sophos;i="5.84,273,1620705600"; 
   d="scan'208";a="50850982"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lzCRlgF7oxs6Ot4q/u82ZhQ6QcdwmLa9dN7zSaVClgb69w7VnhHH3lZ0sflfpy/Z5Mb74kCwJuM79knA8+Nxw9u1GvIYNTR0pyEyJIGT4Ow+Rcl4MwOmfDDmbkD5IQQPw9KPFoWRXBVXohaZPzosupPOzm7tUgjkw0mN4x2+80p1fr51CUWmFqII7QowpTVU0XO7OrOz0NIKuKQVq783lmQU4qS3me9gAlHWrnLogbH0xSxf8j7ENupDDEh8My+mqZ80i/o9GpZ2uNVepgGD6EqLxiLZIjcGhUmrTjWc7BPtCW6OGE/7wC8p3LipjlFWtWpukyHOrXb8VaBrSLn8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFD60ybjZ/68Z7KQ3tdxlzFgC9WkJZstH9j8ETv7pJM=;
 b=VAGoBhchjQq2wHK5/izHuQNtdK79lFMhmvyQNtANSuKcwuXKwPOh43K5z1DjN4TYZA07hb219zjxkoaeeAshK2YJKkWvcV8vxeubj2k6B9UcHaqkY2rQ+ZQ2rHjZaZNi++7D08K5/XtC+dWX5TLqb5qCsINqR/hyMfxlIGxdbmHn8m7u+hNPdrxIvbDtP3kQdix/QxepslXx5iEHtEKit+F7VQRZyDAEXqLxVpawW7gu82t995Lf9Z3cBgnRbj5eXPC6rnk70ryIZy9f3MWOUjpU/Z32/iJzRF44u8TVT1MTqa6LpBzkr7cJvwL0n+XYhUdZRt5cLg0h/8iJdt+9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wFD60ybjZ/68Z7KQ3tdxlzFgC9WkJZstH9j8ETv7pJM=;
 b=Z3K1XvR2z4QwP5WzVQwLwy7duWouMuPZmb3mj2ZtFx59xQUXE5yBonYCO99IjL7xTjS/SRZ6Vm84660fCCkbTWVyTStdMooSuiNHBj1stv2rFm/7Xn0k5pQCr0pdvMyKWEp+aseB1w8B2kpzVPUrOLNC6GC2m7aUnFHwIKXO7wI=
To: Costin Lupu <costin.lupu@cs.pub.ro>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
CC: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, "Wei
 Liu" <wl@xen.org>, <xen-devel@lists.xenproject.org>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
 <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
 <badec201-6719-844e-2a07-6508e891ca3e@citrix.com>
 <3c819563-b354-5527-050d-f698324d6021@xen.org>
 <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>
 <65d35862-304c-7fe3-82de-3ff62f06529a@suse.com>
 <40c00267-60d2-c0fc-cde4-8ac4ce936f87@suse.com>
 <d7cbedf3-bb67-1eda-70e2-d15c5649c0cd@xen.org>
 <69c62b4c-b46f-9eab-8dfd-742c07423424@suse.com>
 <c0a7de56-de7b-3451-8cc5-ccb73c78ba42@xen.org>
 <ce7a20e5-3f18-11b6-d0d1-72e31362d2fb@suse.com>
 <bb9e482c-e9b6-9def-7e7e-ac2ba9b7e7f4@xen.org>
 <7fab704a-6b59-1e9b-663e-a3afdfcc319f@suse.com>
 <3a6f1fc6-a9b3-78bc-1b73-b7ad10d20405@cs.pub.ro>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
Message-ID: <627d776e-575e-c32a-f3f6-87ace982d6da@citrix.com>
Date: Tue, 27 Jul 2021 14:36:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <3a6f1fc6-a9b3-78bc-1b73-b7ad10d20405@cs.pub.ro>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0135.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e8df6381-e680-4f2f-84b1-08d9510382cf
X-MS-TrafficTypeDiagnostic: BY5PR03MB4998:
X-Microsoft-Antispam-PRVS: <BY5PR03MB4998C6E812B6A0423C352CD9BAE99@BY5PR03MB4998.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R2upOLfqJs5OkYRdhdE1hVdyK5G+6WDnDFQhRcZYJg6txROL0yGEP5GV7NuRR3DYQvI8tUTYOnQfrMseWfhYc/XK8gnYy7kTlVbu5xDakI9KnwbVQV2cZGStbf92dO9OSvrKGx7OP/Kb5baqce6rGcCK9FGfJ+F1ZkkMhMLILvIm7DRr4gRIg/9GnYm3aqY6F4QjtL2RccGw36IpaDFuhDOQQ+TtcgTxwjEkLZRAtXgly1TteMuRG5XeaguJ2n1nSrHXjKaOwvA4DqGHb15kSa37x23GLzpS/TWVrAQEXpEkIZR9SaTtXj4tzV4WwNQ1Quc70BQkIPyFcw/CUJNMcCt5tPRYS9IBe4nKQMyLgaOcb+D3XDv3iXgxoeOBONCAtAZmHrueRg2g+QXseHD3cw1BcoqQUSDfLZiABYCp4hniq8tZRwujwxT8AMt0eJqCHgxjfpG0mhld7lusrv4wPcjsmVXYfm4iIwNA+gXL1BiA23w87OpPYp0eNd+FF+7gRvUKCnBfEJt4PekJLEnGLHjBcdw5bXH06kaDXhj66IEGDvO+3dzl5WPZXy9Pd+w4Z91xWA+lrrFBkZUa2lRW4/4vE3tP5z4yzkAMpBF7aamcA+efQqEKPIoYynuFprs+63OSzNdTPEvykEnT7HsodFcFaqTYW31kggZD4/VOKsAaNE8+o5e+z6NwwE/0zE7l/UdYkRDh7vysxTY41FZiKdK7WMCt2peDQL2Pvi1bxebmUeSRWGSHztlUbAN1E6fq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(396003)(376002)(39860400002)(2616005)(31686004)(31696002)(53546011)(5660300002)(478600001)(36756003)(4326008)(38100700002)(8936002)(2906002)(186003)(16576012)(83380400001)(86362001)(6666004)(110136005)(316002)(26005)(956004)(6486002)(66946007)(8676002)(54906003)(66556008)(66476007)(98903001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1dLaFJTYkJodm1pNEtUeS9pMjMycDZxOFNlcFYyTGJhU1NQZWJSZ2dhL3Zq?=
 =?utf-8?B?YmtRRG41THhlR2RhbjJTa2wxN0R2b2RvVlNYdVA3S3lEYlRvL2NkNkhpU0Fv?=
 =?utf-8?B?aSs4ZEJsNXh0dE5TY3d6NWFlV05uWkZ3ZWdpKzNzQjVnWDB2bHZmWUpNZGd6?=
 =?utf-8?B?U1dpMDlWRGNmcEVYbkxzNmptbjNDcE1lWWZoSnIrM0owWU9RczIyd1hZMGU5?=
 =?utf-8?B?c2tmOXdVYjJFL3JVbkxPZkxTcEFjTVN0Q0pTU2Ztb21tL0swTEd0UkQvSDlS?=
 =?utf-8?B?akg0c1cvNzVRSGZwRVR5ZEppaEJ3WHVCTU9JdGdCamROUHZXZ1g2MEZUTThM?=
 =?utf-8?B?WjBEaFFtcjAvdE9POGhZTnhSU1pQYXphb0pvRGFUWXpSUC8vbC9NVkk3WXRI?=
 =?utf-8?B?cmQ0aWYvc28yOFQ1dCtrL3NXMmhWZXRmTHdEZ0hVTjVFaXQ0MUlmTmVQVXd3?=
 =?utf-8?B?VUJMQWoza0lrVWEyQW5SRzNqcFd4YXNXNFMyZXA3WjQrU2JRK01FV1R0cHNj?=
 =?utf-8?B?WTlUY0N6K0pXYU9aWEtMZnBsdUM2WHByUmp3TUdPOHZ0YVhkdDRhWFpsa3hT?=
 =?utf-8?B?aE9LSU9HeFdRdFZGSFNvVituZHpmRFBNQk84WGlucjBZcStBenh0b2Z0cnZD?=
 =?utf-8?B?NVpid0d0TGlxZmZyeWFEVWNwVktsYWh1Y3VTWFVHazBJWkZKWDl3NGN0bytH?=
 =?utf-8?B?TWVMcEZVV0N1TjVmTEpuZlVOUDBHZDBPRFF1eVZuYVhEckdsSkJLamZQNWFC?=
 =?utf-8?B?VTRyQy9yK0dLQVd3UzM5STA4YUFMYWdmcVVoNXJyVUMwUjhoZ1VMblZDL1pq?=
 =?utf-8?B?TWxvdzFtNkZ6WURZSWZyOXIyN1lVcUJvQktHTERBWWtEVmV5TWJLVEEyMHVL?=
 =?utf-8?B?amtHOWt4d1JtVmVjd29QNFBWLzVyYXd2TzluK0F2NTFkQ1ZUR3FjTzVXc21D?=
 =?utf-8?B?eHFuSG5HcEZ4S0pNeG9ZQ0IvVVI5M1BzMTBEc2w4Mld6K0IwVGhRNm5nbkRh?=
 =?utf-8?B?cFJ3SDIrM1diZUcvdmRFNi91OXJaSUxqaFUxWVBjdElROXlFQVA2NytOK2NW?=
 =?utf-8?B?ZlV3dkJFT3lIUkl2N080NU1qUW1xcEpDVXJOb2hBQ1VQZDBBa0RzL01oa1Ur?=
 =?utf-8?B?amxxeVVkb0tDQ28yOTllWnBDRHRGNjgxWlVaMnZDM3pQV1VlN0d4WVloV3Bj?=
 =?utf-8?B?c1NCejA4RWd5UmZCUDI4MG1NNTBKdUlFNkVHY09LU3F5QzF5NU5maFlxSVVs?=
 =?utf-8?B?NERRdnR2RHREbFhyR2IxSTRhZnpjSURwZFo4clRVcHpVaW8rMFk2Mis2bTZn?=
 =?utf-8?B?TC9EamJGclNsbjdYb2pldXFhRXo1UklKNnNhcWsvZDdqeDRrSEgzb042dnY2?=
 =?utf-8?B?cWFycU1zRnRhdkxIWmZHSlF6UEh5cEVoVzZMY3NNK01GdmdsZVNnN3d5SHN6?=
 =?utf-8?B?SU1SRGxoZGp3WURHOWRSejFGekJjci9md0hpdGNFOGVtSDhaYVZlRThiREtT?=
 =?utf-8?B?bmN5aWZwa0JUb080T05vUGprblJvYXptcGsrdUU3ZTFtdXkzeDc0ZTUzeEh3?=
 =?utf-8?B?cnNNcU52bmF1MS8zWEc3d0hvN2trb1EyeU44NGl0aSsyTXhyTVY2MC9NdHM1?=
 =?utf-8?B?azdwcDJpQVVpQTlVZC92RU51d3FwcitjUnZQT2RVQlc1Y0dmMzJmZzcrakcz?=
 =?utf-8?B?WWtCZFVpMko1WWhwK21rcGpiYTVja3V2alBIYS96RG9sRFpscCtBZFNKOUJ6?=
 =?utf-8?Q?7cGWa9rO7fMQtXdtypzdmXGdkokfqO77eBfYjoz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e8df6381-e680-4f2f-84b1-08d9510382cf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 13:36:17.2164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjtqVoaq9rK8Nm9lz0HkpYQe9ung4ajgCB1ydoaRaLxiozQcFd6usJrKyJrNu5oo9GjvbNx0I0vUALEX9rjpHaXWPV9fjvZ/OvN5MqnlZCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4998
X-OriginatorOrg: citrix.com

On 16/07/2021 19:28, Costin Lupu wrote:
> On 7/13/21 6:20 PM, Juergen Gross wrote:
>> On 13.07.21 17:15, Julien Grall wrote:
>>> Hi Juergen,
>>>
>>> On 13/07/2021 16:09, Juergen Gross wrote:
>>>> On 13.07.21 16:38, Julien Grall wrote:
>>>>> Hi Juergen,
>>>>>
>>>>> On 13/07/2021 15:23, Juergen Gross wrote:
>>>>>> On 13.07.21 16:19, Julien Grall wrote:
>>>>>>> Hi Jan,
>>>>>>>
>>>>>>> On 13/07/2021 15:14, Jan Beulich wrote:
>>>>>>>>> And I don't think it should be named XC_PAGE_*, but rather
>>>>>>>>> XEN_PAGE_*.
>>>>>>>> Even that doesn't seem right to me, at least in principle. There
>>>>>>>> shouldn't
>>>>>>>> be a build time setting when it may vary at runtime. IOW on Arm I
>>>>>>>> think a
>>>>>>>> runtime query to the hypervisor would be needed instead.
>>>>>>> Yes, we want to be able to use the same userspace/OS without
>>>>>>> rebuilding to a specific hypervisor page size.
>>>>>> This define is used for accessing data of other domains. See the
>>>>>> define
>>>>>> for XEN_PAGE_SIZE in xen/include/public/io/ring.h
>>>>>>
>>>>>> So it should be a constant (minimal) page size for all hypervisors a=
nd
>>>>>> guests of an architecture.
>>>>> Do you mean the maximum rather than minimal? If you use the minimal
>>>>> (4KB), then you would not be able to map the page in the stage-2 if
>>>>> the hypervisor is using 64KB.
>>>> But this would mean that the current solution to use XC_PAGE_SIZE is
>>>> wrong, as this is 4k.
>>> The existing ABI is implicitely based on using the hypervisor page
>>> granularity (currently 4KB).
>>>
>>> There is really no way we can support existing guest on 64KB
>>> hypervisor. But if we were going to break them, then we should
>>> consider to do one of the following option:
>>> =C2=A0=C2=A0=C2=A0 1) use 64KB page granularity for ABI
>>> =C2=A0=C2=A0=C2=A0 2) query the hypervisor page granularity at runtime
>>>
>>> The ideal is 2) because it is more scalable for the future. We also
>>> need to consider to extend the PV protocol so the backend and frontend
>>> can agree on the page size.
>> I absolutely agree, but my suggestion was to help finding a proper way
>> to cleanup the current interface mess. And this should be done the way
>> I suggested IMO.
>>
>> A later interface extension for future guests can still be done on top
>> of that.
> Alright, let's have a little recap to see if I got it right and to agree
> on the next steps. There are 2 proposed solutions, let's say a static
> one and a dynamic one.
>
> 1) Static solution (proposed by Juergen)
> - We define XEN_PAGE_* values in a xen/include/public/arch-*/*.h header.
> - Q: Should we define a new header for that? page.h or page_size.h are
> ok as new filenames?
>
> Pros:
> - We fix the interfaces mess and we can get rid of xenctrl lib
> dependency for some of the libs that need only the XEN_PAGE_* definitions=
.
> - It's faster to implement, with fewer changes.
>
> Cons:
> - Well, it's static, it doesn't allow the hypervisor to provide
> different values for different guests.
>
>
> 2) Dynamic solution (proposed by Jan and Julien)
> We get the value(s) by calling a hypcall, probably as a query related to
> some guest domain.
>
> Pros:
> - It's dynamic and scalable. We would support different values for
> different guests.
>
> Cons:
> - More difficult to implement. It changes the paradigm in the toolstack
> libs, every occurrence of XC_PAGE_* would have to be amended. Moreover,
> we might want to make the hypcall once and save the value for later
> (probably several toolstack structures should be extended for that)
>
>
> I searched for the occurrences of XC_PAGE_* in the toolstack libs and
> it's a *lot* of them. IMHO I think we should pick the static solution
> for now, considering that it would be faster to implement. Please let me
> know if this is OK or not. Any comments are appreciated.

The immediate problem needing fixing is the stable libraries inclusion
of unstable headers - specifically, the inclusion of <xenctrl.h>.

Juergen's proposal moves the existing constant to a more appropriate
location, and specifically, a location where its value is stable.

It does not change the ABI.=C2=A0 It merely demonstrates that the existing
ABI is broken, and thus is absolutely a step in the right direction.

This is the approach you should take in the short term, and needs
sorting before 4.16 ships.


The dynamic solution, while preferable in the longterm, is far more
complicated than even described thus far, and is not as simple as just
having a hypercall and using that value.

Among other things, it requires coordination with the dom0 kernel as to
its pagetable setup, and with Xen's choice of pagetable size for dom0,
which may not be the same as domU's.=C2=A0 It is a large quantity of work,
very invasive to the existing APIs/ABIs, and stands no chance at all of
being ready for 4.16.

~Andrew


