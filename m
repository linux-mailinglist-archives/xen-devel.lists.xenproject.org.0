Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 995CA5AF75B
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400417.642173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSt-00057l-TR; Tue, 06 Sep 2022 21:50:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400417.642173; Tue, 06 Sep 2022 21:50:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSt-00051k-An; Tue, 06 Sep 2022 21:50:39 +0000
Received: by outflank-mailman (input) for mailman id 400417;
 Tue, 06 Sep 2022 21:50:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M7yI=ZJ=citrix.com=prvs=2414a9d18=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1oVgI6-0000Cs-ET
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:39:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id da6a6b6b-2dee-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 16:19:03 +0200 (CEST)
Received: from mail-mw2nam04lp2176.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Sep 2022 10:18:53 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB5289.namprd03.prod.outlook.com (2603:10b6:5:24c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Tue, 6 Sep
 2022 14:18:51 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::b9c9:c866:817c:60dd%4]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 14:18:51 +0000
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
X-Inumbo-ID: da6a6b6b-2dee-11ed-af93-0125da4c0113
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1662473943;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=h33p7WuFVa8KR5uNEATucKr0vqD/jF7WN4N9ZgbkFzw=;
  b=XAJ/hm8QjQgx3n8Vwc4Tb2Qri/whr27s7EJbIXZYsx5DAuJie152Rea/
   BaHdICssmY33CjAmUpMJTSS2TAx0p1hnQbpb4+rV/odjvmrx/Y8M0Pju6
   cDKwKze+1T0My3E5CF5QT67NluGg07KzyRfIfn+urBHqNVR95ydbVfDvV
   4=;
X-IronPort-RemoteIP: 104.47.73.176
X-IronPort-MID: 79541581
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:lOwV2qsZPaLtP6jJHIAchoSVEOfnVGNfMUV32f8akzHdYApBsoF/q
 tZmKW2CafuCZDHxKI10Od6zpxsO7JeGzIcwTwU9qi89F38Q+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyj4G1A5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FY4W2dYpXDFSy
 eIBIQEsbhWliqWUxK3uH4GAhux7RCXqFKU2nyk8iBTmV7MhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9wnT/PVpi4TQ5FUZPLzFGdzZYNGVA+5SmV6Vv
 Dnu9GXlGBAKcteYzFJp91rz17KTxH6rAer+EpW1quRIgnnKl1ANCQ07U1zl+duFrkShDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Ul7Cmdx6yS5ByWbkAkQzhbeZoZvck5bTUw0
 xmCmNaBLSxitviZRGyQ8p+QrCiuIm4FIGkafygGQAAZpd75r+kOYgnnS99iFOuwkYfzEDSon
 zSS9nFh2fMUkNIB0Li98RbfmTWwq5PVTwkzoALKQmai6QA/b4mgD2C11WXmAT97BN7xZjG8U
 LIswKByMMhm4UmxqRGw
IronPort-HdrOrdr: A9a23:U/49xqOSfzJHqMBcT2L155DYdb4zR+YMi2TDiHoddfUFSKalfp
 6V98jzjSWE8wr4WBkb6LO90DHpewKQyXcH2/hqAV7EZnirhILIFvAp0WKG+VHd8kLFh4lgPM
 tbEpSWTeeAdWSS7vyKrzVQcexQpuVvmZrA7Yix854ud3ASV0gK1XYaNu/vKDwTeOAwP+tdKH
 Pz3Kp6jgvlXU5SQtWwB3EDUeSGjcbMjojabRkPAANiwBWSjBuzgYSKUiSw71M7aXdi0L0i+W
 /Kn0jS/aO4qcy2zRfayiv684lWot380dFObfb8yvT9aw+cyTpAVr4RHoFqjwpF5N1HL2xa1+
 Ukli1QffibLUmhOF1d7yGdgjUImwxelkMKgWXo/UcL5/aJCg7SQvAx+76wOHHimjUdlcA536
 RR022DsZ1LSRvGgSTm/tDNEwpnj0yuvBMZ4KcuZlFkIPwjgYVq3Poi1VIQFI1FEDPx6YghHu
 UrBMbA5OxOeVffa3zCpGFgzNGlQ3x2R369MwM/k93Q1yITkGFyzkMeysBalnAc9IglQ50B4+
 jfKKxnmLxHU8dTZ6NgA+UKR9exFwX2MFrxGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhN15c2kI
 SpaiItiYfzQTOaNSSj5uw6zvmWehTNYd3E8LAs27Fp/rvhWbHsLSqPDFgzjsrImYRsPvHm
