Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DBC34786D
	for <lists+xen-devel@lfdr.de>; Wed, 24 Mar 2021 13:25:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100965.192721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP2ZC-00067t-AQ; Wed, 24 Mar 2021 12:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100965.192721; Wed, 24 Mar 2021 12:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lP2ZC-00067M-77; Wed, 24 Mar 2021 12:24:54 +0000
Received: by outflank-mailman (input) for mailman id 100965;
 Wed, 24 Mar 2021 12:24:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u5GA=IW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lP2ZA-00066w-8A
 for xen-devel@lists.xenproject.org; Wed, 24 Mar 2021 12:24:52 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82c4e778-5ae6-492e-868d-1bad5e9776f9;
 Wed, 24 Mar 2021 12:24:51 +0000 (UTC)
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
X-Inumbo-ID: 82c4e778-5ae6-492e-868d-1bad5e9776f9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616588690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=giVRHJtlc3DCWL3OaQWEKD7vShJB0d2LgQoSwJbG6k8=;
  b=IOEF8nMB5is5qCkfYvmbsKvbHfRT3PY69+qBHuE3EqZz6VTVNptfcctj
   jzc8t0t3eC7mgf/MpcwTkKIp1KHJ/XFl22LzNQEL6cp2cQa/SY2wRcz5l
   iRFPlF4pHiVt912BpBaTlS5VsPhNLPp7Hgt4/6cOsixiGSWqzQwE3uEpC
   Y=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: MWVqDfl5Oh2x+CTTTVlOFChm9giwfAsqHU6eOOwBY+4wQE1uvn/NH1DFD86R8B3mH4aaKG51vo
 6Fi1xAFkfRMwOEisaDmMJkstzoLFVq4aHdcMDhyp9s134SrKgfyJEePuR1KxvHN9CVm8SIIFAv
 0D+fmPCsmDi1L63UKh7Lm7nY0pGCeXGJ5h2iU0cJiv+MjQrzD02R1WyMx/MC+eZfdH//PJmzDw
 Lqu4YZLM6l/kAxHz/2YlJl9PjhQDd3Vt1juDT0i6Hj3X67Ma3Bq5WgHy6ybFlW4WBr9yE1I+Wg
 F8E=
X-SBRS: 5.2
X-MesageID: 40164080
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:glLOwq/CR2AKh9hOauNuk+FdcL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmyybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUHD38Zn/+
 Nbf6B6YeecMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsKV4hLxW5Ce2KmO2dxQxRLAod8KY
 GV4dBJqyHlVXMcaMm6AXdtZZm+m/TgkpX6bRkaQyM28QXmt0LU1JfWMTi9mi0fXTRG3Ks4/Q
 H+/TDRy62/v5iAu3nh/kDJ6ZA+oqqC9vJiA4i2htEROnHQjG+TFf9ccpmjmBxwn+218lYtl7
 D30mcdFuB+8WnYcG3wgTaF4XiY7B8U53XvyUCVjBLYyKSTLlJKaLsyuatjfhTU8EYmtt1nuZ
 g7pV6xjJZLEQjG2B30+tmgbWAaqmOPvXEgneQP5kYvNrc2Vbk5l/17wGplVL0EHC789bk9Fv
 hvAMz29J9tAC2nRkGckW91zNO2WHMvWj+AX0gZo8SQlwNbhXZj0iIjtYAit0ZF0Kh4Z4hP5u
 zCPKgtvLZSTvUOZaY4IOsaW8O4BkHEXBqkChPcHX3XUIU8f17doZ/+57s4oMuwfoYT8Zc0kJ
 PdFHtFqG8bYSvVeI2z9awO1iqIbHS2XDzrxM0bzYN+oKfASL3iNjDGYEwykvGnv+4UDqTgKr
 eOEaMTJ8WmAXrlGI5P0QG7cYJVM2MiXMocvct+dEmJpu7NN432ps3WePveP9PWYHQZc1K6Jk
 FGcCn4Jc1G4EzucGT/mgLtV3TkfVG63Z8YKtmew8EjjKw2cqFcuAkcjlq0ouuRLydZj6AwdE
 xiZJfukqaxo3iK7X/Fhl8ZfiZ1PwJw2vHNQnlKrQgFPwffarAYoeiSfmhUwT+hKgJgSdjVVC
 pSvU5+967yD5H4/1FtN/uXdkahy1cDrnODSJkR3oeZ493+R58+BpE6HIprFQvKEBRxsR1wqH
 hKbTIFQkO3LEKstYyVyLgvQM3Pfdh1hwmmZeROr2jEiEmarcYzAkcAUyWWSs6RiwY2Tz9yjl
 l8mpVvx4aoqHKKEy8Ske44OFpDZCCyDKhdBAqIXolSh4vmYRp9V2uMmDychSwiY2aCzTRguk
 XRaQmvPd3bCFtUvX5Vlpzn9155bU2xVUN9YHISi/w3KU32/lJIlcObbKu61GWcLmYYyuYGKT
 fffH85OQV13e260xaThRePHXgr3Y8VI+TYFbgvGoujnE+FGcmtr+UrDvVU9JFqOJTSqecNS/
 uYYBLQAzXiCe8lsjbl0EoNCW1Rkj0Dnvzp0hG+szT98347HPbIIFNpA5scOMqR6mD4R/COlL
 V15OhFydeYAyHUUJqhz6qSUhtobjX0ikSyR/szqZ9Vsbkp3YEDV6XzYH/t7jV/wB46LM3Ij0
 sQT6Rw3aDZNuZUDrkvUhMc2mBsqc+GI0QquDHnG+MSfVkiiHnAItOCioC43oYHMwmkrAv0NU
 L3yVwkw971Gw+C36UdEaQ+PCB/b1U98m1r+Iq5BsftITTvU+FI51yhNHChNJdbVaieAL0V6j
 J3+cuBkePSVy323mnrzHZGC5ML12asWsWpBg2QXcZO7tyhIFyJxpKQ3/Tbtka/dRKLL2IChY
 NEckQMbsNMzhka5bdHrRSae+jQuUIqk1xX/Dd9sEXis7LWuVvmIQ==
