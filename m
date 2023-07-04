Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20714746F34
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 12:55:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558250.872168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGdgc-0006u6-WD; Tue, 04 Jul 2023 10:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558250.872168; Tue, 04 Jul 2023 10:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGdgc-0006ql-TI; Tue, 04 Jul 2023 10:55:10 +0000
Received: by outflank-mailman (input) for mailman id 558250;
 Tue, 04 Jul 2023 10:55:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bK4X=CW=citrix.com=prvs=5424eaebb=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qGdgb-0006qf-MX
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 10:55:09 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ce40c5d-1a59-11ee-b237-6b7b168915f2;
 Tue, 04 Jul 2023 12:55:08 +0200 (CEST)
Received: from mail-mw2nam10lp2101.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.101])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 04 Jul 2023 06:54:58 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by SJ0PR03MB6240.namprd03.prod.outlook.com (2603:10b6:a03:3ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 10:54:56 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::1c83:1877:a68b:8902%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 10:54:56 +0000
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
X-Inumbo-ID: 3ce40c5d-1a59-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1688468108;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=U3xep052cZDrscjGs+i6jbExtS2iISvL1OSaYUtxwoo=;
  b=QW5Qb5U1xhAjf+sOaS6rX0V3a7WrdBULC388MFQdF/l9b+gL5edCdwKz
   v/NtVMl3CIRd2lV0SuBM+9cUegjy/wZQwCvXRVcdtYjzZL75J1mC2TBEL
   TgvX9MA03DEj5o3faiCR8kSJae4Xinb9qK4cLrGiGkHu6lmeOvHJA5VdO
   A=;
X-IronPort-RemoteIP: 104.47.55.101
X-IronPort-MID: 117666314
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:LUe3MKIdrVsrgb+oFE+R95QlxSXFcZb7ZxGr2PjKsXjdYENS32YHm
 DcdWzjSPPmONDTyL4wjPY2ypBkBu5HRnIA3TQtlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA4QRiPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5nWFNq/
 N4/CwwgSTqEg+y/nY2qePBV05FLwMnDZOvzu1lG5BSAVbMDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dqpTGLlWSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv12bGRw3iiBOr+EpWCxvM0vQaty1UdUho0BEeG/Pzjo0iHDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ul7Cmdx6yS5ByWbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8kN+pES0cLGtHYDBeSwIAuoHnuNtq1kuJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:Maai6KuI6hdekNV6MBOJ126t7skDU9V00zEX/kB9WHVpm62j9/
 xG+c5x6faaslgssR0b6LW90cq7Lk80l6QV3WB5B97LNmSLhILPFvAa0WKL+UyGJ8TQzJ8+6U
 4KSdkbNDSfNykBse/KpCW+DtY80J2m3cmT9JrjJzwEd3ANV0ga1XYbNu9DKDwPeOCRP+tDKK
 ah
X-Talos-CUID: 9a23:H7Ch5GOls35a9+5DSHBV0Ec2PeMZX1r3y3PeKhKHGFRwcejA
X-Talos-MUID: 9a23:Rj/ICgptzlAXmEJHsVoezwtSOZlVuJqjMU5XlrdXp/TZMHZZPQ7I2Q==
X-IronPort-AV: E=Sophos;i="6.01,180,1684814400"; 
   d="scan'208";a="117666314"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mx4AP+2zc3UQKuNfSc0ietpH/xLeLDUBatiVZT4EHWaiFlaPvxC37jQ+GaCYB5z27GcN/bABe7Z7JFGI8NMaJzT7X1ogThzZFcejFEFEX1mesEFbHqmbHlJhMeQUDBbe6zg1N86e7Q/Fzj6i3NGTAlSjf/9Op4eYt9/zdaXB4Mk2ilRR8OV0F/2D51Vx1LkictGW4AgmUdhNuVGaPdY33M8WLuhSpUofqjat8QLsfGGfjeWinYcZYeCLugaudGpxlICQgXej/CrHHQzpwXKuuylq/b76MUpZnfkXXSYoxwB0fEV5ypjDq5CzsKSx0kIOP+Rv7IWowSNh8gV2xzatMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wfCVpSC+fn+ZuRimJA0iZdnw9KK8inwYWaNoCTxnk80=;
 b=PAjP/CEMiqIXFc4jX6L3FkEqTNXoaZPBAxaKc2JolOaaC6K2LYg7+kXnqI9dlNAoQ085/X/ONBt6H3zCuYLI+eV8S4xT0tTNckYaorAnXeTVun7einGHTSipF1A48mjygY8cQZ2FDqiq+s9kU7WxLTppeDq/1UBil8/a4wjHy76IvrCvfnYQXXWG3OhCBVYJqqnrYp2Lja6pU8Z8ZE7mxnYrqoaWOEQpsuuLKMHoR8vR6UXc5ov8p2Y8I/Kzof7o8dD2hlobkZDLnkN+NX6Rcbjc5cvocbiIx5gT6//KnSQceCGvcJHYfSHkQLL+TaYl8UCivNkiIUES1yddMg3GMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wfCVpSC+fn+ZuRimJA0iZdnw9KK8inwYWaNoCTxnk80=;
 b=w1bxkR3gkhrG89D+gmJN3LmKjZFN77j0sCx5/hbYwwUaXOT12MWSeE5E7hq1ElKNV4iPjzcDvsszH/SbFyS5My9V3X1oR27nAdogehuBy4Ak56xjJLjC7eRMkWodjSkpF2H6Kq2qX87DJKK4sCN0IsIQ+vk3ilHtaF+Fg05qx3w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 4 Jul 2023 12:54:50 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 1/3] multiboot2: parse vga= option when setting GOP
 mode
