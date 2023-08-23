Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 847D7785A14
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 16:10:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589319.921202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoYX-0004ZQ-RV; Wed, 23 Aug 2023 14:09:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589319.921202; Wed, 23 Aug 2023 14:09:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYoYX-0004WP-OB; Wed, 23 Aug 2023 14:09:57 +0000
Received: by outflank-mailman (input) for mailman id 589319;
 Wed, 23 Aug 2023 14:09:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/AP4=EI=citrix.com=prvs=59274c529=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qYoYW-00047V-Pv
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 14:09:56 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbb960c3-41be-11ee-8783-cb3800f73035;
 Wed, 23 Aug 2023 16:09:55 +0200 (CEST)
Received: from mail-mw2nam10lp2102.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.102])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Aug 2023 10:09:49 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ2PR03MB7168.namprd03.prod.outlook.com (2603:10b6:a03:4fc::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Wed, 23 Aug
 2023 14:09:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.026; Wed, 23 Aug 2023
 14:09:46 +0000
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
X-Inumbo-ID: bbb960c3-41be-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692799795;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EAPAF3epERkGQ7DhetVe7AhB22LqjduDKjcThwq8YaY=;
  b=GZGkAH5uNgvrn+STIr5ZoafelFpVkku5764bYBdW2mRqEkfD9YppB315
   yzezMy0k6M1mzaaAVW0dT7R09AweORFT+2OoWrF/c8Fl8vDxCUC04bAhn
   0aymAf4eerPyLsZQbF1scESeQ8N7gX2Tpa7Ch4kbfgLQBnD+Fg1On/IwH
   o=;
X-IronPort-RemoteIP: 104.47.55.102
X-IronPort-MID: 119663041
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:G7LrDq/Zcb7icQFfy+CdDrUDU3+TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GBLD2qBOf6LN2qhL95xa9+09hsFuJ/XnINqTQA5pHs8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKicYXoZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ks21BjOkGlA5AdmNaoQ5Aa2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklM2
 KYmFgshTiqsrL2q+qz8UMtwheU8eZyD0IM34hmMzBn/JNN/GdXmfP+P4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWOilUpitABM/KMEjCObexTklyVu
 STt+GPhDwtBHNee1SCE4jSngeqncSbTAdtDSuPjrqIz6LGV7mc/LlpRdneHnfSGjGqHcPwHF
 0FE4jV7+MDe82TuFLERRSaQsHOC+xIRRddUO+k78x2WjLrZ5R6DAWoJRSIHb8Yp3OcUbzE30
 l6Cn/vyGCdi9raSTBq16bO8vT60fy8PIgcqZzICCw0M4NDhoYQ6phPJUttnVqWyi7XdGjzuw
 jbMsCk3gZ0Si9IG0+Ow+lWvvt63jp3ATwpw4xqNWGugt1t9fNT8P9bu7kXH5/FdKorfVkOGo
 HUPh8mZ6qYJEI2JkyuOBu4KGdlF+sq4DdEVunY3d7FJythn0yfLkVx4iN2mGHpUDw==
IronPort-HdrOrdr: A9a23:85dJQql86DwrF0zQ9GjAnfmHHALpDfIo3DAbv31ZSRFFG/Fwwf
 re+MjztCWVtN9/YhodcLy7UpVoIkm8yXcW2+Ys1OyZLWzbUQKTRelfBO3ZrgEIcBeRygcy78
 tdmwcVMqyWMbDX5/yKgzVRsrwbsbu6zJw=
X-Talos-CUID: 9a23:7WKx1mP9NZFMJO5DWgQ9ynAvNuAfXVaC0E3OZFWaFWVIV+jA
X-Talos-MUID: 9a23:T/gVNQgcVpAF6i6N89zigsMpP+tOpOONJHwxnKoAn/CvG3RMNmeFk2Hi
X-IronPort-AV: E=Sophos;i="6.01,195,1684814400"; 
   d="scan'208";a="119663041"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d+752N9TjkHlD6LXeC0ZVgeFhCwY8SFv87HRCpKEfdxhbm8mX0nEssDOj1HYw4+TzYg46b8XutGJnnBHDs0ia5k7RQCo1nCH4pwE1w+ddwCRoWXRGZUC8+tMxEIycUEePmA4jJ0dgNrXovB2puS/eDeHrmd6agVOmJ4U9GImsJg1hTSZcBWrNHrg0dhLo8qG07voogffK67m+fZPn5oL/m5O60b+M+oJjPR7Blap0mSuRSh0q0ITFi7bErjNIIkS+zquoO11w+zp4loWcRVQzt28jugUaniRkq4s0FYQPnZ1ydoTCd36udYced66s0LzTcgyG4M+LwRJtaIWuqpw9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DMD2cGxup2f5jsgp180LJscr98gtNO5DFaRWD2K9ddo=;
 b=QKR9voS4gEWP8Na4R1VI79rLCyXw2lyUZf8sfL8SXKzyOGJ32/pr3UY3Quri6SYI26px7n/KgSntT0CMtvp2Vn6m3eKnQycnOAtBmexZXQV1Hj+uUM15XTyC5Hth8W2919ETi+YhXIGRw0yBAjYTrAYAP65yuPQS8oDZrMHQchIxo2aV+WNP7aW7oP2d0t8Y3g2wjN3D0SXbkapz7zBgfgbHWA4NsZqp5nOhkFMyLrV4ewux10zuptG2BX8DOa8JqaGKvMnlfz43lgKsKEQ3PwgkWETTo3vr6zSOZTje9L7FKbSoclJOj6flZ6oZ91jS8k/cjX9RzQwyoCJNE4rbWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DMD2cGxup2f5jsgp180LJscr98gtNO5DFaRWD2K9ddo=;
 b=PtCsTLCD7QhIQchHbqo7QwfX01sNSQfLaWU8c+b9dVK3HIBw4xg/6+4QGpg7/+NgPQCBuV7AH8i2glQABF/LvoPIFagNpwbSXQH+yBmTBifuhH3NhCYiKwYHB33x5Ek2GunD8nCtenaqXGku9XDI83oB2HuT1EHhf6vUD2UiCvs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <228007b0-3e19-7a2d-0dd0-7d37a5801387@citrix.com>
Date: Wed, 23 Aug 2023 15:09:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/vmx: Revert "x86/VMX: sanitize rIP before re-entering
 guest"
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <JBeulich@suse.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20230405215245.2137356-1-andrew.cooper3@citrix.com>
 <ZOXqQrFOpofVR_B3@MacBook-Air-de-Roger.local>
 <327109c1-f8ad-f8c4-01b9-ea19dc5df247@citrix.com>
 <ZOYKKS60iWq6Zx51@MacBook-Air-de-Roger.local>
In-Reply-To: <ZOYKKS60iWq6Zx51@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0133.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::12) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ2PR03MB7168:EE_
X-MS-Office365-Filtering-Correlation-Id: 210c32a1-a975-4f94-314c-08dba3e29aec
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jrTK6DHoWZ/xrgUemmLyaspxwL1LLsRoh4z/bSIl68FPQCW/X9g8PccW2Qo8JzQHBkauxvKSWPGwHdVgGjivBpwPCK1EjzO971L6l/JJoqeuQCL/5CmPpuJhuqGl0QpAnXSGWgwb/iDSU7tXmunyEHme5uqkl0xk5Mg7665+krbEk/MOU8inRM9eD47/WO4IcA3eaAy0iQanoRnCkHLoAVGUXbcuQd71hQAsposPmT0xsBBQrIWaFFJgtGI0yokgApcGeEFeGwMQfP4Gpzw6YhrX9RFNxryN1W6sM6wx+XSCCfSSOisQ6R0VXQKnk4tAdLdTNTV4gm+CJ+ZlwCHPkC519Ik/zf3aWhclPFWLs5ZHAER9RK/k1g+POKateOLXlB9UfGNhY8SmeMMOpUtao4D0q+dZ90Q2bkYHP7x2Wo98UWX5IRLHpzAagbMzHyzUJ25ueTAPzbe1XT5ZPBeRxjIEHKyytVd2qLXj78rHxstf08nrw/MckefYwLPpGj9KlqhNEGLA8eN6X51bTJV0rrOj4ll+L+s5JNMQ4AVQMQsfNla7fNqU7cfkYU4uWEzlDwbGS0rlm2b477dqinYTI094BS6QGJlWcfJGurlZVQ7XQTg+wQWMJF4Ndb8GnuUtc+AQFe374+PCgZvDEJtdIw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199024)(1800799009)(186009)(83380400001)(478600001)(26005)(31686004)(6486002)(6506007)(2616005)(6512007)(53546011)(6666004)(31696002)(4326008)(5660300002)(2906002)(66556008)(37006003)(6862004)(316002)(82960400001)(54906003)(38100700002)(6636002)(41300700001)(66476007)(36756003)(8936002)(8676002)(66946007)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGF2Vjl6TlR1aXlKRzltV1czSU5JUXV3dUhjeDBpQ0FKZXRFYS9kbytGNmNa?=
 =?utf-8?B?U1VWWmdFZHRHdDZQZFRueTBMYmZiREl0M0ZudUxEQjR3OVA0NnBCQjNYaDVP?=
 =?utf-8?B?R2JvTFR1aXhCd3JzVTZYdlpwQ3ptcSttQVJXRjlwRG5RWHBhTXN4VUM2L2Nn?=
 =?utf-8?B?RUYvT3FDMEFHZDZmTnJxNnBYcWNLWVJzMjk2Uk9hcWpMbmgrWFFHL1ltZk1t?=
 =?utf-8?B?RkZrbWdXT1NPSFBvMm5uaUNDYzgzeTVTRGF1L1lkb0MyeDdLRTFyemE1RHND?=
 =?utf-8?B?YktvK1lsRlY5ODlVcXVocWlZcUlpS1R6SllBVDVMSG14TC8yb2VmVE44ZGNp?=
 =?utf-8?B?cDBxZEVWc0N4S0oxZDVBV2dRcGVGU1ZjUjBnNkdoTW5vaDUxQ242cmlLV0lZ?=
 =?utf-8?B?MDJndTFzdy9yWGhBK3Vtem5IT2pGMVV1WEdocDVJVGpUb3BZK0Njd0FhTEcv?=
 =?utf-8?B?MkdlNEE1WEw3K3ZQTTVHZG91THQ2ZmZVK21TSmtJa3hEb0pVR2tpSk9qb056?=
 =?utf-8?B?dlpIalNoVGpnQ1FHQlVDMHRxbnQ3UGNHamM0aTcvUDhPWVpkSTJyZXdMdWJj?=
 =?utf-8?B?cmFMdFNCT2E3QUhCQ3pUQzQwY29vODRhQ1gzL1VUTWhsLzlzK0FzR3Zlb3BT?=
 =?utf-8?B?RHlSQUlRWTg0cFhtaFZQOFNRTkxUSnIrZkpzaTh5NTErUXlqRDNubkhkUzhi?=
 =?utf-8?B?K2pCZjVlM2srWGIrWmVZMzR1aThFR2gwTFVoWVkwekVVVjJLSXd3NlcyT0JN?=
 =?utf-8?B?cEFaR0tkNUc1UHZmVzJKM21uWUdTNWRad3pBQkJCN0dXeVF2L1FtOElONGFz?=
 =?utf-8?B?WjdMb1hFNndETSt4V0d5djdQcnNPNzNFd0FaTVIxbFFwUzRmL1VvUmd3QW1x?=
 =?utf-8?B?cS9Ebi9sb1dITWU3d2w5dlJ5ZkhNU0hhOXRic0tZdkJSNXBSZnZ2bmFXNFNt?=
 =?utf-8?B?RGZmRmI3akFzZWhnYmhURTNoRzZBM0Vwald3N0twNmxlVTJtKzlFQkdXNERS?=
 =?utf-8?B?Y1FORFlBcGE4YVAxRWg3SEcxSC95bSsyRTdQdzdvRytWNmtYaWsrTi8wQjlv?=
 =?utf-8?B?enc1bVdEOEJReVZueDZOYlYzMHZkZ2JobXZlY3JoZjMxVWZ4R0lyLzFIQ3FU?=
 =?utf-8?B?Ni9sOWRrOXlzMTZqRmxNRkEzTCs3MitKZytvZXJWZ3JMNzlIRzRhWHFOVUNm?=
 =?utf-8?B?SlQ4aTJia1dNT1BQSitzRnFHWlZGd3RlbU9UM01ZbGlnc3dBUnZjaEo2U3Y2?=
 =?utf-8?B?NFk5NTF0cGxHaHZ0YXk1ZHR0L29Yd1pZMUVkMG95YTVWWDI3ZnROdDRKVWpS?=
 =?utf-8?B?YW5ZVHE2OE03TkozZkQ3RTd6NENMZDVTanRsK01HRlVpKzM5UlFoaTAzMGZz?=
 =?utf-8?B?T2VMaHZhakFMeS9xUVJlUEM1UkdCOHlKV3FpdVlER0ZLNWZpRmFhQ1Jub3RL?=
 =?utf-8?B?VGlFdTZwSDZWSmVQcDZXOVdVRk9ReFRZVkpOL3ViZmtWdjFITkZYa2hUZE8w?=
 =?utf-8?B?SE8rWkFheGtEdWc2alViTFB6OXRKaVJ1ZHRNU1FSYzVkWWlTaTkyem9FNFov?=
 =?utf-8?B?dm04NCswS3JXMWZEbWRCRGp5ZU1qaDdvb1hZQ1VIVXJGQ0REVFNqMFQrZ1lW?=
 =?utf-8?B?Rm1pVWZ2eXEwS0RickdmTDZBazh5T3FMRGRPQmFVMDVxaWMrc3hDMEZ1SDMx?=
 =?utf-8?B?ZDl6ZTFBbDRWdlQybVVFU1ZmUC8vWmhmOE5PeWZGM1JGaG40dEx2bGkveTJj?=
 =?utf-8?B?bTRJT212OEl1ZGRXeTFPRUVqY0lwbzVSaUcwcFZHNkhuWG5RRzl3Si9tbDhP?=
 =?utf-8?B?Q3BiSWtEdk1PVlNkTnFBcVc1eGRRSy9ldys3WFRUYTBUMzRmaXl0MXRkb3Va?=
 =?utf-8?B?YXBVS0Qwai8vQ04wUEk5REVwRURVdlRRbkNOOU56MU10N1diaSsydzdKZUha?=
 =?utf-8?B?R01oSE0ra1JXZ2prNU10OVFVdjVyeUJLNmlGc3hRdTBxQjltbzlOYjN1Vkdz?=
 =?utf-8?B?WVlFTlEwYzlkNS9MbTVhN0V5cGtUMjV4Qm1IQjFZbTF6eHNBU2FMYXFFVUt0?=
 =?utf-8?B?eUR4TDVVdFJaK1FPTmRyKzNJUmwzK0E1VExhZUhjTXpEOGVnTWxNOXp5L2VJ?=
 =?utf-8?B?UmJyc0Zrd0R5RlFSVlFsN2lFR1lpdElibkg2ejk5WFgwR1RRczlkMlFaVmZD?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6H7d+XmS4EOss431eitAy6yjuApYspdKMP2Maa2DfO1BI11QjDCgO9SWpaD3u1HsbjI4KdasaC0iM6To/knG/Dj8XTNnNFvs1JL8ZrCxPOmbshszD7yQkJ1iHkJe1+dhYuNueLZnW8HOJSdqXRp+UOtXZDFdLfRJ2ucG6WYB8T+AgUXK9gWN1gTrbSuaF/TvpDroVVE2lqeaPyA4ztbMrjApohsGGsjr396sOiKD/YoiJFGAJL0h1ufb9dmZmVJT3uMeevVPBLMVgz2bplJ9BZU4FXlfq32cLl5rTAP4Lcyq+UvvMnJrv0cq8ZwXXZpGPPEyTW5XzzqjFvnBtei/iJPUlxoxkS5pzatVfIX/2XFUPvy8o70oC2Vanz2p9auYjCpQpxQNl5TvK/1rjIGD/grwEoOYrb6GLnMKyRoqAekFk7yp/prA1ape2hFM04qCNb31Nvn4EywNMMooAcRSG5Sex0BocWvnESP0Qf7VRBF+LCmUg03ihz8/1UmL44U3K2dTJhugtDhuAMlbhcJAnq3SIm4BjD7MAg1bONZQgFvvYWZSYoULdmFTlEgpOBGsNdDlQONLLCoKRcx8J16P4MG62WmG1mPoKZX1AXwJoosGXplVR5Fs9wkMp90p4OS2A+5ZOjgJyvBjq9MMXSFZFZp1j7chrCM9D43SnYoN0GA4qn6JQ7RCxgK5TIBbQmlCaV/iKJNTtX/7lLcVtBFnl52gvss/hS7SwyaSld61Zs427n0WFzH9WUQtfUtSuE7pq7+e1gQCYlt8FPKTUH43qpVe8iIqwbXClqg9pdImLCWyY/KdGzCbT0ljwtu1wx0UXHon4MpyAu3xi2uTqVNH3Rz8upLoHtYOIk1z4gCgSro=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 210c32a1-a975-4f94-314c-08dba3e29aec
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 14:09:46.4448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoXedNhFsWl9Y3DNqRkan7BWb7kcrSZtzxGUvwLY3FFIIGhVPwLQEQIztwPka128t9pGwlhZXSc+aSsJV6A5byPQh9MJ6MkAzYE24c/W0yU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR03MB7168

