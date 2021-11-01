Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC3A441F61
	for <lists+xen-devel@lfdr.de>; Mon,  1 Nov 2021 18:34:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219371.380139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhbBB-0005Ye-RY; Mon, 01 Nov 2021 17:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219371.380139; Mon, 01 Nov 2021 17:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhbBB-0005W3-Nq; Mon, 01 Nov 2021 17:33:05 +0000
Received: by outflank-mailman (input) for mailman id 219371;
 Mon, 01 Nov 2021 17:33:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=37jG=PU=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mhbBA-0005Vx-G2
 for xen-devel@lists.xenproject.org; Mon, 01 Nov 2021 17:33:04 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0ffd0c70-43c0-4444-8c1f-294c8b65ead9;
 Mon, 01 Nov 2021 17:33:03 +0000 (UTC)
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
X-Inumbo-ID: 0ffd0c70-43c0-4444-8c1f-294c8b65ead9
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1635787983;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xkeh4Qdp+K8ptpykCeES9ZG4jDBim3zFPrAA50YSgAg=;
  b=LWYkFtb0It/8N8YOJoRVOO+YW3E5llxLNx9MprMffS9dlHMTv6e0hEmg
   X5qUzJ95zLEYRMe10Iugr2biHpFNERZzmCgxrQuJ6e8Ql8W+RVMl3VEUc
   70X6dbKrsvgSZAfE9+PgD6dDec1bOlQzmFY9mCuHz/OBHRBC2gnKqJXEk
   w=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: p7lf8pNpUMIq2K4s8hOjgEPUabWH55HxxDzKp+q3MX8id4GGmOciEbpOyOOuIbK/ZTid5lthqZ
 dmD95R35LATI6yze8Vcu1z2so8ILiUd+n5szFLAtb+XKvWN6SktyVxrjJiP8l+BlX3iPrHnGE6
 RbLOXxfipzm1rtuk8iy1tIHJ75eIK7bgtAgtHYkyKu3SHUki6Y2hjBtYh1WSAlSKhTAsT9Ttbo
 378CXRJpnsk4Oq9rDbog9FMgbKWljI8QLECTwTMGH4fvj1lBYXAtNt/82YzCbSehc0xglahi3y
 1xfLbUu2SRb6JruATy0fTGwt
X-SBRS: 5.1
X-MesageID: 57201173
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:D37Zja4UfBOpFzFORRtcjwxRtNzAchMFZxGqfqrLsTDasY5as4F+v
 mFLWDuAPP2NNGeneI8gPo+08hkDucfTzYdhSwBoqi00Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdg2tcw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z1
 flkrc2RcjUVIvectrwYS1p6AgByMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALBc/nJo4A/FpnyinUF60OSpHfWaTao9Rf2V/cg+gTQqyGP
 pNGMlKDajzKaSwfI3gVVqtlt+mwolbxVj1KjEKs8P9fD2/7k1UqjemF3MDuUt2VR+1Fk0CAv
 GXE8m/lRBYAO7S32TeDt36hmOLLtSf6Q54JUq218OZwh1+ezXBVDwcZPXOZi/Skjk+1W/pEN
 lcZvCEpqMAPGFeDF4enGUfi+Tjd40BaC4E4//AGBB+l14b9+1e4PVo4UmQRRoQjrIwUVB0m2
 Qrc9z/2PgBHvLqQQHOb076bqzKuJCQYRVM/iT84oRgtuIe6/txq5v7bZpM6SfPu0IWpcd3l6
 2nS9HBWulkFsSIcO0xXF3jjiinkmJXGRxVdCu7/DjP8tVMRiGJIiuWVBbnnARRocd7xorqp5
 iFsdy2iAAcmVsnlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkyb5lcJGKzM
 B6P6Gu9AaO/2lPwN8ebhKrqU6wXIVXIT4y5Bpg4kPIXOvCdizNrDAkxPBXNjggBYWAnkL0lO
 IfzTCpfJS1yNEiT9xLvH711+eZynkgWnDqPLbimn0XP+efPPxa9FOZaWGZim8hktctoVi2Oq
 I0BXyZLoj0CONDDjt7/qNVOcAtVcSBjbX00wuQOHtO+zsNdMDhJI9fawK87epwjmKJQl+zS+
 Wq6VFMew1367UAr4y3QApy6QL+wD5t5s1whOikgYQSh13Q5ON7956YDbZonO7Ig8bU7n/JzS
 vAEfeSGA+hOFWubq2hMM8GlodwwbgmviCKPIzGhPGo1cal/SlGb4dTjZAbuqnUDV3Llqcskr
 rS8/QrHWp5fFR96BcPbZav3nVO8tHQQgsxoWE7MLoUBcUng6tEyeSfwkuU2M4cHLhCanmmW0
 AOfABE5o+jRotBqrImV1P7c94rwSrlwBEtXGWXf/I2aDyiC8zrx25JEXcaJYSvZCDH+9pK9a
 LgH1Pr7KvAGwgpH6tIuD7ZxwKsizNLzvLsGnB98FXDGYln3WLNtJn6KgZtGuqFXn+ILvAK3X
 gSE+8VAOKXPM8TgSQZDKA0gZ+WF9PcVhjiNsqhlfBSkvHd6rOidTEFfHxiQkygMfrJ6PbQsz
 folpMNLuRe0jQAnM4regy1Zn4hWwqfsj0nzWkkmPbLW