Message-ID: <ZKP6ekRI0jChJKM3@MacBook-Air-de-Roger.local>
References: <20230601130518.48874-1-roger.pau@citrix.com>
 <20230601130518.48874-2-roger.pau@citrix.com>
 <2e194ebe-f8e8-128a-0ad6-227f8a9be976@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2e194ebe-f8e8-128a-0ad6-227f8a9be976@suse.com>
X-ClientProxiedBy: LO4P123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::12) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|SJ0PR03MB6240:EE_
X-MS-Office365-Filtering-Correlation-Id: 178f528a-a823-4da1-3c92-08db7c7d19fd
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mn9RMSpY+VQ/H79LePtqX3XQ9a61oq6X1LzzxN6V5uQK/bAbSga9Fna8guSkmvkT8CKCB057jU4GnW6dE0ts8DAHAp69tCVjH0WV4P1vCj90y8ZFE6B6a1VZkWKN/UVJRLT9vzJfK7zPzdVuyi5Q34ENEMzVJLQmugccyuckV7Srpmd59jB3qoTjxv8+7SrzWdHpSDSr7zppJ9RjqK7c94QGnZHtN0KcO84QJAQAaEmSPJmChIk/PI6yjgkhUaZJT9xdxQbz9UQuXDFmyD9Jta5qIiSydqaxqX5e4LGkPzSIcZQwEfcLfaYXMXRo7R2yZ+ltJiu8YKK/RGpdmh8azVDxdhk9LRJMzx9OIRYDyWQwLD8WJq0HMfbu17fUpMbiYg4q2AgiaDahwN0KgzYat2IJgO8VW50pUCERaY8RKc/SpvuCKl2N8U+pg1NPWwUo9gkUk+fwVDDTuDKY/A4z+a2JZa/HaPBNg1cKzgJp9j0y7VkK3l05V6fPwFe3Aj2Ei/e7dTu69egVeUPDLvj3cEeTh7dLpjRV9OSqxj6ZTkrEA0KrZ6HX+riqfA861QgM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(136003)(39860400002)(346002)(376002)(451199021)(2906002)(41300700001)(5660300002)(8676002)(8936002)(85182001)(86362001)(186003)(478600001)(82960400001)(26005)(6506007)(6512007)(9686003)(6666004)(53546011)(6486002)(316002)(6916009)(4326008)(66556008)(66946007)(38100700002)(54906003)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0MrczV6NDdFZHNqSG42dmZlWC9HY3kzWldlai9Oend0RWRTa3hlWSt5L0dC?=
 =?utf-8?B?M2tFTzA5bE9KWWFvdDZ1Nld0MWRyeVJBSzhzL2tCMWtSODFWbnVvb2c0bHJV?=
 =?utf-8?B?R081b0J2SmZFTWd2UTNOM3FCTm5SZXF0QVNUWjhxbGxzVzVJUzJzZTBSZHVo?=
 =?utf-8?B?ZGlOamtSWUljUUw0WlV5dkFJQ1R6d0VJZUVER0RmT3Vic3RpZ2xnd0hhNVJD?=
 =?utf-8?B?TFdZWEtxRjRMenFFWGtKZ1o0UjVjWnJMeEpOcTkxRDJzbkRkRjMzckMwQVJG?=
 =?utf-8?B?cW9KTGJBdEhHbmlZaWYzQWNvaFlQWUNSOEpVM3NnVkVGVzUzZ1RMb09nVWJx?=
 =?utf-8?B?T1drcis1WEVPRHN6T1BTRjNjd3c0bGU2NEhMUlN2WjUrODdVTm9qSmt2VFpy?=
 =?utf-8?B?eTVsb3o2bWtJMW4wZW1pN0ozNFowM1lBMXcyVzZOMTZmaFJqTzNxQ0R6RjJY?=
 =?utf-8?B?c25GM3Z2TnE2UWY0amxGWVFhM2w5YUtocVRmWVIreS9MeVdGcit0b3dVUzZh?=
 =?utf-8?B?dXpHelg2d3daUlA1VFl2cFk2T1dpK2lJWVZrMUtIaXRmVS81QlB2aHlHVmlJ?=
 =?utf-8?B?em0xZzU1aVd2bFJ2UHRmclBUalgyZncvdWhjRk9xTzBPTUtSOEFHUW5QV2Mz?=
 =?utf-8?B?M0RWZENpeFc4TXBTMHVDQmVsNmdnaDhJZGtwR2RSMng2UlJsSUlMOWtVS1hD?=
 =?utf-8?B?WjEwQTFDWEJYZVVLYzhSTDlUZFdWeTFXeWJBT1BKVGpMNlBhdWVGT0JicFhV?=
 =?utf-8?B?ankvNkh4eWdQVUFaTDlUSjd5YkMxZFc4ckM1U0hQbDR2VkZGZ015QkJUdWNS?=
 =?utf-8?B?MkhBSVRZR2tqTDYxd09FYlZSR09vVDRiTjFOL0VRTjZOei9vODVEeU90eW5X?=
 =?utf-8?B?Um1raDNKbkpVYWh0cHlVNVB2SWozcGhKSEpuaEE0eFBLTlAvT2JWZ1kzVzJW?=
 =?utf-8?B?T01jWWVSQVRiWlV4Y090bldEa2RlOVAvTnFaaTZBdUlMMlNTMXNRSXVWM2xi?=
 =?utf-8?B?eHIwNkNRUUpHYkN1WXVodHlHMzJ3ZzNHRXVsS0ZMemptSGRnRkJBTGlwdGxk?=
 =?utf-8?B?KzFKcVd5T2l1UWVuVkFuY0pWNWFqYTJGd1JCZUYrOHdRR0pWb0RmS0pidlVY?=
 =?utf-8?B?UDRuL0FiekhRamhjSzVsOVRLeU40cWFhMmVJUGNZUTN4RGFvTTdhZ3N6R2Zq?=
 =?utf-8?B?eGF0MnMyRTJNYjRDSkVmN25EaEEwWi83SXJ6ci8vYU9XOW41Nkt1b1QyZUpt?=
 =?utf-8?B?QkMrSlJPam5hc3BCRFh4b2JCczN1OXk0eHZpMXNKUWVDbVFsWHM4YitFQlFO?=
 =?utf-8?B?bVl1MElvUHAyNllrdFBic1d1am9lUjZDRDBEbGpuRmtQdW1ZWTFCN3ZSU2M3?=
 =?utf-8?B?bWpkUWRpQlhKMjh1WmxnUFZvSWZ5Q05RekhRMjNSb3FPNjhKN0hFUE5SSWhm?=
 =?utf-8?B?SEx4SWx4d1lVcnMrcG5VTUlpSGNYdzR2VXp5WWpoMXBab2tzNEZYK0x2R0hI?=
 =?utf-8?B?MnlKa1BsY0lQZDYzZDlaRlVId2doYmo2bFFwYWswcDlicFlBOHNXYzREMjJG?=
 =?utf-8?B?bjNXc3VBdGdMTnZoSEhoVUx3M2hLelMyZ0VDWDR0TmJ6UlZLR0I3Ny9YR01Y?=
 =?utf-8?B?K0dYR0R4cFRLWU91TXNZejU4M3gzSkxNdTZPa2NWV1dHZmljZUlXbVBsbjR2?=
 =?utf-8?B?QitjY2dxeXZ3NHc3TTcvVFBNTGZBNkVFN2FnbklaTGx5WTgzdnNtN0tBdE9s?=
 =?utf-8?B?WHdwbU8ra1JqZ1M4Y3VOd3pId2JKMGdFU0ZCWDNjOCsrTjk3Z1hWLzFicFl5?=
 =?utf-8?B?b25lZm51YndEMDVmVUJDMUg0V25YMHM2bVV5WGdxZkc1cUl0aytNSy8vWGE1?=
 =?utf-8?B?TzJrR0I5NTcrZVFuQmh0cVE4cHcvQ0ZxK0h2blJlTVNMc3YraDk1bml4NGw5?=
 =?utf-8?B?cWxkY2JJZzdxU3lQSGxuaHVKb0pCK1pXS1ZMaDh4REh3cXVrTVdWRU9CZ3FW?=
 =?utf-8?B?VGxJR20wMjNpUk9yalBoY3I3VjA1amJzWWhQVDhMM0s0TS9aU3JUV2ljcTA0?=
 =?utf-8?B?ZTZMbHFhbGduOXVWM0JHcUM0b1ozdEtLWnZvYmxpS2NaUlYyM2tWZCtmeUdH?=
 =?utf-8?B?ckcxT2JpbEJOcTdPZXdXMHorWjB2ZmU3a2dOa2YrQitLNmxvV2tiZm4vbitr?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	2YCXD2Zc4gBQoR0px0R0iTEJYTgzaqf2hY2sqxomQjK1d0zwH8hlLU59cnUPjsBv4roFfyR5vSF7eqanlTOLC6JmXa+uH3s9A1Ka+7NE0i0cD/kJfjaPi0O7Eht4GD5UYcFMNB4oC90WsX7VmUEj/ewQMVZUq6r+ca97RksFAULb5lW1cgChuksLWrFRB2NNHrASq2FcnzRXLkCcbwVykNIHY2qSTZgKWp7+ijCryWf3RK/280At6omQuuDPTlkzWnNG5m0rbajks3zXNXJUn1InozqAHFel2CwVXmyGapho+KHTrg3KMj/yI5ssoBdWtZGFfZUciql3zJcKCmCW9c6OoYD/Lf1SmJPGRWrHce+TEsVGGbWNe9n7rftERsQz70hVVUnjGMeCSModxIzvOR4aqP7gyPkcUbRmbMhg8zoWCfLLvxTyVVCtQrYjvP0RqZsNwQynO99zKIAVqC7cjkYuIOiThYR6lJcfX6QKrcmY4tMRf+q8qfVvZjdHzHicUkdBWpqrDfhuRNuBv19ZTg9p3kfOKkA6uUUWjd8yen+jGndz0HsVANbU7riIsTKYehXsolq5KQdK7qmyfMYkP3XH5Pw1OVw/5XUy7g1nlhV1z4vIYpzH2dVOKM9kJk8fsKK2KoGTIRyOVvqHgwoa9k0GBxqeewAbprqrObr38Qv2tVv5JD5unsXna6oMbFUxFx29QBSsXyE4JdwaTLq6X3ufmI6y9vlHyjDLmvb9oqc5xy1mXUTDNufkGme42jIGMHfHkD9O2nSllfp/zsX7LlghNMX9lcp+2KFphTstUASnkvZRrzBlkP59QlNuNxLK
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 178f528a-a823-4da1-3c92-08db7c7d19fd
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 10:54:56.0071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gtZ9kn0uL8Dq+s0905QXG2HjLS7nGgRqJyeAbqL99p3fEDZxAdyCcDKGq626cestfKJVnYZUrHGGDDTIF5nPRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6240