X-IronPort-AV: E=Sophos;i="5.93,294,1654574400"; 
   d="scan'208";a="79541581"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VsTdL1ut+ZKIqBvEOA9e4m87TW0ALk1Gt2oPLTjj2ST2Cd/uPSxVIyqcaLY5rrlKdNOWq1tv0sqDUAztWqmDSe3sl2VywmsFz85cca3gAKVaZqsDDVJiGwBAcdBVec/dW7UoWyc1HQkRxkkDYTu+5jU0ZJS6ZHlwDUzNi+I79SVvDhOUmmHiVRtPyLzVx00ov++FPC/Ry9V8m8H6ysX1JBm9r6D6OXNowS/4jmgwe0VyN67Qr3Uq82YroNy0bkF71QyzoWcyMK716RBR5knW+rZOWCWuQ1LPo3OIYqVy9ge/lRk7dwGrTy5U+SF9YSvr3ccADdvSIFTlKdqjq1Ua6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h33p7WuFVa8KR5uNEATucKr0vqD/jF7WN4N9ZgbkFzw=;
 b=DN8mJgkUcg6q5ppLqtQVEZt1zfUvuK9JeNmlgrV6wWYUEtkZbSNgMLF1v7D4Ifde66uzZwdpHIsJlsIi2it2EJI5BjYZzwp/fbFztT0V15J67cA+nR0T3e9BXUpduGNjElf0fjroPb8CP25mVMvZD08TnqpTQnjqszP1U4kQ3PhUYz4D48KsG4tpSivBkLWt3orXIOlnyTnXJo0tNjJBcr3E/7Bv0UBj9SbB90DVpWrv/ejvcnCEpqy+4z3HqqEpUb165dQDiI4L+zTXbQVE6WDAknA3A2CBqRZ09mObdw8ogna3mdozkN8atqozJOKB+VMDy4GUQSiJhCCPTTD4Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h33p7WuFVa8KR5uNEATucKr0vqD/jF7WN4N9ZgbkFzw=;
 b=UcpOVhOIlEycR41oRSQrlAqWpGvFXEYrku2w0FKynVpNLq1kvYFvq77cQBxLfzniBSx7oaDJHJOPcdoJWR49LvQJVITZmO/oDX7T87QHRtfHNIV6GgV6e3ApxBi3s9PjYgiIiQbyVu2fnsCURXYIm3iGLWxEQd5oWmHkm4znW/c=
From: Andrew Cooper <Andrew.Cooper3@citrix.com>
To: Jennifer Herbert <jennifer.herbert@citrix.com>, "jbeulich@suse.com"
	<jbeulich@suse.com>, "wl@xen.org" <wl@xen.org>, Roger Pau Monne
	<roger.pau@citrix.com>, Henry Wang <Henry.Wang@arm.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [for-4.17 PATCH] acpi: Add TPM2 interface definition and make the
 TPM version configurable.
Thread-Topic: [for-4.17 PATCH] acpi: Add TPM2 interface definition and make
 the TPM version configurable.