X-IronPort-AV: E=Sophos;i="5.81,274,1610427600"; 
   d="scan'208";a="40164080"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lmEJF6Lr/PzEU6Q/xMbVIRQoT22nwov3vHu+lrXdsc9o8f1bdvl2EtB7pgKo7aRw/2uVJaMkFkBVaDOQMDqtCiIEVCCKtKKHAYFDf0jBOoPtQRWzQRWgM/tsg8glYIIAOWEuZ0i2tfL9XQ/wXZmH/atmj99CPjlBG3RYdcBIOtGUJHwFgRxVkv2jd6QxXvfjPLcaKFaMp+gFq/v1nPjq8Bh4kq/1Gdpj22bYKw/IMAQIIUKl9QBYwl8INUmKLXC+xded95SJT7U9RW5k59xkbBSU6N+2dKD2czYluCVSy+NITmXce7vTzQ0E7iIj7k0CjIZNcNZqgi0iGtJNVuzUzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQB1zomGHXhgskyyATY7D426hfczy2/Zc/M/21Hxsgk=;
 b=ZXP5QIvuHN99v6u8S72SbDpaLVQRgWKy4Ek5/0WT7tXoirJl9F3nmuNjKd09eHokHgPZpSX8Gl3naRXoz2pdoQESPPPX+/kQBiZ5gQ+/57Ah8BWFrSGxJRqv0gCfKg2wuEM404mC0sJw2HIRQQ0eX6iD3Str3CwImuxuVFEBEL5T2iK51ClksDS4GDoazd/yRvn07bMmyG+Y35USLtYyAHqIHsz+zesf6oE4pd3bYBBuhkXn15f0P5yeDjs6aqPMDY8MTyPtOPkQXQMDVBFKaJVPet3XNsYRva6JooK/Q+ABMZlsrjV4hz30MiOgoY5Yb/+EgJ2+uz1W4yZt8mpUFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pQB1zomGHXhgskyyATY7D426hfczy2/Zc/M/21Hxsgk=;
 b=dDJSONtAJGzYuSJhhzlaoc/hWqXwgeRu3owH6fLp3cSiYMG9l8P1BWWzkICQTPx46t/fuxaXbAn4krvloWOGI59sIi2nDiKAa22c1KJ6GraYChUFjV1Mdjh75IJDgwEQhn5OOg16jaL8RAKKxXc8OZSgv3xAKHvD/YTgseKjIF4=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
	<xen-devel@lists.xenproject.org>
