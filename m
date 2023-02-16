Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7A969940A
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 13:13:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496511.767291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSd8r-0006gd-A3; Thu, 16 Feb 2023 12:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496511.767291; Thu, 16 Feb 2023 12:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSd8r-0006dE-4D; Thu, 16 Feb 2023 12:13:37 +0000
Received: by outflank-mailman (input) for mailman id 496511;
 Thu, 16 Feb 2023 12:13:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ntZu=6M=citrix.com=prvs=404d376a6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pSd8p-0006DA-9O
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 12:13:35 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 542ec3a4-adf3-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 13:13:33 +0100 (CET)
Received: from mail-dm6nam11lp2174.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.174])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 16 Feb 2023 07:13:30 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6631.namprd03.prod.outlook.com (2603:10b6:a03:388::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.22; Thu, 16 Feb
 2023 12:13:28 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6086.024; Thu, 16 Feb 2023
 12:13:28 +0000
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
X-Inumbo-ID: 542ec3a4-adf3-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676549613;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EcgJg4ohxsJipzERZ6H6TlFGFN9j1ZxJcbz2J/dJTxk=;
  b=cdDvNXhoP4jxDdAtmf/mADUXR7UpR19D00Gvj8wFR6tL31zAoAcfYdsv
   jG2L2n0J50rr84W2Bo+86oA/Bi00aOsDcHwYF3F5HsJHqQBV+IdGjZf0W
   0lDGTMo7vy6kJtI5vMayXG8ubp1fOQOzH0sZXiWCPqJbYfBK4AJQ+r5c9
   A=;
X-IronPort-RemoteIP: 104.47.57.174
X-IronPort-MID: 99715705
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:w3cRzqroOcv9KBbxswHl3stApbNeBmLSZBIvgKrLsJaIsI4StFCzt
 garIBnUMv2MYmKkKN8iaNux8EoOsJ7WmIBjTFdvrX1gFyga9JuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WxwUmAWP6gR5weEzidNVfrzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXAGkOXxqqgLOw+bemU9ZF3N8EEu/3MZxK7xmMzRmBZRonabbqZvyToPN9gnI3jM0IGuvCb
 c0EbzYpdA7HfxBEJlYQDtQ5gfusgX78NTZfrTp5p4JuuzSVkFM3jeeraYWJEjCJbZw9ckKwj
 2TK5WnmRDodM8SS02Gt+XOwnO7f2yj8Xer+EZXpp6Ez3QLLmwT/DjUWCnf4+9CQmHWXRupvO
 0VE3CUx9JItoRnDot7VGkfQTGS/lhwWVsdUEuY6wBqQ0aeS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hTGvPSkYK0cSaClCShEKi/H4u506hB/LStdlEYa2g8fzFDW2x
 CqFxAAhg50DgMhN0L+0lW0rmBqpr5nNCwIwuAPeWzv86hsjPdH5IYu19VLc8PBMap6DSUWMt
 2QFnM7Y6/0SCZaKl2qGR+Bl8KyV2stp+Qb02TZHd6TNPRz0k5J/Vei8OA1DGXo=
IronPort-HdrOrdr: A9a23:cfJqTK0AKavKuSz8QtjRKQqjBa9xeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtj4fZquz+8T3WB3B8beYOCGghrTEGgG1+ffKlLbak7DH4JmpM
 Jdmu1FeabN5DtB/LjHCWuDc+rIqePvmM7IuQ6d9QYUcegDUdAe0+4TMHf+LqQZfnghOXN0Lu
 v/2iIRzADQBUj/I/7LTkXsGIP41q/2vaOjRSRDKw8s6QGIgz/twLnmEyKA1hNbfyJTzawk+W
 3llRW8wqm4qfm0xjLVymeWtv1t6Zfc4+oGIPbJptkeKz3qhArtTIN9W4eatDRwjPCz5E0smN
 zspQ5lG8ho8Xvecky8vBOo8Qj91zQF7WPk1Daj8DbeiP28YAh/J9tKhIpffBecw008vOtk2K
 YO+26CrZJYAT7JgSy4vrHzJltXv3vxhUBnvf8YjnRZX4dbQLhNrbYH9EcQNJsbBir15K0uDe
 ErJsDB4/R9d0+cchnizyJS6e3pek52MgaNQ0AEtMDQ+z9KnEphx09d/8AblmdozuNLd7B0o8
 D/doh4nrBHScEbKYhnAv0afMexAmvRBTrRLWO7Oz3cZeE6EkOIj6SyzKQ+5emsdpBN5oA1go
 79XFRRsnN3U17yCPeJwIZA/nn2MSSAtAzWu4NjDqVCy/jBrOKBC1zGdLluqbrvnxwnOLyZZx
 7pU6gmRMMKLgPVaPJ0NkPFKt9vwEIlIb4oU+YAKiOzS/3wW/3XX8zgAYDuzenWYH8Zc1K6JE
 c/dx7OA+gFxnyXexbD8W3ssjXWCwPCwa4=
X-IronPort-AV: E=Sophos;i="5.97,302,1669093200"; 
   d="scan'208";a="99715705"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWaQ2+XQotgTMaLY1MJYNn5q+41POqLZIUjOlf/yQd+uF0+5cXCwTcFec4goqpVMfpcF41z7btUg55RvwBMjpX/r/rQ14gt8ZcmbxAN64JRiRgakb9jYG17JFjArMkOQeiNgFdaLg1EcLNT010TTuFFtsl9I+7TlL0908cxdbHVoNLg3DdYzOTydHxTJQ17Hj5HKg1U1OWF0OSvUiF5g0lvWdTDfNTBOSPo8JvBZaaY37aqREC1JkiZrMftce9zThXBt8qGna3WWGAvjgYkQuKqwgsckmtLJLOpbhQHkSTmFg+IiU59r9H2dECC5Js6XuPxqiob2306xmz7FRhGPRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EcgJg4ohxsJipzERZ6H6TlFGFN9j1ZxJcbz2J/dJTxk=;
 b=jDe8skYhrF5zHY9bho9SHyLpYhlhRi9lmXKjkvV3KGTD6QXuNrq/McW6ibeel6EtDdyhwWkUVn5kXmN/xWJ8jO+qIvc4PSlukOO/Abr8MxMo51Xfcvl8xHDW9IYT7a4XFrgHSPFA2AGQSyTkayudkqCetfxVIwqTn+siBLh2yQygdyYaF4eEOIpDvBZIp+cqw3HSqOdH9KvR7qqGbsl6z9Y587HVEBETg0MmiAyrBAvqXMOrUA1dU9UYeiBuEZLucuP8fEjb4u79LSRTvZkqig/w4iMKTBg9Oa0oWNdWQFLOhNic2Gdr5c4XzFAFrx3R5c+06KwTRcBBCpYpjyEfBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EcgJg4ohxsJipzERZ6H6TlFGFN9j1ZxJcbz2J/dJTxk=;
 b=S3P8LegeMFRtZO8OGdFFTKcpBX0RZFZE/0lMFROPw9Zp01zxWBWTpo5tBo/OPRIDl7qbJy5VxUPbT/IcH0bAvgzsbyK8Lv7JxNOBFWrX2Jh5lTUKBA8GtNLBUWs44K10T3ds3gYSWt+m/4/uS8YDIR4DSfUok0/9Sidw+s9Tcg4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <1f822b07-4520-7ba4-859f-a87bce3b247d@citrix.com>
Date: Thu, 16 Feb 2023 12:13:22 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 6/6] common: __u8 is history
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <98c3141c-9d49-695e-a936-4e755a4fc527@suse.com>
 <9e3c6641-1ab8-83ae-724d-a85af8e9ec17@suse.com>