IronPort-HdrOrdr: A9a23:ksqn5ar/QPhs9RIwixcZl7kaV5u7L9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBfhHO1OkPYs1NCZLXXbUQqTXfxfBO7ZrQEIdBeOjtK1uZ
 0QFZSWTeeAd2SS7vyKkDVQcexQueVvmZrA7Yy1rwYPPHJXguNbnmBE426gYzxLrWJ9dPgE/f
 Snl696TnabCA8qhpPRPAh6YwGPnayHqLvWJTo9QzI34giHij2lrJb8Dhijxx8bFxdC260r/2
 TpmxHwovzLiYD19jbsk0voq7hGktrozdVOQOSKl8guMz3pziKlfp5oVbGutC085Muv9FEput
 /RpApIBbU+11rhOkWO5Tf90Qjp1zgjr1fk1F+jmHPm5ff0QTorYvAxzb5xQ1/80Q4Nrdt82K
 VE0yayrJxMFy7Nmyz7+pzhSwxqvlDcmwtjrccjy1hkFacOYr5YqoISuGlPFo0bIS784Ic7VM
 FzEcDn4upMe1/yVQGZgoBW+q3vYp0PJGbCfqBb0fbllwS+3UoJgXfw/fZv3Uvpr/kGOt55D+
 etCNUgqFgBdL5RUUtHPpZ1fSKAMB26ffv9ChPhHb3ZLtByB5vske+93Fxn3pDhRHQ3pKFC76
 gpFmko7FIPRw==
X-IronPort-AV: E=Sophos;i="5.87,200,1631592000"; 
   d="scan'208";a="57201173"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0dMTHg/YV3GIDggUJTT43EVMizI6t7f8rexn0HyrL3LHJogh0gKxmT6HbKfFZ8jvZDy+WdF/JvUXPwLWFtZaHIcQ2ExvCzCU1W76uy5aoXZgYABOnym7QXxiiJ+e5FuP1E3Wn989F0gMbfbP4rgQZpP3f1TSJIAN4umZQoJufxUtvo+RMP4vlNiYJazOyPWHG3i/db32IJD3SNtlPQCMiJh/Ybh6ylSda9m1Y9UUEDsoge7w7qTTTBjVQVIqFnnDsZeJrVCMHcF/wGc5j7buBKkgT3CpZxrUFHUVexCvVjF6HxuXAeAZDW35owEULhjmHQglLOyOpK0wmUaQAbxIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xkeh4Qdp+K8ptpykCeES9ZG4jDBim3zFPrAA50YSgAg=;
 b=Qq2sRO1XvoPiJ/CiC6C9MEYooLr1rykoJZMzoIn9k8hotZ/WVXohX1G+PfkdSTxXdirFSeS1JTdgo6c8ySWDhThlfkKo5//StDJFyP3HKwQEsH5jtA/w2URA3UuLmP48mOihIWIaVW9F9qREg94qiP2RoPXosXF9cPsQ99CfxV+wjTs12q7hDzQfheW/dpwsRD2GAokv8oz2aZGXv5yNpvWtgvNQppTPrwT/dtPbAeXf+HteIzjDzV8hAlJ9Jk3t+6EOPzdKcr6FtkYOztQVLUYQ2QF5FCNa3gnnleOHQnpxYFEqvy0/R3Fd73q8jOKsKE/4qh93UpTLW2fSROL4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkeh4Qdp+K8ptpykCeES9ZG4jDBim3zFPrAA50YSgAg=;
 b=RAkLxHt1ShnTKd3DyXfNjwJcAxm7uyb2ol7ZQhAb5Us1LCST30gC+AB2O3Bn87q+oi4fRYwwC9rdEWnC+pTGiGsSavKtqsP5VgUfV2Gz5BwUp5td0MSm8GdXYoALdYCP0dXArBjSNxrNUNKhkRIJOor1k5XvGnoMO89uGOC5eeY=