On 23/08/2023 2:31 pm, Roger Pau Monné wrote:
> On Wed, Aug 23, 2023 at 12:56:48PM +0100, Andrew Cooper wrote:
>> On 23/08/2023 12:15 pm, Roger Pau Monné wrote:
>>> On Wed, Apr 05, 2023 at 10:52:45PM +0100, Andrew Cooper wrote:
>>>> At the time of XSA-170, the x86 instruction emulator was genuinely broken.  It
>>>> would load arbitrary values into %rip and putting a check here probably was
>>>> the best stopgap security fix.  It should have been reverted following c/s
>>>> 81d3a0b26c1 "x86emul: limit-check branch targets" which corrected the emulator
>>>> behaviour.
>>>>
>>>> However, everyone involved in XSA-170, myself included, failed to read the SDM
>>>> correctly.  On the subject of %rip consistency checks, the SDM stated:
>>>>
>>>>   If the processor supports N < 64 linear-address bits, bits 63:N must be
>>>>   identical
>>>>
>>>> A non-canonical %rip (and SSP more recently) is an explicitly legal state in
>>>> x86, and the VMEntry consistency checks are intentionally off-by-one from a
>>>> regular canonical check.
>>>>
>>>> The consequence of this bug is that Xen will currently take a legal x86 state
>>>> which would successfully VMEnter, and corrupt it into having non-architectural
>>>> behaviour.
>>>>
>>>> Furthermore, in the time this bugfix has been pending in public, I
>>>> successfully persuaded Intel to clarify the SDM, adding the following
>>>> clarification:
>>>>
>>>>   The guest RIP value is not required to be canonical; the value of bit N-1
>>>>   may differ from that of bit N.
>>>>
>>>> Fixes: ffbbfda377 ("x86/VMX: sanitize rIP before re-entering guest")
>>> I think the fixes tag should likely be "x86emul: limit-check branch
>>> targets", since it's that commit that missed the revert done here?
>> Well, not really.  ffbbfda377 really does have a bug, irrespective of
>> the changes in the emulator.
>>
>> The presence of 81d3a0b26c1 is why this bugfix is a full revert of
>> ffbbfda377, and not just an off-by-1 adjustment.
> Right, but taking this patch without also having 81d3a0b26c1 will lead
> to a vulnerable system, hence why I think the dependency would better
> be on 81d3a0b26c1.
>
> Anyway, I don't think it's worth arguing over, so if you want to leave
> it as-is I won't object.

We don't really have a depends-on tag, or only-safe-with or whatever,
and a change like that is stretching the definition of Fixes IMO.

81d3a0b26c1 is more than 7 years old now, so there's not going to be a
practical problem backporting.  For everything else, I expect people to
read the commit message and apply common sense.

~Andrew