Subject: [PATCH v2 2/2] Revert "xen: fix p2m size in dom0 for disabled memory hotplug case"
Date: Wed, 24 Mar 2021 13:24:24 +0100
Message-ID: <20210324122424.58685-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210324122424.58685-1-roger.pau@citrix.com>
References: <20210324122424.58685-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0127.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::19) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45ff27a1-9f85-417c-9673-08d8eebfcf5d
X-MS-TrafficTypeDiagnostic: DM6PR03MB5338:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB533860FED47D662569BC7D1B8F639@DM6PR03MB5338.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:422;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a8O3q5wVPgEqjakRRsL9+Ld3zERZXwkbTdWHkxRZsUCQ7bCc9bzlAzd5cDmMHVw03YzheQUkESAzp+qBj2rH7DM34Z4SgDTDjWQTCwmxhOHxtdmzLnopZc6/xyipcxNRUGGqzQt2UPsuO6HkpiiuveUz2ihbM/rccTlxOSdK710fvv9QsVnHeHtUFOy+b32iT0XJh5LWdmUZzgnTAkryd6WnC0gC2Uk1PC3LunSGm5UOuBqCSJctjbrhaTEFe5Tui36NhS6isWQKVxZUCAyEc2OJg/C7CUr/jvKvjHVYZMIegoRcJfMHVlVk7S7ZZ7lwi8qMZKaUJ8j4siAB+0gN5WoBqo7OUiJQ4ouM9GeFqbHj2mCczVFwKIbC8D9cZnv8Zqng2PoUhsIeLptEBfNmqL7X/RgGSH6xSXTaVJCkt70WRKUh3Er2UIlB9KAsTZ6vXGBrcnI56ClbA9bkXZWBm9qkfAP5f3lTHb2cZCf1ROe1UhruEu0Ru2itLtPVpqgRLyOi/L/VKajDXozzST/i3RSVKE3m2iAhM6OeTNuc9Z3VGry9AFykYay/Kn34CIG6KmnSvE7qvFlHc6ILReX0hUSgY8SbIqi8/eBZxchkwy1P0n2gCf2Q++pZgVa0i4msc/hxmpMg/d2UZXZuuNa36d1vv2oJerD6PgUp1VqHd14=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(346002)(39860400002)(366004)(2616005)(1076003)(83380400001)(8676002)(5660300002)(16526019)(6486002)(956004)(478600001)(36756003)(6496006)(66946007)(2906002)(66476007)(8936002)(66556008)(6666004)(86362001)(38100700001)(6916009)(186003)(26005)(54906003)(316002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UXM4R2NrZzJHR285dzhNZkl3S0wxTFZERWRtUzdYVXgxamN6VXdCSXI2UklH?=
 =?utf-8?B?c1h1bEZkUlFCNXlac3N5d0cyeWFKNmUvcnNmZHVuNW90RDhoeVlzZ2FKdUFZ?=
 =?utf-8?B?MWhDUXBNcGpadGtpTjZUZHpnY21IU0NJOHkvVTF6M2N3d2VZOW4xTU93enYx?=
 =?utf-8?B?SGZMamc0VHRHbFc4emZnVk9HSVdvWXhhMG40Snk5UVQ0R2o3VlNCYWg1NUla?=
 =?utf-8?B?Tm0rc0ppd2tSNGU4Zy9nR2YvbFJOM1hPZnBXd1BlVVhXc2RqSFlTWXczWUNG?=
 =?utf-8?B?UlRyMDQ4K2ZYNWs3RkNmYlpUMjQvN2l5MklnRWhiU3JxRzZOTmFoU2p1Z1Bl?=
 =?utf-8?B?WkdKVEJXM0tSVXhSN1AxSGdGTDZJR3p0S0N4b3BUVGZNbmJjRVhvR2ZtWFB4?=
 =?utf-8?B?NUkxb0tHQzZzY1N6OVRFL0ljOUp5OE9CZHlIUHMxTlV3SFozWHFlclB1SVd6?=
 =?utf-8?B?U3JEWCtUVTI2bi9kZDZUK2VtbDQrdlFyTVQybzdNVmhBU2xCTHJOaEFqelhT?=
 =?utf-8?B?b0lBa2w3WHlyVlhhajdsbjg4VytWYTA0YWQ2Y1ZqcDBzUUk3S0NwYmZxRHNk?=
 =?utf-8?B?a0JnT25JLzZ2TkNzKzlPQ0p4RnBuR0JNSGpkcG42ZGQ3NmRVWmRXMWF0dlpD?=
 =?utf-8?B?UStBUUdJcUZXNkJKUmV5bHBlL3owSDNvbDF1MXNCcHZWZk9ndklvMXkwNzVn?=
 =?utf-8?B?ZklLdWRUU0YvMjlacnNNWnNzcUhzYzV4OEZzU3RsbkZ4N0pHR0Z3TFo4OXN4?=
 =?utf-8?B?U0UvTzlOaHRpMHFPM25LdDJMamQ1NWtCKzVMdERVV1JZTEJJMW91VUQwTS94?=
 =?utf-8?B?V0FMRXQ1S0UvN2pzZVUvai9pUGNmc0h0T3RCMmV3bUpvaFczb2pWWnFjL2VM?=
 =?utf-8?B?d3FlMU9KVXZpVlFCTERsNHNjSXEvdFcwU0MxbGZEWGJONnptcmphK0tWb2ti?=
 =?utf-8?B?dm9RbEhKUWtsUHFMSk9iSmRFWnZ3cVU3YzZ0RXcwcFM2RVRPNW1rMHp6S1Ix?=
 =?utf-8?B?YUREazQvMWkvTUpsOUJDSDloQWNEMUxvaHhTMHoxSStLakhoOFZPVW0xL2po?=
 =?utf-8?B?QTh3dWNHUUJZK212UnF3ek10SkFwRGtNRXZmUlRoQm1RQ2pVZE1UTVBJU1R2?=
 =?utf-8?B?V0lSWkthNG5OcTFkK05LMG9oWStrVHYzWXJkSzhXZXJobytheXNkVHNkQk1H?=
 =?utf-8?B?TDN0MWhzcVVqMFZpSkkwTEdzVnNTVVZ1d3k0ZUxYL1c2MEhVcElDeG8vdUlT?=
 =?utf-8?B?ZWNtbm9uVnM5NEh3SW9iUGVDOTlQdU8xaDl6VUFrdFpFTVBQSlR2SVg3TzlI?=
 =?utf-8?B?N3NlbVFyYmpGNDdjQXJ6MGFjMmkwbFN3NGpoRzAvR3ZvUVhGeVNDT3NtSUlO?=
 =?utf-8?B?ejR4NVQ5K2F2VXJ1UUc5dUl4NTZPMytRcjVxdTV2WTFDVWRnSUw4aE9tb3du?=
 =?utf-8?B?Zzd0dGFzelNpUnRaTXh1N2JnVklpekc5eCtYVm52Y2s5dWQxOU5KSll6blRQ?=
 =?utf-8?B?Mm1hckYxa3RyTzNpL1RVUmZ3ek5kUnZDSnhpZ0V1VTkvZGRyUlZTbTRRZ0pT?=
 =?utf-8?B?OWZsOWovMWJNTUcxZjFwaUY5bzR6UFpJKzc5MlVPdG40VHRjQTdpR2F2Q3M5?=
 =?utf-8?B?dWs0OTVkcmtEQnZuOEMzS1ZyUzFPNW5ncjRJYkpPTVZTK1pGUGhSdW04cG5U?=
 =?utf-8?B?akEwQ3RUMkpSQ21mU2NZNk9nY0psYWp5Q3dpcVJ5Rjg3M3JkWmhXWm9KTVRj?=
 =?utf-8?Q?N6DKcNiiP2EPW4hfOGDqfA52oYds5yqB+fnqNQg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ff27a1-9f85-417c-9673-08d8eebfcf5d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 12:24:46.3343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5P5AHeoLbcfH/J+D+I8hYdLpSAH5u9ZHVFulgpdZii+3jzSyaltJ7+iKJOnLkntvn28zsL+r0iAlmNi5wLOIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5338
X-OriginatorOrg: citrix.com

This partially reverts commit 882213990d32fd224340a4533f6318dd152be4b2.

There's no need to special case XEN_UNPOPULATED_ALLOC anymore in order
to correctly size the p2m. The generic memory hotplug option has
already been tied together with the Xen hotplug limit, so enabling
memory hotplug should already trigger a properly sized p2m on Xen PV.

Note that XEN_UNPOPULATED_ALLOC depends on ZONE_DEVICE which pulls in
MEMORY_HOTPLUG.

Leave the check added to __set_phys_to_machine and the adjusted
comment about EXTRA_MEM_RATIO.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
---
Changes since v1:
 - Expand commit message.
 - Do not revert code comment.
---
 arch/x86/include/asm/xen/page.h | 12 ------------
 arch/x86/xen/p2m.c              |  3 ---
 arch/x86/xen/setup.c            | 16 ++++++++++++++--
 3 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/xen/page.h b/arch/x86/include/asm/xen/page.h
index 7068e4bb057d..1a162e559753 100644
--- a/arch/x86/include/asm/xen/page.h
+++ b/arch/x86/include/asm/xen/page.h
@@ -86,18 +86,6 @@ clear_foreign_p2m_mapping(struct gnttab_unmap_grant_ref *unmap_ops,
 }
 #endif
 
-/*
- * The maximum amount of extra memory compared to the base size.  The
- * main scaling factor is the size of struct page.  At extreme ratios
- * of base:extra, all the base memory can be filled with page
- * structures for the extra memory, leaving no space for anything
- * else.
- *
- * 10x seems like a reasonable balance between scaling flexibility and
- * leaving a practically usable system.
- */
-#define XEN_EXTRA_MEM_RATIO	(10)
-
 /*
  * Helper functions to write or read unsigned long values to/from
  * memory, when the access may fault.
diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
index a33902d05e45..ac06ca32e9ef 100644
--- a/arch/x86/xen/p2m.c
+++ b/arch/x86/xen/p2m.c
@@ -416,9 +416,6 @@ void __init xen_vmalloc_p2m_tree(void)
 	xen_p2m_last_pfn = xen_max_p2m_pfn;
 
 	p2m_limit = (phys_addr_t)P2M_LIMIT * 1024 * 1024 * 1024 / PAGE_SIZE;
-	if (!p2m_limit && IS_ENABLED(CONFIG_XEN_UNPOPULATED_ALLOC))
-		p2m_limit = xen_start_info->nr_pages * XEN_EXTRA_MEM_RATIO;
-
 	vm.flags = VM_ALLOC;
 	vm.size = ALIGN(sizeof(unsigned long) * max(xen_max_p2m_pfn, p2m_limit),
 			PMD_SIZE * PMDS_PER_MID_PAGE);
diff --git a/arch/x86/xen/setup.c b/arch/x86/xen/setup.c
index 1a3b75652fa4..99ef476dc702 100644
--- a/arch/x86/xen/setup.c
+++ b/arch/x86/xen/setup.c
@@ -59,6 +59,18 @@ static struct {
 } xen_remap_buf __initdata __aligned(PAGE_SIZE);
 static unsigned long xen_remap_mfn __initdata = INVALID_P2M_ENTRY;
 
+/* 
+ * The maximum amount of extra memory compared to the base size.  The
+ * main scaling factor is the size of struct page.  At extreme ratios
+ * of base:extra, all the base memory can be filled with page
+ * structures for the extra memory, leaving no space for anything
+ * else.
+ * 
+ * 10x seems like a reasonable balance between scaling flexibility and
+ * leaving a practically usable system.
+ */
+#define EXTRA_MEM_RATIO		(10)
+
 static bool xen_512gb_limit __initdata = IS_ENABLED(CONFIG_XEN_512GB);
 
 static void __init xen_parse_512gb(void)
@@ -778,13 +790,13 @@ char * __init xen_memory_setup(void)
 		extra_pages += max_pages - max_pfn;
 
 	/*
-	 * Clamp the amount of extra memory to a XEN_EXTRA_MEM_RATIO
+	 * Clamp the amount of extra memory to a EXTRA_MEM_RATIO
 	 * factor the base size.
 	 *
 	 * Make sure we have no memory above max_pages, as this area
 	 * isn't handled by the p2m management.
 	 */
-	extra_pages = min3(XEN_EXTRA_MEM_RATIO * min(max_pfn, PFN_DOWN(MAXMEM)),
+	extra_pages = min3(EXTRA_MEM_RATIO * min(max_pfn, PFN_DOWN(MAXMEM)),
 			   extra_pages, max_pages - max_pfn);
 	i = 0;
 	addr = xen_e820_table.entries[0].addr;
-- 
2.30.1


