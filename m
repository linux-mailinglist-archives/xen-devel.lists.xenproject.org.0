Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A01719A36
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 12:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542395.846201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4fx9-0002LJ-GO; Thu, 01 Jun 2023 10:54:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542395.846201; Thu, 01 Jun 2023 10:54:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4fx9-0002JN-DQ; Thu, 01 Jun 2023 10:54:47 +0000
Received: by outflank-mailman (input) for mailman id 542395;
 Thu, 01 Jun 2023 10:54:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bFRJ=BV=citrix.com=prvs=509590c99=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q4fx8-0002JH-Bl
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 10:54:46 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b70a5dc6-006a-11ee-b231-6b7b168915f2;
 Thu, 01 Jun 2023 12:54:44 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jun 2023 06:54:41 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by PH7PR03MB7105.namprd03.prod.outlook.com (2603:10b6:510:2b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Thu, 1 Jun
 2023 10:54:36 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 10:54:36 +0000
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
X-Inumbo-ID: b70a5dc6-006a-11ee-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685616884;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Jwe6ZtnN40qjWXcllSwZFjd4swt/6oDjIqEonf2FNvM=;
  b=gSRG7hYpKtPkOBbyoKSP00NTUU+b8aZFJwpMZ8nAik3V//xhW6m3Q1xm
   eIlkUx0Y3c+nImWWPPgj8UpKTtCcMtjc/TFO61mstgtkNODLj9P+r3gCs
   JSzFUVcvYy2pFnMzrgR2euK3d0mtVWjL8Xlao5IR/+hNbH/bs4oUsQrnv
   Q=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 111095026
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:Nn6HX6yZcOTokjgCgWR6t+f3xyrEfRIJ4+MujC+fZmUNrF6WrkUEy
 WAcC2mHM/yJZTDyKNwlPIy+8BxX6JXUz9NiTFc9riAxQypGp/SeCIXCJC8cHc8wwu7rFxs7s
 ppEOrEsCOhuExcwcz/0auCJQUFUjP3OHfykTrafYEidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw/zF8EsHUMja4mtC5QRgPakT5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KUZV0
 ew3MQJXVze4l8iI+py5d6pSo8t2eaEHPKtH0p1h5RfwKK9/BLrlE+DN79Ie2yosjMdTG/qYf
 9AedTdkcBXHZVtIJ0sTD5U92uyvgxETcRUB8A7T+fVxvjiVlVIhuFTuGIO9ltiibMNZhEuH4
 EnB+Hz0GEoyP92D0zuVtHmrg4cjmAuiAdtKReDgrKACbFu73nA0VT1PXEqCvd65qhWDBfsPG
 34Gw397xUQ13AnxJjXnZDWxpHOGtxgQQd0WDeQ+7AyPzYLf5wGECi4PSTspQMwrsoo6SCIn0
 neNnsj1Hnp/vbuNU3Wf+7yI6zSoNkA9L2UPeCsFRgst+MT4rcc4iRenZslnOL64iJvyAz6Y/
 tyRhC03hrFWh8hb0ay+pAnDm2j1+MiPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOvBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:4rOl7K2finzoFJqs4YKK9gqjBKMkLtp133Aq2lEZdPU1SKGlfq
 WV954mPHDP+VUssQ4b6LK90cW7L080lqQY3WByB9eftWDd0QOVxepZgrcKrQeAJ8T2zJ856Z
 td
X-Talos-CUID: =?us-ascii?q?9a23=3AonpMoWmYRTNH8Rsk+I1ydKIV9xXXOVrG6Gf/On3?=
 =?us-ascii?q?iMEFSWJerc3GSxeBatsU7zg=3D=3D?=
X-Talos-MUID: 9a23:KydPMwnR0NmzhROdNmzSdnp6KOA1w/2nGXkRtpUm4PTaHHxACSWk2WE=
X-IronPort-AV: E=Sophos;i="6.00,209,1681185600"; 
   d="scan'208";a="111095026"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsNs5p5207mPa73tY3a+fn/T6QykI2ae9H41OCvUuB/vpNeMmEN8YqPvb3vQp+dArC6LZLIqi5jPdVUbXQoAG38I+qFLgovOWLmfNH0HH1DgQ3BELUkub4xBEDC8GUod1wuSEWU4k9A1CziAyPaZnvu70qH17uDsNTyKjefDvM+8dNbWaxNDKZKT4lGF7zDOLCeiJ3FLnFowBlBqJP165yjIMqZqEGbPV9SaU2ir1VEQaR8oq6MRjshA+nBwEMX/I6VQubQhgyPu0zSeDwKjVpGqezCJFmPjUhoWwRqYNpm2T/P1LDUDws7oVor2T6B34RAKF0jolA/RMiJdlF2hyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7iCHkhEgZK6Nu5+eGx1P400PbN8WLgPCnJNN0Rk7HTI=;
 b=VhxO9Gko0VkusGbhnM5BbhyR7AQ2Y7715sKMPoY5/4zfqZZ7Tu7WcvNy37jhOiAmnfgISnIHZ7pigUUFPoRk2gDlEZ9QG3CXqCRJXHzBujuCnnmzvesW3cZ5szvwHdLWoUc2JxSAa3fxRYg3Jhj8X+FfvKMug1g12pcHPtKliP1KAj4JK0fzxqLNHwG7KXPnzB04j+i72s38P3lRH8RVBMbbIPLAGe3YgWpxx0OF71cqbSzMeAeSVdcp6JkM7AQSQBkKUnNunWjF0Tr8x//F04Qu6xqfXaqW2T4fXBarJgBF2nzDDXaQFJVwMgPKtC0SaVkiZfidJIx0zaTJJOcUWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7iCHkhEgZK6Nu5+eGx1P400PbN8WLgPCnJNN0Rk7HTI=;
 b=FqYoO2YklVsEF0UO2eStHdTeSj8FMB9wyk2dIiCAX6nS1MY3y6YJdvKHoVgvQcHxVBjJ1n1JnNuCjnJkoAc7p6/LTCL5kIfMfrxp79xE+mdfBvymbhs+Lg3NX+YqtgkIwH+Gm2O4/1Sw7ZCzILGCulfsNsw69zn3+oJWbl22qLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <83324533-38da-b5bc-875e-a161d7501eb5@citrix.com>
Date: Thu, 1 Jun 2023 11:54:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/microcode: Prevent attempting updates known to fail
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230531175119.10830-1-alejandro.vallejo@cloud.com>
In-Reply-To: <20230531175119.10830-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|PH7PR03MB7105:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c172408-8f58-48d7-837b-08db628e96cb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x8HBafVHShlrKNSFPBy0iJZLr5T48cqbx0ZXe/MHZELbwO8MnExc6AWSIhNTF60jVlhx7i9mxlZTsXVo73nvIOlyFGLo0wrQhA2Mmf3fve69EkQuAqrDi385r/nMXKmNX5/STaYhzz7bc9ikgaPblYt9+wBFUdW90DJMHhUE2z93/xIt4oKWlA2UA9mlPEHLBLwOPx9J5mKvRemITd2FIVpML2AI7mWkt6e26CrjMaR9b/tA4ZVj/5h5TcbKX5QyCPtq15v6xXVTSvXsoHoprS8vVwFG34Mi3QZ2S3f6ywnIWHuo7nd43nYv9N12XDO9clvDdn5RJsIdw7aypOO7LNOrIIC+dtzpyc73qyl9nCbUAOPW7IDgYMWovnHzEHNwJPnsAIuZe8ICaxQwxY2DXAhV+hfKJMoqTuF/CcDLxrYSJxXHcWwBNwVnxh21JeNm9IOJqNmKwwVuWwPwk2myr8nKbwekXkCch+CdO6Z46XS1jtj11/6yrDxix7p4iMiHOWb59VvjXLK9yUl0pxjPdk9Hwb2UTnIrwVCXbSr5GT6tH/rxfCP0D+Tcxt1m00y5ciJvgM6xgoE127qj5cfhyXSsoiJ6lD0+69GsEfOcMK2S8bX0vYmVZrGaMTWw0HiV2XkYJVQIsSpdAqecWJJcxw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199021)(2906002)(15650500001)(8676002)(8936002)(83380400001)(41300700001)(38100700002)(4326008)(36756003)(2616005)(316002)(31686004)(6486002)(66946007)(82960400001)(66476007)(66556008)(31696002)(26005)(86362001)(110136005)(54906003)(6666004)(5660300002)(186003)(6512007)(53546011)(6506007)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1A5MFNRbHZrNGRnTW9VWkx4RUN4aEFDYXpjdWdJUGczZkIvVVgwZ2w4eUxa?=
 =?utf-8?B?V2pHL0VyTzN0aU50VFZ3bTMwK0NRVjVpQ1dBcXBNNVIyaFUvWGVIU0xQeUQr?=
 =?utf-8?B?d1NXUEhTUlpuT21tTyswcEFWRGZxUnA3WTZlbVQva0xsL212Rmt2ZEkyTVF0?=
 =?utf-8?B?c3ZyU1JjbGl5ejN4bTFIZmlKcFZHaDdkQTlKbUM2ckZDL0lFMUErY1BSYjFp?=
 =?utf-8?B?eXYva3RHU2RaNmhncE9YdkVFVU1MZjRZQXNUR0ZEbTZsNUR3T25JeUFXMDI0?=
 =?utf-8?B?RExxTTFGU1ZUOUUvNXhMZ0tCbzFMRi9LN0hQMEFVc05KMkFFRXpKbG4zQU05?=
 =?utf-8?B?NCtoajRmd1NJSndXQmI1ZGV5eUlYN09yUklxcFZTeFU3R3liTTY5VU00TEow?=
 =?utf-8?B?bzltbDFhQmhibjVXSi9TSzRrTW1kb1VHa0tOQWpTYjZhK1B2UDhPa3dNM3NJ?=
 =?utf-8?B?Z0pzSFlPYjVkN0pBdWpHQjgvd3pTbjNtNzFaRmdXdDhHRWQrb0thVG1qQTVP?=
 =?utf-8?B?WHVwY2xkZmhHZXJERHFVVy9ob0JHdktqSVpJb2QwaklzSW5zb0F5QlI0VGpG?=
 =?utf-8?B?N0I4R2wxYXZSTnIxSTNKSFJDVUcyR21SMk5FTDQ3VFZYZ3VyVFdVbVNvUTNq?=
 =?utf-8?B?VEpnRHZtSENwRFQ3Tm9LcHQ1QVFtczlkc1k5ckpPY0J6ODVnc0hhVktJQ3U4?=
 =?utf-8?B?bVZNK2w2Y1lIL3UvQ052M2x5Y25jd1hOS2N5aFVrSlViRXdIcnltVldxYWVv?=
 =?utf-8?B?S0psT0RaZENoVThvZWJlcUo4MzJMN1AvQ3ZvcnVXSnlVVXlHaytEeFJJV3VV?=
 =?utf-8?B?cHlvQzRkLytwMTE5ZzZ1R2loUE5FNjN5eGtZdjhiekg0RzBIdzRyVFg2dmtl?=
 =?utf-8?B?QVMrTWFiRWVrTHdRZGJBMXFzdHZha00wakZYSXpRZGlYazIwR0JST0VTMHhT?=
 =?utf-8?B?SlQ5MXFWOUM0enc4bTNBMzRsb25DZjZWbGxzRDJlWmowTzZURFZQWmxvVEtx?=
 =?utf-8?B?SmtDdGxkZllQNTJGSUU1bDdLeWRzSEtvL1F3UmM3aXR2aW1IWXZIcUUybzNZ?=
 =?utf-8?B?ZmgxWjhuSExveDkwL3ZGRFZKcEU2TXhMTFpKY3hDUmc3d1pTQXJ5SFVLMS9U?=
 =?utf-8?B?NUJRbkw2cEZFRmlJZ2orM211QVI2ZnZ4elExcjczY2FzSFlYcWh6WHE2TlI3?=
 =?utf-8?B?d053V3Y1WTFkckwrYjFZYlk5ZGsrTVVURDBXOUJSd1J6T095L0o4b0g1bU5p?=
 =?utf-8?B?OGhleERyZGNrZVZjOVVWcHhZTzB2WHZlanczT2UzUlp6ODltOEROUzN1T3dv?=
 =?utf-8?B?V3dCNDAxQi9icysrTFhDNDdiTHRSMHZuU3N5bXBCcFhVOVFtV0ptTy9kbEVY?=
 =?utf-8?B?T3NTcm1pR084SklKMFBMZjZlV3lXREVIWDFaVjdKWkJ2eGJzcnVUeXdwWlhE?=
 =?utf-8?B?T0hhUVgxR0dnc2VzcFBZcmVGbXFSLzlOR25JSkNsaTZ6dUV0YkpFV3kyVmVu?=
 =?utf-8?B?dWJPYlV2SXY5NFBsQ1FSWm5iTDlubzVnSWQ2N0E5TlhQQkN3dFNKWStYRlNY?=
 =?utf-8?B?ZzZGcUdCTjBJdEZKS0Z1Mm05ZktOV242ZjZubGc1amM0UmczQndJMDRFSXlX?=
 =?utf-8?B?Z0hnRUlDY2pzR0wyZWRUeW5POE1YKzNacm42b1dLTWNvc05RTWtDZnN6amh4?=
 =?utf-8?B?SlI4Rnd5K3p6ZXdncTQwTFV1SUVoWnIyUS8wSU55TlFDMUVtUk9qdW5DVWFW?=
 =?utf-8?B?bmg0bnUzOUlHbmh0aS9KeC8xTEphVjNpalgzaXJUd0VvSXRidHlUY3lZNVU2?=
 =?utf-8?B?bmxtc2ZUMzZ4aWkxZFhyZjhrK3NDYVF3VUFwUmMwTnE2NmRxL3NqUDFYR0hi?=
 =?utf-8?B?T2pXZnM5RzZEK0ZKM3FUSUtBQTlqYVR1YW9PTVdUMnFuNWdPME9FdVN3cGpJ?=
 =?utf-8?B?YmdTY21HNFJZVkh2aXY0dGdXc05MK2V3SzNnU2JKN0dYZ1lpK2lQWXhkR1Ey?=
 =?utf-8?B?MFRmUE1rTTljTExkSTNpTUY0RFFxZkgrMisxZXFWRGFYQlB1NFZnU24zWHJY?=
 =?utf-8?B?bkJoNXF5TTRhbUdxNnkrT0FnT05LOGFNZ0djNEZOYjMrdjhHZytwVU5QZlJS?=
 =?utf-8?B?WDZvcEZOdEFaRGY4aWx5K3MxWUtuRnd3UlN0cVNvSzhGTlpneXNjS3lZT2Vp?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	KR7f+7jBNz4f/xZaHQVKjYS/InS8By4SUdhjyDclamgykm4AM/Bg7pRyuxJK1PdeEhulgrDfAEPOltpUem49i9u1jNNG0LQ9uQglsFxxMPNB3Jy01XEuZunA06TP1bML2NgfWKHfM5NwEo//bsbZJcdjvG/lPLP9KWOlMtOfvkjr34+vYYd5WQ+vbVvCxljmUKhNZdMtEkTrtSD1nZ4bP5cd01sT5phTEFh/9rN9mptSuAa9NB+/49vcQtX3FZ+eUqh8jrWNcxscFPM8GNvvX4my+DNHRzwRPs1PfeXAtEWm2GXg6dWOBQOL5Yf1toYesRaXyQIn7ZRQlz+3cNcXAeDxhrRJdksOGIPVxHOl5hL4ZQ0x18thZXvh8/NNsuRm1/COqPhMJ6m/A0Ex9klD0QUxblsSceoOX2RBOVa9WYf6noSyv8sXPhdktDeQk8TiYQ43GlpABDoa5GKl5fRegd9yznzqMgffKhlbLweyiF2LylpNJgm3DHg2K4Vv3UqJ9cB9rzV2DbaaDDb+3QqR04sqa3AeyZl8+U2GJOEtEI0xgJ5MfDylbTdUMd0fd7sNpJZKyIZIedwtOozHOhqxWPmY1ZR7226euggfFprtyJ+0sl6jFvyAp1vcNf7CxmrQiG/WZ+K+HlKfuEPwLX/09KZ2AXlD1gjafWkicIkbxDaCyIr2eJOgoxbVruHD9DYolEKm3Yu8LOS7bgfwCoqMxC+o1fp33oQzEorOEHYuPco+x6wHRUGSWOP6g203o9oQ/rxjjianfZY/26nyvRP5QnMssXwDXLSnERp5RZ4psRB5UxlI3BAKq1W7hY7Z+vfweWHbpC6SvBAAJUxmGg95Rz4QooRPPkPjv3MmV26apn4=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c172408-8f58-48d7-837b-08db628e96cb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 10:54:36.0910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htQtj3cR2nJLB6R9BIkYPtcBba+Vw2kS73caobEuUgMusmkHeWHo9/ySVcmTnAJBJXnw4H7eKfINNL1cxA1jTT3GUDsuqEpyTCD6RG3DTSs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7105