Subject: Re: [PATCH] x86/kexec: Fix crash on transition to a 32bit kernel on
 AMD hardware
To: Ian Jackson <iwj@xenproject.org>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20211028232658.20637-1-andrew.cooper3@citrix.com>
 <24959.50965.967784.441954@mariner.uk.xensource.com>
 <0ab2bad5-ad32-06e1-755c-c4fe5cb2bdd3@citrix.com>
 <24959.55804.160431.406023@mariner.uk.xensource.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <1325ff93-5b05-3660-7850-d497b6b9ee23@citrix.com>
Date: Mon, 1 Nov 2021 17:32:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <24959.55804.160431.406023@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0225.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 10d6a1dd-f424-47de-9fe5-08d99d5da5f5
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5437:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB5437EAF32C95A5997C436CD2BA8A9@SJ0PR03MB5437.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZxjEPtNFvW8t8UQMEyiKXu9VaihvS/d6+c/Rrrg4Tkh2xlQdCsh2L0RbiacnMuJay3mmi4BIv9iw8vVtTGcIcpy8ndsFHxOpKnJu0ES1oXQhrA75RD7vnsDqJOxoRXu3bWE5GbFBK0P+LjbqeW9lGC5KttCD4CxBnnhumYk9KP1SiZiqAg9TqwJoOKOmPZDx0hLJaiqO5OLtoEE87AiHKHVkt/iJ12FZ/UHQaYG3oCDapXP0kVa7wBxGwU2CMtff07+9CARefAIBXkJ6ipXHBO8IwoTq1o//Ru8Lp13cWSSYyrhoIDS4upSLc5LoUWT2wPX7JV7jgyIMoXD/fLRwjwpmisyts167W7NGDevLjgBOPOYWpN9uVdrcpc9YhFxoRzRCXNHoAqejxXlo9vK6HDFOgEqqhyRwSGjx5MtK3WJcH7GMK1SgA5CzX46Oqc14NTbiRT2IzxD2YCXTKbID5ZNWznzHLB2Mib7umilmXK8RbMSyBnxBPS3WD1jm+hlnvw9xxQbIa1CWefCJ+QUVtC22ZWbTHQgZkMUTteDQzHj3YhYmSMyrgp+4FS7wwDfm9IlSt9X7B25yx4Lc+N0pB46Z8beeqmEPF9IqIiiWWx/fuSaYaAGUYu9MoTGFhoKb1GxkPP6/hgGhpQUkpXa1+bxSB/uKXLzmtsTv16ksAYE9V8Ou+It//ZvEMpYCQJqI89ZPOz5i0ZzPkIONnZI/4R/alpUlOJL92k6WkNEXKGA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(26005)(38100700002)(86362001)(53546011)(83380400001)(36756003)(107886003)(956004)(5660300002)(186003)(6666004)(508600001)(6486002)(31696002)(8676002)(2616005)(4744005)(4326008)(82960400001)(2906002)(16576012)(54906003)(316002)(6916009)(31686004)(66946007)(66556008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmxleDhwbThVaFdnbWhEZGxldkFUTEI5SldNR2NCNDR5YTlBZGVzL3dKcThE?=
 =?utf-8?B?ZGJha0xEUGVNa1BObHNaOFpGWnNKd1NmNnRKQnBoSnB3RFZsSEVyZ2NJWHZy?=
 =?utf-8?B?eDUxcDE0akFIb3AyU3NEUnV6SlZMcHB4djlnVG5PZ1EwdVMyTFVpZFB2MGlC?=
 =?utf-8?B?eGt3bDlvQ05ubmRUL3UzaE1Ub0FBOUs5ZnQ2dSs2eXA1YVpob3cwaS9YcXBN?=
 =?utf-8?B?YzVvZEtOM0htbGN6d1B6a3p3eHphYkF3NXRLdS9GTkY3SHB2N2g3L29LSWZZ?=
 =?utf-8?B?bVhXZ2lmQW5DaTlHcUVEOHFuMzJuOStXMTRUNEpSMmpQNWhYbUZsbk1tVnkr?=
 =?utf-8?B?bkYzazdweG0vRDM4SlhGNzZDNEFsblExb2xsMS9McmltSHpwQTNDeHJvbVd2?=
 =?utf-8?B?cHI2b0gzc1R4MXJnL0pNb2NVNTVZVjY1RFpPajFjY3A5QjBselp6QlZYcWht?=
 =?utf-8?B?bllKQWR5VzA0K0orYkRLcDdLSk5oUG1iUURVMlArYzZWQnhqN204OUhXUms5?=
 =?utf-8?B?d3ZwUU9MaFF4bmE0bUNHdjVHM0I1TUpwazMzZ1RibmUwb2FPRExUdFJkRGps?=
 =?utf-8?B?QkFQWTZ5Y0lySUsxR0ZVbVhHc1lmT01aQnNBaUVhUFZTWU1uYm9xRDB1Zzl2?=
 =?utf-8?B?YnQ1RFB1ZVpPanRKeWYrQU5vMXZMK2tzZ1d1NDV6bVFBYXQvYVlnYjZBTnd6?=
 =?utf-8?B?bHFZV09Vd0ppSDdjMDV0RlBMN0RQRG1ENjh0OHRaZjBPcTJWS3N2VnlNVWV3?=
 =?utf-8?B?S1IybWY1SW1TOG5KZmhjTnFDc3BzbFFuQXJLYkFOcFJ5WjVjTlZkWFl0Z01k?=
 =?utf-8?B?WlZZTmtSTzdpN1A2TWQwSVpwMWszdTZBTDEvT3hzS3NUNzdlTzhYZzl4RWM4?=
 =?utf-8?B?bjZMRFFDemFXTzU4c0M2QU9ROHJwdy9RZEhlbXIvMytyQXZBYkZlZ25ZRFQw?=
 =?utf-8?B?THB5ZTJPS1F1UmhNWkU4MFZDWjZLNnRaSHNhdlB0Q21idWpDZzdxM1FOS3Zm?=
 =?utf-8?B?SFRkSzA2ZWtBcW0zd3hEdWRPcnZWRC9ySDZiajZKR1NVRnF2aWc1VEh4Sk9O?=
 =?utf-8?B?cjRYei9DWGhubnZ5Z1ZlVTd6K0hJdlVnOTJhVXVscXlRTVBTc1E0WDdOSTQw?=
 =?utf-8?B?Znh4NG90aVNjUy9JMENQMjZPVFdBbUpTMFNBR3F3L0l2UWlUaVJOejlWUE54?=
 =?utf-8?B?SmRqWGU4TlpqWWU3b2xjZkxlemR5Q1VhNTZCNkhPbUI4WUppc1k4aUhiT2hi?=
 =?utf-8?B?RU9tNndzbUdWZEg4SXpyWDg0UVRXZkJRS0RYOVJQOTZlOEN4RDMrMEM2KzZZ?=
 =?utf-8?B?T0UwWVROUU5zS1l1RkkwL2swQ2daM1BLSmordDZZa0E1ZlErVHFxRmJJVVNY?=
 =?utf-8?B?VDFTQW4yZGlvdFl1R2lGbWRVcWczaTdNQTFXTXEvUEo0YzlZUlNGYzhURE5z?=
 =?utf-8?B?QVJmcTJtSGJYa1FoamJwdnZhZXdyUnVWOTNhR3RDUVk5SmF6TkVLajQ5TVQy?=
 =?utf-8?B?ejd1ay9iRkEzbW5XUlRkQ0YzSjIvenh2OXlUbTV2b3JVajc0UEVPTTNIbjFT?=
 =?utf-8?B?eW5rYzVJQ3BQbkh5Y2xIK3c5UDJldUhwakdmaVBycXhrQnZwM1BXN3pYSDMx?=
 =?utf-8?B?VnIyYmVRYVhrOTg5TXgxcitrNitNMGt3RWNTTFV0elBlVk5XUU9YbVdXeFBs?=
 =?utf-8?B?NFJuWGs5UUMybkpuU2FDSGZPSTRFdkR1WTJuMytHUWNBbVc2VHRPME9wdXVW?=
 =?utf-8?B?c0FLRWV2OXgyVFhVbGlva3JXNDZTemRTQUNWZUVCZmdGbEI5UytHbG5mdzdP?=
 =?utf-8?B?YTlNZ3pnWUQyS3YzTEVpUllTcE42WUROWHV4UnEyaVZJT29WcWpLMHV3dEtT?=
 =?utf-8?B?OEtDN09LVThReDlGNmo1clFtd0lnakpqRXR6NzNoa0pzQ1ZCODVuOXNsdTVs?=
 =?utf-8?B?dC8rVXVtNzN5TUpUM1VIYnpiMmphY0c5blBKUkQwb3dzeVFwN2Q1Q3VxRGUv?=
 =?utf-8?B?eDlCRlVRZklJVUF4Nk9kYUM1YlVSdy8vTFh6YnZleG9lMDVrZ1hIbWRrMEd4?=
 =?utf-8?B?UTlBazIwQkVSUVV2YUl3NFB6bGJaQml0MkhGeFpnRm1IdEtOemlJMHMvQStE?=
 =?utf-8?B?YVJrZ1AzT0N1ZEJaNHNraTBzTElqUWhCVkorQUZTOEZ6SGJiMFMrU0xXSUlK?=
 =?utf-8?B?U1dqVUgvazdCM2trNTBiRjIrTXBVWnlYWG5wU0R6V2o5VjJrV3RnWklTM3Bv?=
 =?utf-8?B?M2xmdWJqenpiZHhSL3BmOHpDaTR3PT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10d6a1dd-f424-47de-9fe5-08d99d5da5f5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 17:32:59.3971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45KsSuTcyWr8kM2JD2xtTDljaPj9DJrWtkpMvwPmdcLMHsrqhTw4ZZv5UckYbAo9ZBohb2LpeYoZtFzWBg8PHnn9XR1oaO0E8bbaTScQSNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5437
X-OriginatorOrg: citrix.com

On 01/11/2021 12:13, Ian Jackson wrote:
> Andrew Cooper writes ("Re: [PATCH] x86/kexec: Fix crash on transition to a 32bit kernel on AMD hardware"):
>> This path is only taken for a 32bit crash kernel.  It is not taken for
>> 64bit crash kernels, or they wouldn't work on AMD either, and this is
>> something we test routinely in XenServer.
>>
>> The worst that can happen is that I've messed the lretq pattern up, and
>> broken transition to all 32bit crash kernels, irrespective of hardware
>> vendor.
>>
>> It will either function correctly, or explode.  If it is broken, it
>> won't be subtle, or dependent on the phase of the moon/etc.
> Thanks for this confirmation.
>
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>

Thanks.

Unfortunately, I've made a blunder here.  The code as implemented is
broken on Intel, and works on AMD.  (I.e. I need to swap Intel and AMD
in the commit message).  Have done locally, but won't repost just for that.

~Andrew

