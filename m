Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3F56A9B45
	for <lists+xen-devel@lfdr.de>; Fri,  3 Mar 2023 16:57:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506102.779122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY7lx-0006qO-BR; Fri, 03 Mar 2023 15:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506102.779122; Fri, 03 Mar 2023 15:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pY7lx-0006nx-7p; Fri, 03 Mar 2023 15:56:41 +0000
Received: by outflank-mailman (input) for mailman id 506102;
 Fri, 03 Mar 2023 15:56:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SP4M=63=citrix.com=prvs=419214df4=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pY7lw-0006nr-Ht
 for xen-devel@lists.xenproject.org; Fri, 03 Mar 2023 15:56:40 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f68cf73d-b9db-11ed-a550-8520e6686977;
 Fri, 03 Mar 2023 16:56:36 +0100 (CET)
Received: from mail-mw2nam04lp2170.outbound.protection.outlook.com (HELO
 NAM04-MW2-obe.outbound.protection.outlook.com) ([104.47.73.170])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Mar 2023 10:56:29 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH0PR03MB6350.namprd03.prod.outlook.com (2603:10b6:510:bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Fri, 3 Mar
 2023 15:56:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6156.021; Fri, 3 Mar 2023
 15:56:27 +0000
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
X-Inumbo-ID: f68cf73d-b9db-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677858996;
  h=message-id:date:to:from:subject:
   content-transfer-encoding:mime-version;
  bh=C/1Ox0bCBIfsU9Q0eIJ6hb9cd3qslNPmfYSkEhXHb+Q=;
  b=hzDcuKd8b9Vcbi0DHoGaNOaOsax2az5xWjN5K7d3V4LfcGiWj28amDVV
   Z33Y7KihFe9rXcE0RRUOOIIoeMlzq0t8LMsqpA8MucEOBCN17pk5SZPn2
   5nyeRFrE9V5Ebc5hsnOVR5qgpnPJuWexefizMCeSC8NgyF930VcHLQ9R7
   Q=;
X-IronPort-RemoteIP: 104.47.73.170
X-IronPort-MID: 99359255
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:SfqFta7J15LMeRBsU8Q4rgxRtCbGchMFZxGqfqrLsTDasY5as4F+v
 mRODGrUb66PYWGgeNwgPtuyoUsOvp+BzIdrT1M/+yk9Hi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7JwehBtC5gZlPasT5weE/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m6
 sZIDAoxQRa/msWPnby7Vu5FjM8II5y+VG8fkikIITDxK98DGcyGZpqQoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6Ml0ooj+CF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNNDT+DprKM36LGV7jNPJkYEa2Himue0rXGCdNN1d
 kUr0CV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3Oc0TzE30
 l6Cn/vyGCdi9raSTBqgGqy8qDqzPW0QMjUEbCpcEQ8duYC8+Mc0kw7FSctlHOitlNrpFDrsw
 jeM6i8jm7EUis1N3KK+lbzavw+RSlHyZlZdzm3qsqiNt2uVuKbNi1SU1GXm
IronPort-HdrOrdr: A9a23:v7/rC6kkQdLDtURUa6/uHlmIhzTpDfLa3DAbv31ZSRFFG/Fw9/
 rCoB3U73/JYVcqKRcdcLW7UpVoLkmyyXcY2+cs1PKZLWvbUQiTXeZfBOnZsl7d8kTFn4Yw6U
 4jSdkaNDSZNzNHZK3BkW2F+rgboeVu8MqT9JjjJ3UGd3AVV0m3hT0JezpyESdNNXl77YJSLu
 vk2iLezQDQBEj+aK6AdwE4dtmGnfLnvrT8byULAhY2gTP+8Q9BuNbBYmOlNg51aUI0/Ysf
X-IronPort-AV: E=Sophos;i="5.98,231,1673931600"; 
   d="scan'208";a="99359255"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9izOjQw9OVqhBMXAmhOPaEa40XqjWi+oX2OPrBqTovAyLVFgZQKMx4QuVBH/7MA41j12P7GTm8uTgBI2DJoYKT/z5Ka5yJTrLowAlD5+1w5qtXLHgWchpqIGvkyZs2pv+M2eWhDGK50NZnpBIKE8ibNjDsIR0jZddoifEyEIJSvtC3rB2+eqwVPKYGxk8EpyqMMH9SXAfNXOX1Tu/gcnqjqEZmaHIqGZ2y2FeG0AQaOyjIQoyVTz2sy7E31AuvX/kkR7Mz1QVy03uv8B/p2fICmnWh2Yz0mtFQLcCMQoMl4qCaHVo1wNfADiynP02kziiX+BSqqidaQCGllF6ieQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C/1Ox0bCBIfsU9Q0eIJ6hb9cd3qslNPmfYSkEhXHb+Q=;
 b=BP1mXnxLhD3xTPsylb6gzSPc+Z9eeY9dX/lOVVnBcDoz2TD0jnJCnJfxbcRAWpnVNtALX8i6qSEZwcj+1NcJJ02DkTyuaT3uPYtvSAczo6jrFxZfNy6hdrpNA3zZQyZq3wa9utvxblhN8Xu+vnMBz/X5RHjdMvbOV3pY8SLBH7DdKnk60WIM6q5VtKfl1wA4Iri8R7cp9FFlCkLx/T8Q5Bi1YTH6eDsHEY/ODY8z/Oe5tLaAGYSvGtIm05zc1QKGwzNaibbDSUGW9NnLl5qarY3pB3CSSlIZ6UIkDCM2J2HvUoNUdFBjYKReeoRK/JtqB5TbB9NUkdrY3dRrIm88Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C/1Ox0bCBIfsU9Q0eIJ6hb9cd3qslNPmfYSkEhXHb+Q=;
 b=KhjR9RCf2Rzd/UdzktDtvlkLhft/+YCUgFSKUAjkd6JjETdBIX2WnTu1BDxFyu6Fw8b9SeP+UBkyD52dbElNOlW86o1Nw1YuoQmqAHFAp52LwZXSgQlzMdavO6Q5d6vBYlshwYqX/XxSdwb5lDJtj/bOSWbtxzauZ68b1d0gwSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <4257ff30-0ece-4138-20f2-b7a3e5a91522@citrix.com>
Date: Fri, 3 Mar 2023 15:56:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Backports for stable branches
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0116.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH0PR03MB6350:EE_
X-MS-Office365-Filtering-Correlation-Id: a1136112-c992-45bc-d15d-08db1bffd8eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3EN4m3S/TCsXOffyjIVPj+Z6xA1oGs863a51wKwyJLQxhFD2+csgHRfcutT7DdXZwQxAUCQ59DKVseXawaIzNtRLkdYqtNSaE/7GlxjqV+d4vXWuvHpZ1e661jKFX3zfkNywjguZO7KcsenIEbnIi6soSj2auI6HrRQDSoh6dYzxyCTw/IejHjhQiV4tZvXN1mujf0kf7sUziaxNt/FZ2bHIexleZv3NfPXNdk8PvJoyPmNqteNjmAlIammNVUnIbngLuNm7x4e4QTVcAFczsiV3XMJqtuqRu8anA87pD22PjKnG6PxmD58yiDsfQeKMaoqTmP/gsdVfY3kOq8zK/eO0Uh7U/6DNUrSBRnPSOsBSDU6VZKU9yviy8A606rnr8qutfy691Bmslf/zSkpJXaKgRDxAJhdIH85UZgfAfXqXt3thfjA+k3IrVeUswXdh8P8aSr9CyWqzAj+zQZaP3oMbE+leWedG8pImLhVOBPNfvQAlPszY09XOodBcmUKXzAukX801+AUAUPEMK1vT8/pIzlaRSIwc44X22F53cl07PNs1gVqKWJhOyXokXQm0DLyZWPY4YX465p0cWfUiiPcv4SYR2H1isOHvmLfDsSK5XOw0C5r69aBTmJKNWqCZAKgfaRNHr/ig5Dybk0dlWWdH4g8pYbxLTpbcnsky0ZhG2/3VEpKgv/ah6TjAFolmT+IWg6bI/romF9ZoDS04ZXmWunz4vZh5hl3arxpfGok=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199018)(36756003)(66476007)(5660300002)(8936002)(66556008)(26005)(4744005)(38100700002)(6512007)(6666004)(3480700007)(6506007)(83380400001)(82960400001)(186003)(86362001)(8676002)(316002)(2616005)(66946007)(41300700001)(478600001)(31696002)(110136005)(6486002)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEFOajN2QTFoVXJjVEExRVBsRDh0djk5VmpqclgwMmMwQTdUKzExM01HOFZw?=
 =?utf-8?B?blBQWkl6TGNGRFJodzFXVDhLVVEwZGovcWF6VXk5dElHeTlPcUpBemhFeUxF?=
 =?utf-8?B?Z1M0VVRQT1NmUEhzbVB2akFVMWdRNVpwVXhIQTNQdFJua21EUHF1VXJOU1V6?=
 =?utf-8?B?Q1k1d1AyV2VFMWR2SzF6Z1dOUjFLZkc3UC9kb3E4dGcrY3Q4Q0V6TUJ4cU53?=
 =?utf-8?B?dWdHMVNjYXc2bk9KcHhjOUJFY3gxencrRUtCN2xkd2Y5a1l0MXREWGcxU0Nn?=
 =?utf-8?B?Mm5Nc0RxSnAwTFlrM1BON1p4ZWoyL1Bac0tDTkRxanROajhrNVFkTFZ6VWda?=
 =?utf-8?B?WnpKbERHcWhreHJHZXlzQ052NHFEMzVxOHNTQldrUjFRYysyNnJRV2x4NEF5?=
 =?utf-8?B?QVZIdjNBeGYxcDNyWEpraUpjV0tpbWhxOTRxVGFLajB6RHpmSTZYWUQ2aWFM?=
 =?utf-8?B?L3I4VHlwb0RPSVA1bTZsTUZUc0ZEWXYxNkJLcDBkT0RVUUtZM0UzQlhLZGxP?=
 =?utf-8?B?aGRLYTVYbzZmd1JMTi9yTE1LYWJ3RDB0dThVTXNyN3MyWER5cEVvVVNLQmhN?=
 =?utf-8?B?N0J4eVQxSkJKVUZraDVYbVpGd21Kdk5OeXByRXUxZ3dVUlB3WUZBSW1JRFda?=
 =?utf-8?B?UGlSSjRwVXFhTndrb2dOaWR2VEl5TjJ0MkJGYTJqMXNqOEg5REhWNTRRdi9B?=
 =?utf-8?B?YStuUHhEVDFpRUlBTHljVDZrZHNOMzMwQ0dZSnVNMW1QQkZaV0V2NlViNDNT?=
 =?utf-8?B?dlNUSTRxYlllYktZeEhuNUNOekhPNUsxVkQrK0w4Z2FXenZlUTNQUGUwdnJl?=
 =?utf-8?B?MzVsS3dVdXVlbHhrQUw0VzVEZWYzVmJsa0Y2SW1tMDg1WENMWGxJK3NDWlFY?=
 =?utf-8?B?dFUzaFZYNFFKSmsrNmY5ajMvNVJwWThhV0c1dHJKc3RHR0dzRHh1V253ek1Q?=
 =?utf-8?B?N25RRFdyVFpzNi94SVRjYTdGQTA5cTlvZFVxTWE1YTArL0FacW8xMVlGeW9X?=
 =?utf-8?B?KzdISVd4SzYvRS80YkJ3T2k5Q2NVbGlDQ0ZlekdhR3RldXRzdlUyaVJDNjNt?=
 =?utf-8?B?RHNDVWIxZkFCMGFmWjlBU3pkL2ZYbXg4SythczBHQ0N5QzhEcXh4dndPSnlU?=
 =?utf-8?B?V2UvWCtFWUQvemhDNTFSRGhKdElhbHluZndZTjhUZ1V0RUtYMWlsalhuVnBT?=
 =?utf-8?B?UUlEMTJQMU9DVE50L3YzcGlzbGNCckNnbjRKeUNMUVhSV2g5cnZXWXpTT24z?=
 =?utf-8?B?aFV2UVllZHJRcWw0M3hwSnI5QVh1ZksxSWFRSWw2SkFXcE5hbWlMSXlyazJi?=
 =?utf-8?B?QXNBbWtUMy8rc2kxWVg3QXBzcUZtK2VLRytUd0JON0pCc056N3lCU2g2Q1lz?=
 =?utf-8?B?dWM2YXR6VkZlWWVxb3NuTHl6VFI3TTJlQUVYR1RVRVZrN2NjcHdYU2N5dWs0?=
 =?utf-8?B?Y2g2UWRTdzVWLytGalp1WGNza1p5VUxCb1N6TjdDQXZvQytkS29qWFh4ZVRs?=
 =?utf-8?B?c2xyY05uYVRnenVwNHVPeFhTQ1Fld0pjcGxhNU1oYi93RnUyTGNtUHpIN2hE?=
 =?utf-8?B?NjJ6SUVTZHRHNWhRUjFPSkowRUFvVExqZ3dxTzhYSHFET0FMR3U4YzZHemRk?=
 =?utf-8?B?SDlFVnZHYmJLOHpWZFRIR2NtSlBoMUw3MVVJcW5GM3g3L3NmcWVTL29iYW5m?=
 =?utf-8?B?QmdiM1E2dmNtUTdWQXIySzljMHk3elE0ci9INmNmQm9lSG5uTUdwRXY3SERR?=
 =?utf-8?B?TktFdkdGeGwyakhoQ0c5a0w2c1c0Tk1ZbElpSHBRUnFXaXgwLzl0YnhIaE1K?=
 =?utf-8?B?TGg0aHQyRzVtangvOGVxeHo2N2JuNUtPdmhvdTJneHJlbnJOUXdnSWtyRDhp?=
 =?utf-8?B?dGFkL3dycWNJTWJhZHVRZ3pJV0xMbE9DNnllTHlzWFBVd1JiRW1SNU94WnIr?=
 =?utf-8?B?OUkrTC9TOWlqOXQycHFJejBlVzJXcjE4TVphZVllNXVraGpyN0xSZjZSSlFE?=
 =?utf-8?B?UzJtMG5FSHdyZVpuSStPQlgvekFTYlJLUzQ3dWJTZVIxWjN3eG9NTklqcGx2?=
 =?utf-8?B?M3NTTDNSTEZ6VHRHVldHemk2c1dVYzM4ZmNWRitZWTc0ODVEanRlY3Q3R1pU?=
 =?utf-8?B?OXVDTjhzVEpjaWRtK2NsbVJzWUJWa0dSOVhCWkVWaGpHK0ZtMC83bXRxckQ0?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nOqrhYPvkvjS0r9lcXQ9lrYaWU48iOUseRKyCHgmqSr0jdvUUqy4cEjxmKnpAFt+g+sXfch3zK0b3LkkAdUI8Z1NhTs9oX9hzDLirSj9AL2VsYIJRJylxDhHwZuAqoZtDhF8TFwr6BE/wA4wV++ifKYxT+hrKUYij3fx3taaIvYs/bozoQ4ZCBzStsf3Gw107DCjT0ZKHm6CvOp0w6iKVgS9r5Fov+DtaPYamwbXLOZWbUqtgOwboCA4hkOuHAcDpv44NmR2KufxL9WP/2TKYk7latQgKaayjotjjMMp6GaHGs7i4tHNLTzh/S0z46xH6y2NK0ycqIzhMu70LBLhCPjm1qF9pknc33TRVmKrVSmIXwPx/EGBS0XUkry3LQo5LWqizqPS1FVOue3d+Y1OOfRF4/YWmTfJiy8WQHSv6FDYvUovXKGhTW8zBOJmSd8bWdRVhNPzYTIXa8ykeweEw7reGjeWht8yWz7hl9cxXXWEzh6LfgtzT50+ZtHiRY4QzfKYVocIoiVYdnooPKPs+KAJmqy/KkEa6o8D3RjK8B1BFUinft7CfCsO56CiRJDgdl3ryCwLm8jqgp2O0D7vRDmNiwGWtoMS3Cr74bU7ypEMesXK5GnUdh+RIBPXkP35WwvYs2mNeWmx3WaKndO1zpglZ+Y8gcdTnxs0n2CjIsXg5fJYjciwDh+rHEl8U4lfnOL2Qe+tK1wTxYsLEuvx+WY9LQ79IZsoifSLEE4JlCdD9oJdmihnlEH+NgV1zD2sEnm6L2A5ADKpfnR/43vX2ZdtxJObMC2vVgq+1Y6MuiI=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1136112-c992-45bc-d15d-08db1bffd8eb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 15:56:27.5969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Prt3CA9TwKeTzJsrdOTf48AMOmMb9RYEtt+bbDJ4zuccvmlYWJoGYkicDPaWOFu9uL3Lmmt/K0OaIDrrlM+apdwfCybAwL79+p/Il297jmE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6350

Hello,

Two python bugfixes which definitely qualify for backport:

897257ba49d0 tools/python: change 's#' size type for Python >= 3.10
3a59443c1d5a tools/xenmon: Fix xenmon.py for with python3.x

Next, I'm going to argue for taking:

f7d07619d2ae x86/vmx: implement VMExit based guest Bus Lock detection
d329b37d1213 x86/vmx: introduce helper to set VMX_INTR_SHADOW_NMI
573279cde1c4 x86/vmx: implement Notify VM Exit
5f08bc9404c7 x86/vmx: Partially revert "x86/vmx: implement Notify VM Exit"

These are technically new features for Sapphire Rapids, but they're both
very simple (in the grand scheme of new features), and are both
mitigations to system-wide denial of services that required silicon
changes to make happen.

Either way, there is a security argument to be made for backporting these.

~Andrew