On 31/05/2023 6:51 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
> index cd456c476f..e507945932 100644
> --- a/xen/arch/x86/cpu/microcode/core.c
> +++ b/xen/arch/x86/cpu/microcode/core.c
> @@ -697,6 +697,17 @@ static long cf_check microcode_update_helper(void *data)
>      return ret;
>  }
>  
> +static bool this_cpu_can_install_update(void)
> +{
> +    uint64_t mcu_ctrl;
> +
> +    if ( !cpu_has_mcu_ctrl )
> +        return true;
> +
> +    rdmsrl(MSR_MCU_CONTROL, mcu_ctrl);
> +    return !(mcu_ctrl & MCU_CONTROL_DIS_MCU_LOAD);
> +}
> +
>  int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
>  {
>      int ret;
> @@ -708,6 +719,22 @@ int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
>      if ( !ucode_ops.apply_microcode )
>          return -EINVAL;
>  
> +    if ( !this_cpu_can_install_update() )
> +    {
> +        /*
> +         * This CPU can't install microcode, so it makes no sense to try to
> +         * go on. We're implicitly trusting firmware sanity in that all
> +         * CPUs are expected to have a homogeneous setting. If, for some
> +         * reason, another CPU happens to be locked down when this one
> +         * isn't then unpleasantness will follow. In particular, some CPUs
> +         * will be updated while others will not. A very stern message will
> +         * be displayed in xl-dmesg that case, strongly advising to reboot the
> +         * machine.
> +         */
> +        printk("WARNING: microcode not installed due to DIS_MCU_LOAD=1");
> +        return -EACCES;
> +    }

I had something else in mind here.  Right now, this will read
MSR_MCU_CONTROL and emit a printk() on every microcode load, which will
be every AP, and every time the user uses the xen-ucode tool.

Instead, I recommend the following:

1) One patch moving the early-cpuid/msr read from tsx_init() into
early_microcode_init(), adjusting the comment as it goes.  No point
duplicating that logic, and we need it earlier on boot now.
2) This patch, adjusting early_microcode_init() only.  Have a printk()
saying "microcode loading disabled by firmware" and avoid filling in
ucode_ops.  Every other part of ucode handling understands "loading not
available".

In terms of the commit message, you should call out the usecase
explicitly.  This feature is intended for baremetal clouds where the
platform owner doesn't trust the tenant to choose the microcode version
in use.

Also, I'm really not sure what your 3rd paragraph is trying to say.

~Andrew