Thread-Index: AQHYwfuWslla8fUdWk+aob/m3t7waQ==
Date: Tue, 6 Sep 2022 14:18:51 +0000
Message-ID: <0548fa97-5384-94e4-7329-b019e60555f4@citrix.com>
References: <20220830202706.1618386-1-jennifer.herbert@citrix.com>
In-Reply-To: <20220830202706.1618386-1-jennifer.herbert@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7d655b6a-0a19-4daa-a901-08da9012b911
x-ms-traffictypediagnostic: DM6PR03MB5289:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Zg4kNtD1TWFrZdkiua3gOq1Tl00hMnLJtTtXtTOZqpK3yQQxqJuXPnIFFkAz8RBGMfNr7Zj+4e2oCBLk3i3KsdcPvT8dlFP39BrMVhI4vh5VDEXnXG86JC6BqCCYxCmpaBI786Ckb9GjijvpHnHi3Lcg12wv7NCgDNnhR5YWYa8NGS4zD3xJgaI6zJlwejB8+MRIZwFFpeZPWaJxICzIANGxuNOiUtwifLsDYez7iFwJqfquf+9qIiMEfHxj2BlAUn8Rg8OKwU2qi2TcBii2m/3hvOH9hI4ZMiHzrqCsYzoR5MJBOsRoTQsSezXcy2i66tSnwPpKALrUZE0osAjZFp6Wf1pdVfRzTmaHAnxK6QDwKz3atei6RiKqvFWl+HNSbrosPShZQBd+sObjdIGH2G31F018t4LxjhKO+ZETYRlun92pkPBz8lkWtTM2RizVqyhXXpAbc3wTu9GfEgShEHfgATRRbxPkGU9pFkozmeL/9/D8P20BAnTj2+zOz6X9dOvM6U1n40W3POalW38V7qgIv+7iK1Uby7O+CljMgtsjc5VsNQOYt7uwrdanDzHubbiV+MtnNyftLqHfbcqK+FAJa19eOYH4iF6+JGI+PwmIiFtWUz2USvDomoVcJW8mGDJCpWMVQtkf9bkNnkmZor5t8yXIT1z6OhNN3A66/BA/5/41/PVimN962J33HuNp9V7IaDJZzxUTi1NnCuKpd+2W0yX8hPWAmhUkaoMqh8nRv5lBdYt9n5o54WmXNGFbrPsRYOUBAhm84oPSfn6MwFhJ8W2/Is3bMXHwFGmIC/Fu3L5IHpIaN2uys0tkjzikHkkDzC0z0DQYa3J6TBojEg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(71200400001)(6506007)(26005)(478600001)(6486002)(41300700001)(6512007)(186003)(83380400001)(53546011)(5660300002)(2906002)(8936002)(2616005)(110136005)(76116006)(66556008)(66446008)(66476007)(64756008)(91956017)(4326008)(66946007)(31696002)(8676002)(316002)(86362001)(38100700002)(31686004)(38070700005)(82960400001)(122000001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YU5mSkt6Q0tvc3Zmc2VjeGZEWko2Q0x0OVVkV2xrOHJZaTZZazhZcEdBK2Vo?=
 =?utf-8?B?NGJjZmRHd1RiVmNCcGRXVUNFaE54TDBFNzJoQm55VGJ1UmFWNDJreGl5Vm4w?=
 =?utf-8?B?YmFjWXNYcWg1R05LcnpYampBbzRqOGF4cnRXUUVnMjRiUndxWnNxWXBEMWF4?=
 =?utf-8?B?UGZKdkN1N0xvc0xZYjN0MXl6d2JDN2tnT2R0aTFkT0dHc1lkam5UZHU2UEMx?=
 =?utf-8?B?NndHa01Vd0ZISy9zbWhmUTJVcWpxR2t2Um1Vc1RMSXdLVytmcld0di9veTBy?=
 =?utf-8?B?M2llaWNWR28rSnVnL0s4Q3F6TjdHRGNwc0FZZTBmUzZySk5ELzRkWmZ6WGlQ?=
 =?utf-8?B?N0YreGVXRjNGaTJIKzRHd3FQZVpoVlQ3TTRyTHAwWmpGQ3Z2QjQ1WEVMKytR?=
 =?utf-8?B?c01Wa0dTdHVzbTh1dHBxK2llYzVtNk5ONXVwKzh5V1kyNmVxbzVCYnJ6TjB1?=
 =?utf-8?B?dWxXek9CSFg4NkZ3cWl4N1BoZ0NkTXB5M3NIdk1zZ2k2ME52alN3REJoejRL?=
 =?utf-8?B?bitFcU1KMUFvRTRpNk1lemdyemVscjZqbGEwT21oeVdrTm5tUUpkaEd4bUlW?=
 =?utf-8?B?VXdPdEc0ZTJib1AxcXhGbkdva1pLdVVSUGhxRmw2VnR5ZWNtRS9ISC85VDky?=
 =?utf-8?B?dnVCbWgxWUVaWUhNL01BVEl3bVc4bmlMY0lNT1JnOHVldXYya0l2b0kreUE0?=
 =?utf-8?B?aDluVkl4TncxSDZRSDZDR2F1aTF6QUNpQk5ZbkFzQWh1OEhRVGY2bHNvTTli?=
 =?utf-8?B?bFZHT2dqenJyejBBVmhCY2lhUWhoV2h2dENzYldiaTI4cHhFdmRpWmxwMGVw?=
 =?utf-8?B?OTVXRFdUU0pNUkRQU2Rra2NzM3RDZ3NMQXVKcXprcE9SV01pZVlLeUJWSmFp?=
 =?utf-8?B?blN6NUNndEhWdm9CclI1WURPbkNobTh2QUczajRXTXFQNWZJRjVJejFZVmVM?=
 =?utf-8?B?QS9sV015K0hQcEVreTBodzVtYkpKVTJQWStSQ0ZNYjZUMzB2dFNKRGx3OUd5?=
 =?utf-8?B?aGZWUmRkanFCWUFhZ0xBZ0VjbnpaVE54WGxKVDd2MFIrL0ZUZmJtOHpIZEJ6?=
 =?utf-8?B?WU8yeGpVaDZjTlRhdzJEaG15ajZaMW5lK0VnSkl4Wk55bzhrdmdIalFaZTJP?=
 =?utf-8?B?SlRPSDkyWlpNOFRhY0NVWHVSNFAxZ0tyc2c3M21vTzZFWS9tUy84NzdBZS9H?=
 =?utf-8?B?MHBJUmlhR2szM1ZTUnFXSTB2RHZDOWZvTnN4dGZqM1F0Ry9tUlo2cG9XWVZR?=
 =?utf-8?B?c3BhMHQ3WDZhVVBJbmtCdGk5MFRVVzlGSk5wTEUrOWtDTTJhU3oyVktKUWUr?=
 =?utf-8?B?WTJuVmQ2LzBITmpTa3dRZi9vdENZRnhFa0N3M1R4U0s5bjVvWnBTZUVnOG12?=
 =?utf-8?B?U2p1YXZKSDlJTzlpM1BjSUU3L1NHcGNyOGdyUWNmc1R6b1h3ZDExWktXb0Yx?=
 =?utf-8?B?QUUzOENIV3pIQzU1b0FmQmtRYm9uRDladnRIVDNmZGJuZk9VcWNjZlF2ZGxG?=
 =?utf-8?B?YXJtSFFyalh0VDdWU3dLTGVSRHIxMG1sTktkb2pkTlRXY01UWCt5azNyWnBl?=
 =?utf-8?B?eWJYZ1VsUVpFUzloYy9uVGNrRVhLcWNHS0NCZ1VTSldyVVZER2UyNmhDSFRq?=
 =?utf-8?B?ZGRFOWdCejB1eGJzL2lzRWxRT2YvV0pqRGROdGExTC83VVN0YWFlOVRJdXow?=
 =?utf-8?B?b2FUdE5sRmI0aWJNdmtqenZuQk5RMFNWUzdBOGwyL0R0YXFmc0ovdlA4T3Zs?=
 =?utf-8?B?dU5kbWg0UWE3b3hIa2p3SXZZTDFwYkZmRkt6bVRhc2pMT056SDdoNWQ1SDRy?=
 =?utf-8?B?OXRxQUtQckJmajVFcjREc1ZXcmxFcjd1aW10bExTRHhiTFNIdnU4RXFWcW5L?=
 =?utf-8?B?LzFkNUtPdHluRDZTcytjOEhGME5paTZERjNKZ0ptc1BVV0RtWHJFVGhuRC9J?=
 =?utf-8?B?YzlwdFgybEFHcmwxVFkyeDVER1g4OWVXTU1iVDhDTEZJNFFiRHRQYWNnQmdY?=
 =?utf-8?B?Qi9CNkpxWkFweUZJSEpJZEQ5bmxHV25EcHp0aUJPYzQrd2ZOcGlHRHRSUTBn?=
 =?utf-8?B?aGVNbHpWK1pKT2d3c1AvSnNFeVorUmRTVnF1bVNCTEhtbU5YWWFhTGsyVmZ6?=
 =?utf-8?Q?eFDv+SUGsRgzCuIItIZnzKmhi?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E4143B25E9DD3546989ADF24B242BC30@namprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d655b6a-0a19-4daa-a901-08da9012b911
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2022 14:18:51.4631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I474bHb5Yl73RNIS4m/C6qPjQj0Yzd5czyCKjspSZo1gS12fs1dabIU+4ygh9Q0KEm8GsSOwD12ANiSSJmRkzXKSYpuzFYnmctHAHarhZL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5289

T24gMzAvMDgvMjAyMiAyMToyNywgSmVubmlmZXIgSGVyYmVydCB3cm90ZToNCj4gVGhpcyBwYXRj
aCBpbnRyb2R1Y2VzIGFuIG9wdGlvbmFsIFRQTSAyIGludGVyZmFjZSBkZWZpbml0aW9uIHRvIHRo
ZSBBQ1BJIHRhYmxlLA0KPiB3aGljaCBpcyB0byBiZSB1c2VkIGFzIHBhcnQgb2YgYSB2VFBNIDIg
aW1wbGVtZW50YXRpb24uDQo+IFRvIGVuYWJsZSB0aGUgbmV3IGludGVyZmFjZSAtIEkgaGF2ZSBt
YWRlIHRoZSBUUE0gaW50ZXJmYWNlIHZlcnNpb24NCj4gY29uZmlndXJhYmxlIGluIHRoZSBhY3Bp
X2NvbmZpZywgd2l0aCB0aGUgZGVmYXVsdCBiZWluZyB0aGUgZXhpc3RpbmcgMS4yLihUQ1BBKQ0K
PiBJIGhhdmUgYWxzbyBhZGRlZCB0byBodm1sb2FkZXIgYW4gb3B0aW9uIHRvIHV0aWxpc2UgdGhp
cyBuZXcgY29uZmlnLCB3aGljaCBjYW4NCj4gYmUgdHJpZ2dlcmVkIGJ5IHNldHRpbmcgdGhlIHBs
YXRmb3JtL3RwbV92ZXJpb24geGVuc3RvcmUga2V5Lg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBKZW5u
aWZlciBIZXJiZXJ0IDxqZW5uaWZlci5oZXJiZXJ0QGNpdHJpeC5jb20+DQoNCldlJ3JlIHBhc3Qg
dGhlIDQuMTcgZmVhdHVyZSBzdWJtaXNzaW9uIGRlYWRsaW5lLsKgIENDJ2luZyBIZW5yeS4NCg0K
SGVucnk6IFRoaXMgaXMgYSBmYWlybHkgc2ltcGxlIGNoYW5nZSBhbmQgYSBjcml0aWNhbCBidWls
ZGluZyBibG9jayBmb3INCmdldHRpbmcgV2luZG93cyAxMSBzdXBwb3J0IG9uIFhlbi7CoCBHaXZl
biB0aGF0IGZlYXR1cmUgZnJlZXplIHdhcw0Kc2xpcHBlZCBzZXZlcmFsIHdlZWtzIGZvciBvdGhl
ciByZWFzb25zLCB0aGlzIHNob3VsZCBiZSBjb25zaWRlcmVkIGZvcg0KaW5jbHVzaW9uIHRvby4N
Cg0KSmVubnk6IFRoaXMgbmVlZHMgc3BsaXR0aW5nIHVwIGludG8gYXQgbGVhc3QgMiBwYXRjaGVz
LsKgIFBhdGNoIDEgc2hvdWxkDQpiZSB0aGUgcmVuYW1lIG9mIEFDUElfSEFTX3tUQ1BBID0+IFRQ
TX0gYW5kIGludHJvZHVjdGlvbiBvZiB0cG1fdmVyc2lvbg0KKGluYyBzdWl0YWJsZSByZWFycmFu
Z2luZykuwqAgUGF0Y2ggMiBzaG91bGQgYmUgdGhlIGludHJvZHVjdGlvbiBvZiBUUE0yLg0KDQo+
IGRpZmYgLS1naXQgYS90b29scy9maXJtd2FyZS9odm1sb2FkZXIvdXRpbC5jIGIvdG9vbHMvZmly
bXdhcmUvaHZtbG9hZGVyL3V0aWwuYw0KPiBpbmRleCA1ODFiMzVlNWNmLi5lM2FmMzI1ODFiIDEw
MDY0NA0KPiAtLS0gYS90b29scy9maXJtd2FyZS9odm1sb2FkZXIvdXRpbC5jDQo+ICsrKyBiL3Rv
b2xzL2Zpcm13YXJlL2h2bWxvYWRlci91dGlsLmMNCj4gQEAgLTk5NCwxMyArOTk0LDI0IEBAIHZv
aWQgaHZtbG9hZGVyX2FjcGlfYnVpbGRfdGFibGVzKHN0cnVjdCBhY3BpX2NvbmZpZyAqY29uZmln
LA0KPiAgICAgIGlmICggIXN0cm5jbXAoeGVuc3RvcmVfcmVhZCgicGxhdGZvcm0vYWNwaV9sYXB0
b3Bfc2xhdGUiLCAiMCIpLCAiMSIsIDEpICApDQo+ICAgICAgICAgIGNvbmZpZy0+dGFibGVfZmxh
Z3MgfD0gQUNQSV9IQVNfU1NEVF9MQVBUT1BfU0xBVEU7DQo+ICANCj4gLSAgICBjb25maWctPnRh
YmxlX2ZsYWdzIHw9IChBQ1BJX0hBU19UQ1BBIHwgQUNQSV9IQVNfSU9BUElDIHwNCj4gKyAgICBj
b25maWctPnRhYmxlX2ZsYWdzIHw9IChBQ1BJX0hBU19UUE0gfCBBQ1BJX0hBU19JT0FQSUMgfA0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFDUElfSEFTX1dBRVQgfCBBQ1BJX0hBU19Q
TVRJTUVSIHwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBQ1BJX0hBU19CVVRUT05T
IHwgQUNQSV9IQVNfVkdBIHwNCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICBBQ1BJX0hB
U184MDQyIHwgQUNQSV9IQVNfQ01PU19SVEMpOw0KPiAgICAgIGNvbmZpZy0+YWNwaV9yZXZpc2lv
biA9IDQ7DQo+ICANCj4gLSAgICBjb25maWctPnRpc19oZHIgPSAodWludDE2X3QgKilBQ1BJX1RJ
U19IRFJfQUREUkVTUzsNCj4gKyAgICBpZiAoICFzdHJuY21wKHhlbnN0b3JlX3JlYWQoInBsYXRm
b3JtL3RwbV92ZXJzaW9uIiwgIjAiKSwgIjIiLCAxKSAgKSB7DQoNCkJyYWNlIG9uIG5ldyBsaW5l
Lg0KDQpBbHNvLCB0aGlzIGlzIGEgbmV3IGtleSwgc28gbmVlZHMgYW4gZW50cnkgaW4NCmRvY3Mv
bWlzYy94ZW5zdG9yZS1wYXRocy5wYW5kb2MNCg0KPiArDQo+ICsgICAgICAgIGNvbmZpZy0+dHBt
X3ZlcnNpb24gPSAyOw0KPiArICAgICAgICBjb25maWctPmNyYl9oZHIgPSAodWludDE2X3QgKilB
Q1BJX0NSQl9IRFJfQUREUkVTUzsNCj4gKyAgICAgICAgY29uZmlnLT50aXNfaGRyID0gTlVMTDsN
Cj4gKyAgICB9DQo+ICsgICAgZWxzZQ0KPiArICAgIHsNCj4gKyAgICAgICAgY29uZmlnLT50cG1f
dmVyc2lvbiA9IDE7DQo+ICsgICAgICAgIGNvbmZpZy0+Y3JiX2hkciA9IE5VTEw7DQo+ICsgICAg
ICAgIGNvbmZpZy0+dGlzX2hkciA9ICh1aW50MTZfdCAqKUFDUElfVElTX0hEUl9BRERSRVNTOw0K
PiArICAgIH0NCg0KVGhpcyBsb2dpYyBtYWtlcyBhbnkgdmFsdWUsIGluY2x1ZGluZyAiMCIgbWVh
biAidXNlIFRQTSAxIiwgd2hpY2ggaXNuJ3QNCnRlcnJpYmx5IGdvb2QuwqAgRnVydGhlcm1vcmUs
IEFDUElfSEFTX1RQTSBkb2Vzbid0IG1lYW4gImhhcyBhIFRQTSIsIGl0DQptZWFucyAicHJvYmUg
Zm9yIGEgVFBNIi4NCg0KU28gd2hhdCB0aGlzIGFjdHVhbGx5IHdhbnRzIHRvIGJlIGlzIHNvbWV0
aGluZyBtb3JlIGxpa2UgdGhpczoNCg0KcyA9IHhlbnN0b3JlX3JlYWQoInBsYXRmb3JtL3RwbS12
ZXJzaW9uIik7DQpjb25maWctPnRwbV92ZXJzaW9uID0gc3Ryb2xsKHMsIE5VTEwsIDApOw0KDQpz
d2l0Y2ggKCBjb25maWctPnRwbV92ZXJzaW9uICkNCnsNCmNhc2UgMToNCsKgwqDCoCBjb25maWct
PnRhYmxlX2ZsYWdzIHw9IEFDUElfSEFTX1RQTTsNCsKgwqDCoCBjb25maWctPnRpc19oZHIgPSAo
dWludDE2X3QgKilBQ1BJX1RJU19IRFJfQUREUkVTUzsNCsKgwqDCoCBicmVhazsNCn0NCg0KWW91
IGRvbid0IG5lZWQgdG8gc2V0IHRoZSBOVUxMIHZhbHVlcyBiZWNhdXNlIGNvbmZpZyBpcyBzdWl0
YWJseSB6ZXJvZWQNCnRvIGJlZ2luIHdpdGgsIGFuZCBwYXRjaCAyIHdpbGwganVzdCBhZGQNCg0K
Y2FzZSAyOg0KwqDCoMKgIGNvbmZpZy0+dGFibGVfZmxhZ3MgfD0gQUNQSV9IQVNfVFBNOw0KwqDC
oMKgIGNvbmZpZy0+Y3JiX2hkciA9ICh1aW50MTZfdCAqKUFDUElfQ1JCX0hEUl9BRERSRVNTOw0K
wqDCoMKgIGJyZWFrOw0KDQo+IGRpZmYgLS1naXQgYS90b29scy9saWJhY3BpL2FjcGkyXzAuaCBi
L3Rvb2xzL2xpYmFjcGkvYWNwaTJfMC5oDQo+IGluZGV4IDI2MTliYTMyZGIuLjU3NTRkYWE5ODUg
MTAwNjQ0DQo+IC0tLSBhL3Rvb2xzL2xpYmFjcGkvYWNwaTJfMC5oDQo+ICsrKyBiL3Rvb2xzL2xp
YmFjcGkvYWNwaTJfMC5oDQo+IEBAIC0xMjEsNiArMTIxLDI4IEBAIHN0cnVjdCBhY3BpXzIwX3Rj
cGEgew0KPiAgfTsNCj4gICNkZWZpbmUgQUNQSV8yXzBfVENQQV9MQU1MX1NJWkUgKDY0KjEwMjQp
DQo+ICANCj4gKy8qDQo+ICsgKiBUUE0yDQo+ICsgKi8NCj4gK3N0cnVjdCBBY3BpMjBUUE0yIHsN
Cg0KYWNwaV8yMF90cG0yLCBjb25zaXN0ZW50IHdpdGggZXZlcnl0aGluZyBlbHNlIGhlcmUuDQoN
Cj4gZGlmZiAtLWdpdCBhL3Rvb2xzL2xpYmFjcGkvYnVpbGQuYyBiL3Rvb2xzL2xpYmFjcGkvYnVp
bGQuYw0KPiBpbmRleCBmZTJkYjY2YTYyLi40NzhjYmVjNWRkIDEwMDY0NA0KPiAtLS0gYS90b29s
cy9saWJhY3BpL2J1aWxkLmMNCj4gKysrIGIvdG9vbHMvbGliYWNwaS9idWlsZC5jDQo+IEBAIC00
MDksMzggKzQxMiw4NiBAQCBzdGF0aWMgaW50IGNvbnN0cnVjdF9zZWNvbmRhcnlfdGFibGVzKHN0
cnVjdCBhY3BpX2N0eHQgKmN0eHQsDQo+ICAgICAgICAgIG1lbWNweShzc2R0LCBzc2R0X2xhcHRv
cF9zbGF0ZSwgc2l6ZW9mKHNzZHRfbGFwdG9wX3NsYXRlKSk7DQo+ICAgICAgICAgIHRhYmxlX3B0
cnNbbnJfdGFibGVzKytdID0gY3R4dC0+bWVtX29wcy52MnAoY3R4dCwgc3NkdCk7DQo+ICAgICAg
fQ0KPiAtDQo+IC0gICAgLyogVFBNIFRDUEEgYW5kIFNTRFQuICovDQo+IC0gICAgaWYgKCAoY29u
ZmlnLT50YWJsZV9mbGFncyAmIEFDUElfSEFTX1RDUEEpICYmDQo+IC0gICAgICAgICAoY29uZmln
LT50aXNfaGRyWzBdICE9IDAgJiYgY29uZmlnLT50aXNfaGRyWzBdICE9IDB4ZmZmZikgJiYNCj4g
LSAgICAgICAgIChjb25maWctPnRpc19oZHJbMV0gIT0gMCAmJiBjb25maWctPnRpc19oZHJbMV0g
IT0gMHhmZmZmKSApDQo+ICsgICAgLyogVFBNIGFuZCBTU0RULiAqLw0KPiArICAgIGlmIChjb25m
aWctPnRhYmxlX2ZsYWdzICYgQUNQSV9IQVNfVFBNKQ0KPiAgICAgIHsNCg0KU3R5bGUsIGhlcmUg
YW5kIGxvd2VyIGRvd24uDQoNClRoZSBlbmQgcmVzdWx0IHdhbnRzIHRvIGxvb2sgc29tZXRoaW5n
IGxpa2U6DQoNCmlmICggY29uZmlnLT50YWJsZV9mbGFncyAmIEFDUElfSEFTX1RQTSApDQp7DQrC
oMKgwqAgc3dpdGNoICggY29uZmlnLT50cG1fdmVyc2lvbiApDQrCoMKgwqAgew0KwqDCoMKgIGNh
c2UgMToNCsKgwqDCoMKgwqDCoMKgIGlmICggIWNvbmZpZy0+dGlzX2hkciB8fCBjb25maWctPnRp
c19oZHJbMF0gPT0gMCB8fA0KY29uZmlnLT50aXNfaGRyWzBdID09IDB4ZmZmZiApDQrCoMKgwqDC
oMKgwqDCoCDCoMKgwqAgYnJlYWs7DQoNCsKgwqDCoMKgwqDCoMKgIHNzZHQgPQ0KwqDCoMKgwqDC
oMKgwqAgLi4uDQrCoMKgwqDCoMKgwqDCoCBicmVhazsNCsKgwqDCoCB9DQp9DQoNCkluIHBhcnRp
Y3VsYXIsIEkgZG9uJ3QgdGhpbmsgdGhlIHByaW50ZigpJ3MgYXJlIHBhcnRpY3VsYXJseSB1c2Vm
dWwgZm9yDQpiYWQgaW50ZXJuYWwgaW5wdXQgaW50byBhIHByb2JlIGZ1bmN0aW9uLg0KDQo+IC0g
ICAgICAgIHNzZHQgPSBjdHh0LT5tZW1fb3BzLmFsbG9jKGN0eHQsIHNpemVvZihzc2R0X3RwbSks
IDE2KTsNCj4gLSAgICAgICAgaWYgKCFzc2R0KSByZXR1cm4gLTE7DQo+IC0gICAgICAgIG1lbWNw
eShzc2R0LCBzc2R0X3RwbSwgc2l6ZW9mKHNzZHRfdHBtKSk7DQo+IC0gICAgICAgIHRhYmxlX3B0
cnNbbnJfdGFibGVzKytdID0gY3R4dC0+bWVtX29wcy52MnAoY3R4dCwgc3NkdCk7DQo+IC0NCj4g
LSAgICAgICAgdGNwYSA9IGN0eHQtPm1lbV9vcHMuYWxsb2MoY3R4dCwgc2l6ZW9mKHN0cnVjdCBh
Y3BpXzIwX3RjcGEpLCAxNik7DQo+IC0gICAgICAgIGlmICghdGNwYSkgcmV0dXJuIC0xOw0KPiAt
ICAgICAgICBtZW1zZXQodGNwYSwgMCwgc2l6ZW9mKCp0Y3BhKSk7DQo+IC0gICAgICAgIHRhYmxl
X3B0cnNbbnJfdGFibGVzKytdID0gY3R4dC0+bWVtX29wcy52MnAoY3R4dCwgdGNwYSk7DQo+IC0N
Cj4gLSAgICAgICAgdGNwYS0+aGVhZGVyLnNpZ25hdHVyZSA9IEFDUElfMl8wX1RDUEFfU0lHTkFU
VVJFOw0KPiAtICAgICAgICB0Y3BhLT5oZWFkZXIubGVuZ3RoICAgID0gc2l6ZW9mKCp0Y3BhKTsN
Cj4gLSAgICAgICAgdGNwYS0+aGVhZGVyLnJldmlzaW9uICA9IEFDUElfMl8wX1RDUEFfUkVWSVNJ
T047DQo+IC0gICAgICAgIGZpeGVkX3N0cmNweSh0Y3BhLT5oZWFkZXIub2VtX2lkLCBBQ1BJX09F
TV9JRCk7DQo+IC0gICAgICAgIGZpeGVkX3N0cmNweSh0Y3BhLT5oZWFkZXIub2VtX3RhYmxlX2lk
LCBBQ1BJX09FTV9UQUJMRV9JRCk7DQo+IC0gICAgICAgIHRjcGEtPmhlYWRlci5vZW1fcmV2aXNp
b24gPSBBQ1BJX09FTV9SRVZJU0lPTjsNCj4gLSAgICAgICAgdGNwYS0+aGVhZGVyLmNyZWF0b3Jf
aWQgICA9IEFDUElfQ1JFQVRPUl9JRDsNCj4gLSAgICAgICAgdGNwYS0+aGVhZGVyLmNyZWF0b3Jf
cmV2aXNpb24gPSBBQ1BJX0NSRUFUT1JfUkVWSVNJT047DQo+IC0gICAgICAgIGlmICggKGxhc2Eg
PSBjdHh0LT5tZW1fb3BzLmFsbG9jKGN0eHQsIEFDUElfMl8wX1RDUEFfTEFNTF9TSVpFLCAxNikp
ICE9IE5VTEwgKQ0KPiArICAgICAgICBpZiAoY29uZmlnLT4gdHBtX3ZlcnNpb24gPT0gMikNCj4g
KyAgICAgICAgew0KPiArICAgICAgICAgICAgaWYgKCAoY29uZmlnLT5jcmJfaGRyKSAmJg0KPiAr
ICAgICAgICAgICAgICAgICAgIChjb25maWctPmNyYl9oZHJbMF0gIT0gMCAmJiBjb25maWctPmNy
Yl9oZHJbMF0gIT0gMHhmZmZmKSkNCj4gKyAgICAgICAgICAgIHsNCj4gKyAgICAgICAgICAgICAg
ICBzc2R0ID0gY3R4dC0+bWVtX29wcy5hbGxvYyhjdHh0LCBzaXplb2Yoc3NkdF90cG0yKSwgMTYp
Ow0KPiArICAgICAgICAgICAgICAgIGlmICghc3NkdCkgcmV0dXJuIC0xOw0KPiArICAgICAgICAg
ICAgICAgIG1lbWNweShzc2R0LCBzc2R0X3RwbTIsIHNpemVvZihzc2R0X3RwbTIpKTsNCj4gKyAg
ICAgICAgICAgICAgICB0YWJsZV9wdHJzW25yX3RhYmxlcysrXSA9IGN0eHQtPm1lbV9vcHMudjJw
KGN0eHQsIHNzZHQpOw0KPiArDQo+ICsgICAgICAgICAgICAgICAgdHBtMiA9IGN0eHQtPm1lbV9v
cHMuYWxsb2MoY3R4dCwgc2l6ZW9mKHN0cnVjdCBBY3BpMjBUUE0yKSwgMTYpOw0KPiArICAgICAg
ICAgICAgICAgIGlmICghdHBtMikgcmV0dXJuIC0xOw0KPiArICAgICAgICAgICAgICAgIG1lbXNl
dCh0cG0yLCAwLCBzaXplb2YoKnRwbTIpKTsNCj4gKyAgICAgICAgICAgICAgICB0YWJsZV9wdHJz
W25yX3RhYmxlcysrXSA9IGN0eHQtPm1lbV9vcHMudjJwKGN0eHQsIHRwbTIpOw0KPiArDQo+ICsg
ICAgICAgICAgICAgICAgdHBtMi0+aGVhZGVyLnNpZ25hdHVyZSA9IEFDUElfMl8wX1RQTTJfU0lH
TkFUVVJFOw0KPiArICAgICAgICAgICAgICAgIHRwbTItPmhlYWRlci5sZW5ndGggICAgPSBzaXpl
b2YoKnRwbTIpOw0KPiArICAgICAgICAgICAgICAgIHRwbTItPmhlYWRlci5yZXZpc2lvbiAgPSBB
Q1BJXzJfMF9UUE0yX1JFVklTSU9OOw0KPiArICAgICAgICAgICAgICAgIGZpeGVkX3N0cmNweSh0
cG0yLT5oZWFkZXIub2VtX2lkLCBBQ1BJX09FTV9JRCk7DQo+ICsgICAgICAgICAgICAgICAgZml4
ZWRfc3RyY3B5KHRwbTItPmhlYWRlci5vZW1fdGFibGVfaWQsIEFDUElfT0VNX1RBQkxFX0lEKTsN
Cj4gKyAgICAgICAgICAgICAgICB0cG0yLT5oZWFkZXIub2VtX3JldmlzaW9uID0gQUNQSV9PRU1f
UkVWSVNJT047DQo+ICsgICAgICAgICAgICAgICAgdHBtMi0+aGVhZGVyLmNyZWF0b3JfaWQgICA9
IEFDUElfQ1JFQVRPUl9JRDsNCj4gKyAgICAgICAgICAgICAgICB0cG0yLT5oZWFkZXIuY3JlYXRv
cl9yZXZpc2lvbiA9IEFDUElfQ1JFQVRPUl9SRVZJU0lPTjsNCj4gKyAgICAgICAgICAgICAgICB0
cG0yLT5wbGF0Zm9ybV9jbGFzcyA9IFRQTTJfQUNQSV9DTEFTU19DTElFTlQ7DQo+ICsgICAgICAg
ICAgICAgICAgdHBtMi0+Y29udHJvbF9hcmVhX2FkZHJlc3MgPSBUUE1fQ1JCX0FERFJfQ1RSTDsN
Cj4gKyAgICAgICAgICAgICAgICB0cG0yLT5zdGFydF9tZXRob2QgPSBUUE0yX1NUQVJUX01FVEhP
RF9DUkI7DQo+ICsgICAgICAgICAgICAgICAgdHBtMi0+bG9nX2FyZWFfbWluaW11bV9sZW5ndGgg
PSBUUE1fTE9HX0FSRUFfTUlOSU1VTV9TSVpFOw0KPiArDQo+ICsgICAgICAgICAgICAgICAgbG9n
ID0gY3R4dC0+bWVtX29wcy5hbGxvYyhjdHh0LCBUUE1fTE9HX1NJWkUsIDQwOTYpOw0KPiArICAg
ICAgICAgICAgICAgIGlmICghbG9nKSByZXR1cm4gLTE7DQoNClRoaXMgaXMgYnVnZ3kuDQoNCkFQ
Q0kgdGFibGUgbWVtb3J5IGlzIGNvdmVyZWQgYnkgYW4gRTgyMF9BQ1BJIHJhbmdlIChzcGVjaWZp
Y2FsbHksIGlzDQplbGlnaWJsZSB0byBiZSB1c2VkIGFzIGdlbmVyYWwgUkFNIGFmdGVyIGJvb3Qp
LCB3aGlsZSB0aGUgVFBNIGxvZyBzaG91bGQNCmJlIGluIGFuIEU4MjBfUkVTRVJWRUQgcmVnaW9u
Lg0KDQpUbyBzdGFydCB3aXRoLCBpdCdzIHByb2JhYmx5IGZpbmUgdG8gaGFyZGNvZGUgc29tZXRo
aW5nIGluIHRoZSAyTSB3aW5kb3cNCmF0IDB4ZmVkNDAwMDAgdG8gYmUgZml4ZWQgbG9jYXRpb24g
Zm9yIHRoZSBsb2cuDQoNCn5BbmRyZXcNCg==