On Wed, Jun 07, 2023 at 11:41:24AM +0200, Jan Beulich wrote:
> On 01.06.2023 15:05, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/boot/head.S
> > +++ b/xen/arch/x86/boot/head.S
> > @@ -329,7 +337,8 @@ __efi64_mb2_start:
> >  
> >          /*
> >           * efi_multiboot2() is called according to System V AMD64 ABI:
> > -         *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable.
> > +         *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable,
> > +         *          %rdx - MB2 cmdline
> >           */
> >          call    efi_multiboot2
> 
> All you obtain is a pointer to the string, which is fine from what I
> was able to establish, but that's not entirely obvious: The MBI
> structure used has a size field, so it could have been that the
> string isn't nul-terminated, and hence the size would also need
> passing. May I ask that this be mentioned at least in the description?

Sure.  The multiboot2 specification already states that the string
must be zero terminated.  It's my understanding the size field is part
of all the tags, so that a parser can find the next tag even if it
doesn't know how to parse the current one.

> > --- a/xen/arch/x86/efi/efi-boot.h
> > +++ b/xen/arch/x86/efi/efi-boot.h
> > @@ -786,7 +786,30 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
> >  
> >  static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
> >  
> > -void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> > +/* Return the first occurrence of opt in cmd. */
> > +static const char __init *get_option(const char *cmd, const char *opt)
> > +{
> > +    const char *s = cmd, *o = NULL;
> > +
> > +    if ( !cmd || !opt )
> > +        return NULL;
> > +
> > +    while ( (s = strstr(s, opt)) != NULL )
> > +    {
> > +        if ( s == cmd || *(s - 1) == ' ' )
> 
> Iirc I had asked before: Not allowing for at least tab? (See
> cmdline.c:delim_chars_comma[] for what the non-EFI parsing permits,
> which in turn might be going a little too far especially with
> permitting comma as well.)

I've fixed this when parsing the gfx- option but not here, sorry.

> 
> > +        {
> > +            o = s + strlen(opt);
> 
> I don't think the comment ahead of the function describes this
> behavior, i.e. in particular the adding of the length of the
> option.

I've changed the comment to:

Return a pointer to the character after the first occurrence of opt in cmd.

Thanks, Roger.