In-Reply-To: <9e3c6641-1ab8-83ae-724d-a85af8e9ec17@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0053.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6631:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5cdc2d-452b-45b0-5169-08db101735ac
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	041ciDyeekBkDrQcNUDn3C4VU/lCeHeZAAmzQEMkXv7FCd7xlHpvvhiNihVzbpmVrHTvPcyLUuiVNGs6+2hU65uGiPSlEv5aqnGdRGRJzsLLVU4CZZWmHYL/DBAIRBTA47hD+rOxznDgXDAsPKH7nO+hnXTduUJbNQPXtQUya55fggW6erYujD9pikGt1KiwfzcyCXLmPFFf+76g4kVsl+FObWjV5uqk6H5gcAnuQf3sPKqz3iu8676etCUfi7TUxhTIPZw6l1LmrzpiIKYo1bxeIc6MuDv33p7negEFwvbCX4QQ4fXxpLgegPBR6L9mn2i3LkMUp+4LgXociSRylGnjJuApc8uLRGPhNgBPbR41kQBJl56kb+76rxjnpgBPoi7BEv8Y2cOgEEwt6io5fiUaby7m5oi8LeE8SAnTGAKBLxNtTJuTAxb2DIxE+PXpVbLK5CGFw+n8pf4K7d4D1tPS2JXy7j0pr6bW7l4NHjd0sV/VEDnP3VlfZTfRVc0Fg16uQJu7TG26bvkUTBRd0cnk6uTZS81/wo32c+qHgjRKj1UwqqozL1hiAq3KqNF7bS2IMVSoSX5I4DQJ3AyFAuwtK9QXvvtTYqxpassIGRyBwtq/AJrP6s36YT4YmSW6gIvd03SE49yfoaqSgtTDP2NXYSCPCSuAmOWVcl3VlXusLSjQDTz3RtQRB+ijlipguZ9QQbV8QfD1MYNGpyLmYUczQrDagwyquBbMVBllIfA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(396003)(346002)(136003)(376002)(451199018)(31686004)(6486002)(86362001)(31696002)(36756003)(8676002)(66476007)(66556008)(8936002)(82960400001)(41300700001)(5660300002)(66946007)(38100700002)(4326008)(110136005)(54906003)(316002)(558084003)(478600001)(2616005)(26005)(186003)(53546011)(2906002)(6666004)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXRNYkdJc2ZUMmUyMXpsL2JnR1kvTkxHZElWYi9JOE1jVDAxcjZrdmNJa1Zy?=
 =?utf-8?B?bE0rRXozQUgyRm51NGwvTXFITG5wMXFpcVFCeGZoWERCSnhKOVZpSVREK0ti?=
 =?utf-8?B?TkFuY25BZThQeDY0ZjVGT2U1RDFpNVZMZldMTXI2aGpFcCtiZ2F5eWNkU2hO?=
 =?utf-8?B?YjVnVmY4eDhmb0NDbVhxNUdtL2FkYlFLT21lZElLaDZDQ2UvcmxqMjZkdGdB?=
 =?utf-8?B?NTE0aUN6NUE3Smx6dDlLbjFEaEhSZUNIbVpQT0JwSW8zc0FaL1dDS0x0RjNo?=
 =?utf-8?B?QXJRaVNaVUYrNWp6NUp1LzBsd3lsZEtYT2E4Qyt3cjQxeVZUeU5TSGJQTGRF?=
 =?utf-8?B?MzJrQit6YVNtU3dralRBd3dtWTdONU5rSWFtcFlITDR3Z1cvNXlZWTBaWXRo?=
 =?utf-8?B?am5qeXJ3T0tQWmF3aWJZK0FuWG1YYWd2bFdVclc3Y3k1aHN5RFVsU2E4TUJV?=
 =?utf-8?B?VUtZMUlacVFqWElveW1zSldoVVc5ZWtoN0tpUm1FVmJGY3EvTzhGamJiQWtn?=
 =?utf-8?B?cjRseEVyNWd0Wlp5U0NOYmxON3l6SThwTXcwMkM5TS83Vi9JTVFId0FxbmEz?=
 =?utf-8?B?VnJpUkt1UzlpMEtnNlJyak43S242M3BTYnVGUU1TbFZacS9sdGNLbCtjZnBJ?=
 =?utf-8?B?WGRWdXBqK3pZU1lZVFRTRkN2QVF0dTUwOEF1UnlKWkdzdzdGNGR6WG1pbG9y?=
 =?utf-8?B?R01RZ1dmSktSTVl3dTFPeWZtbGdoQXhlUndLeWR6SjZIVm9Qc0NxOFBmdEF6?=
 =?utf-8?B?WDNENXNUaVNjbXJLZExEV3NFb25pV096UTY3TFBXMW0xeU5hSGZycVhOcDlX?=
 =?utf-8?B?dHdvNjFUcEd2Ny85N3ROMTkxWXNzR2lEdWNINVhlQW15c1hpYUR5MTVxMjZz?=
 =?utf-8?B?NHNwQ2NGSUdkYnUxQzU4aFVxRmNNQWlqVUkvR2VSSVY1Z2FjeEUyWFErMm1w?=
 =?utf-8?B?dFVad0VESnBESDR3M213ODZNWjFHcXFVU0MrK0Jua0hqQjN2MWpwbmdzb2hp?=
 =?utf-8?B?MTQ1dU9xUmJMN1dQSTREWHlGbUpmYVFobVJJL2tydU1vK3ZHUWFXSE1FOXAv?=
 =?utf-8?B?TVVlVTlGZEQrMVRnREtUVWw5U1dHMi96N0tWMTN2ZGdwTFJKazdFK2VnWjdN?=
 =?utf-8?B?R0dSOHFYeENZZXlETjlnQzZrdFVEb0dxUmhERjBUT3hDcHMyc09tWk9FLzAw?=
 =?utf-8?B?aFViakRJYVV4UTF6OTVRMmtJbWNIejFQbmh5aDRBckt1VjhPK2ZQVjVnRW5r?=
 =?utf-8?B?dW9WdU8wZVB5aEE0L2kxZzBSS2VMbmRWMzhGemkvMm1zQ2NxanRFVmxpeEdz?=
 =?utf-8?B?ZktIV1d0SGlMd0cxTU5jUHZjM1Y2MGltZHhKRllKZURRblcwdDFCL0lsZ2hu?=
 =?utf-8?B?QWtuSHFLUEZpT2lKQ0xtQ0pTTXJ6SWY3MmxtRHJmNVVVSWtkM0dVb1VxbTkv?=
 =?utf-8?B?eWdVY01iUlB1bm9ZQzdPSE96bmV2UWE0MFlkUlNyQlYvVkpaK2pXQTgxRzNR?=
 =?utf-8?B?RE8vWmdWTERFTVdqYWh4NHpHODUvVzlzVnZwSTlnVHJXYnF2ME5EUmFLMjlh?=
 =?utf-8?B?VVRIQTlBRlZHZzlIKzRmV3pJZkNMZjVuM0p0cm84WnFzQit4WkowcmxuSXdk?=
 =?utf-8?B?WFZYQnVsUytObG5iNXVUd1c4enQvVWMvekhNNzZnNzBCUkhpSUZYOW5JaE0x?=
 =?utf-8?B?U21mb08rdFhaTnNWK0QxNGNkQVhneXpHNmlMVkROQitLZW9POW1WVjdQcTJr?=
 =?utf-8?B?RFZPNm9VY2NRZ3pjc2NKd0M0WkdIRE9OT2hFenZhVUxmZXdQWTBHdnNXT3lH?=
 =?utf-8?B?UjNRVUZVbXZZTTU1SUtETkxyakU1Y0VZYjZUbjZQeFliOFIzM3VLTDgwWXBt?=
 =?utf-8?B?NUpmcFZjZnFFczNzSDlObzNJWWk2cXVtcHRYMHB0K1FIamRhTllNOGxlYTZX?=
 =?utf-8?B?Z3lIUW9wU0ltTS9LU1Z2Y0JHV2tReU1tdDFudTRxckxTQmRNN2lqd2g3b2Iy?=
 =?utf-8?B?azNML3NqV1FHSUc4b05yQzIrbnVhZm5keU9xaDJDQm9NYWVDZ1N6SGZEVWg1?=
 =?utf-8?B?S2ZnVEdvYnVYQ1RvYnFmZGl3d3hLeG9ZYmRPbjNkNnM5c0VyQ3dzWWVNTDhJ?=
 =?utf-8?B?TisySWFtTHRKdUkyMHU1UTVEZ09uZWpRNGVUaTJxQ3BlenhkM09jWC9YWHlp?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YKiHPtovBv8+/NqX4SLcCuDo9+hk9cA0h0MYVRL/aj620PLLBc31F8hHX7EsYVrm3qIjS9M+yJTS4ycow6LhWigbTFs2DOUtmRNVC5DiefsKsy0MrkCTiDb/1oVH7E1/pE+zPySHXx5oYdMapOx0XHeIN+jejVTerao0LiPsvIaohrHMDUbMNW6Ff0i6w3r3M4RvvI+PpnJWUX289FQ6Kh/prl5+cWjcPiSIWtAiMOtrGQY6wKGYmbqcY1XJjMHy0Dh8Koo2m7C5CB+bS2l/cP8GFQfs2gcYouU4ywMtFWEemrNuOAC/YXmHbLxXRyZRFgx1NyKv+/KdiSUFX4+da8BeojQ2pffoUnZzGlnO6hLychmKyc37b7cWjrhBVk6JOeevEZ0WpQPu5k9wHC0O+lMz1ce7IlcCicP1KcDg3gDgg3sYjH7JxZfcG0MUIDGNkcgtwJU63/0P+c8PlGqznwqT0jNH2E3RumYrjRsXTUf88L/eTSettsIwqnqsidaQCoF/6a7ZFiEeF4KyvCFkhkLvrTmcAO7fMLIaZ0SW/Lwz1+8PeesRv7q3zzeBE9mIydhn913d6dqLotfpFz5zE6v5DUQvgxkHF/z+gw2AgZe9dAmXhEwUYPAZNe2chsZ7FFvgUFf6aYF/XChCwEsZxcCDtAaTgLqDp8lFMF6AbALt+pL4E1za/d7xVR9RR3L0mhx3gwofwkqS7+yT43psUcnmVaDxedJ1B6e/0/LXFb6yeYmspPn87fP7IoIrTfmm9wLYTuH0ozac36XFsJgpdV/gTMw3oSQTQKc7prCLn6hhWTAPJX6MNqx3hTMtkSMFKPfqz8PV9xglP40BOr+hZsVrYM32Je1+jbY1SPxiCFE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5cdc2d-452b-45b0-5169-08db101735ac
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 12:13:27.9303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQ2qHzeuxsoV3pw0DAq/6ai+O2FlCxeM/UjRarH3aap1glXr+qkv7dSxFdueb/A2soZGWy89xcGJZWhjf0+hGpYvvqCYJMuJuvTQHvgelbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6631

On 09/02/2023 10:43 am, Jan Beulich wrote:
> With the last uses gone, move the type to linux-compat.h.
>
> No functional change intended.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>

