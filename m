Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5C66C6998
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 14:34:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513875.795554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfL5O-0004Xr-3o; Thu, 23 Mar 2023 13:34:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513875.795554; Thu, 23 Mar 2023 13:34:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfL5O-0004Vs-0j; Thu, 23 Mar 2023 13:34:34 +0000
Received: by outflank-mailman (input) for mailman id 513875;
 Thu, 23 Mar 2023 13:34:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k1NO=7P=citrix.com=prvs=439d27799=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfL5M-0004Vm-OS
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 13:34:33 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d50ed05-c97f-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 14:34:29 +0100 (CET)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Mar 2023 09:34:16 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by CH0PR03MB6001.namprd03.prod.outlook.com (2603:10b6:610:e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 13:34:14 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 13:34:14 +0000
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
X-Inumbo-ID: 6d50ed05-c97f-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679578468;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ohgbkqq5ErLSp2I4RdJRJG8DMxExlUBTzggKv4tuSfg=;
  b=WcJ4sMpcjbb+WBrrlJ3hyeDwXs9+QBglbuZ1L2XgpUukDZqWD4HYsjsQ
   5JmvL9ivg1uT84SL5lvTTAI5VNN9zUeItJgXHwzWVTcXJyb8S4vHJeeH6
   5o8qIu/5Aw6gmSDTxeCO2p8gtcgktPVOm90CWdNTtVNzj+nfKYHKBr7k4
   k=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 104440167
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:wf8DKKOqaoCYRQzvrR2VlsFynXyQoLVcMsEvi/4bfWQNrUoh12AHy
 jcYUDqPPq3eZGXwf99zOoWzpkJS78TSmN9kHgto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5AdmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tlqGVFw5
 8A1Exk2ZxWqitKmwOKiFMA506zPLOGzVG8ekldJ6GiASNoDH9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PVxujaCpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxX+nBNpLSuLQGvhCsVOd3lc0CwEsRV6j/KbnoUq+a9FhN
 BlBksYphe1onKCxdfH/VRClpH+PvjYHRsFdVeY97Wml2qfSpgqUGGUAZjpAc8A98t87QyQw0
 V2ElM+vAiZg2JWKTVqN+7HSqim9UQAJLGoqdSICCwwf7LHeTJobixvOSpNvFfCzh9isQDXom
 WnU/W45mqkZitMN2+Oj51fbjjmwp5/PCAko+gHQWWHj5QR8DGK4W7GVBZHgxa4oBO6kopOp5
 RDoR+D2ADgyMKyw
IronPort-HdrOrdr: A9a23:pYEm2a+xU5tL8TdY1lBuk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-IronPort-AV: E=Sophos;i="5.98,285,1673931600"; 
   d="scan'208";a="104440167"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MHL64trQMUwm04gKKWb7zBlac2KXMT+HS3AfbwQNlcbyCOd4q22n1yw2epbIcuLQVS0xTDb0SE2vKaXi+O6dywMhA/psBPnRghUSuAdC1Wl0v/oInyurgTFBtejKpP5JdHNqqkxfd4xd1NdU5Dq+qPzFd83IvFWUOCzdpyyOoAzov+r4TbumRND5usvEdQYzQbEb6Rx1a+5s+m6VK+0Bp9+cJQJq4Y2EnzPhBraowLn/mWYfcr7fNSQWuY3a5lE4uQzKGBylIqQ8xNZVqPO8t5YOyDUWVRD004eU0nrFvgdgUzz2fsfIOAkwnfHSxj9yuWLz/BTR72dkSyCuBZFzrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ohgbkqq5ErLSp2I4RdJRJG8DMxExlUBTzggKv4tuSfg=;
 b=a9IRXKF/YWLPLa0pg98cmxehKCl5u+N3ivEL6EEYmzqSO/Hku7zaXnbkYC7otui2ZGOhMiKuIl+VQKC3VceE1u7aFxTF52tdf/4m3VqGdO2fz9mwYLKwOS3FeqhVRHcHB0Hud16nz4HSXwlKkPKS75yCP6zIJ4vvJhP5UCBsvdX4t5mCHkfBoh8+ytt1Ze/frk/WKUw8JFo2AzvHdtJQWDqW3lfMA1430h//usdkDFdbTPDGhkMWuY0uW2NeG/RwG9fv7bZEEyWtf7G9LahFq5/vo8MO/aoYeHF8flrlAOnMvCKNEwEGQL0ucFSWZX+S9POEdEVOSR91zWhObCGdpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ohgbkqq5ErLSp2I4RdJRJG8DMxExlUBTzggKv4tuSfg=;
 b=sYm/I9YRNTU2nVB+TA0u4WdGK1YF+tWvjXXAC2HMlT78dkNr8xWToHqU0AY8ZWgYVQe4NUoFyYffmipO8inLHg8rWf+LfBFDsZueqfK0sRmProIeY8+VavXEb1Q2FIstsnkf1nAxGefnpAqg6V98kh3xVSq8N8x05VrXGLMMSRc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <f7db2eaf-0038-b2b0-19f4-8c6a95691eaf@citrix.com>
Date: Thu, 23 Mar 2023 13:34:07 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 07/16] x86/shadow: call sh_update_cr3() directly from
 sh_page_fault()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Tim Deegan <tim@xen.org>
References: <dd9205b8-63f0-b1bc-f2b8-50d5da2bf2a7@suse.com>
 <69304929-de84-04db-04f2-8faffc12ef0f@suse.com>
In-Reply-To: <69304929-de84-04db-04f2-8faffc12ef0f@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0650.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|CH0PR03MB6001:EE_
X-MS-Office365-Filtering-Correlation-Id: b2dbb93c-f7e6-4e20-b689-08db2ba34ac1
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k/qenjjGNTlQkAxSa9Fkoat4MKRGyoyC7yRK2HDnNwpURnBRPpYhVxF3uGk1cuJWF4OHtXrGWAl9YA+CWaHYTjFzsn1ZcZUUPxYbmRQVpHUxHABKoLCiUkCalq8f3mudhMzZwM6ct1IU/uKApYanB8iVYECfGfKOGAb+9YoUD4C+e65W5GOedzMlIiEtQ+GFLiRkGheNIaN6pnJN9M17Rtkrr9m7JUG8ctpob2pk+Eij0wbzuFAMTK0Pmeh0aMVG5rAboKP9NKzj30zxPonchfxVVLBxbXnXuhQ9c9iRV/YSJ5LNcyKxKNjzxwjjy3khLiHtdJZDDkvGEk1htUUnYw/uGgIoHNnoWDKxJxFr0iC0aODPPXvWxx0ZhdZ74+p71WN+cawZKW6CWw6SlfJMUqSLA+xzs0BrCv0su4yixJvsMMTU51d4Pa+ByS7MXSi2UyZz4fkNEwNAWv/AhR54EZMzRh7KcDsy2ZtPWKwVo73tnaK1vjuCw5RAdQrHRR1RIPyHgBPzJUJs3Olhgzu6tW9I3rx8rwfxLeWq3IrjTYN+GyBxC21wazuIkjxVEoke48mik2GrK023NuBhqQRuF8TujRvkeYbddVLNDpwHpG31UpXOHQLG4skQxsfc39CsWUaEtFQtSbCEo/DMp+SXIMuZA6mC6OQHcS//zs3aAwfWmIRU/KJ1345bLqMF18nWeMTi/U/e/Z5WfOO/FsbU+d3eWB25Sb6pmzZN0twUwQ8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(451199018)(36756003)(8676002)(4326008)(86362001)(66946007)(66556008)(66476007)(8936002)(41300700001)(478600001)(6486002)(316002)(54906003)(110136005)(2906002)(5660300002)(82960400001)(31696002)(26005)(38100700002)(53546011)(6512007)(6506007)(6666004)(186003)(83380400001)(2616005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUtNMS9lY2RrdDFoa3FpUnRrT1F5RVpnOVNvdG1HZTNxMVFTeEtoVzd1Skp6?=
 =?utf-8?B?dWJ0aDBEcFdsTElvMVpXRDhtaVA0aTFNN0EwWkFnbnVjc3IzdW1NNytJWTNa?=
 =?utf-8?B?K001S21qbVlHYVZTazJSb2pnRzVzK1IzWGtKTXA5V0JERWZtUG9HeEF0ZkRZ?=
 =?utf-8?B?a0gxdFc1cklURmJXQTlPdUNESlFmaFV6c01kK2RSQngydm4xMGNtS0FzSHdu?=
 =?utf-8?B?TWIvQ0k3VFdyYVNLeS9Tc0xYamo2cHdyNDNUWlRjUjRydkpkK1hEdEZqU2M0?=
 =?utf-8?B?a0hLS1dJL1RjcVVKVFpIcGEzMENIY2tQR1g5TlF2aFpQcGRZZE45T29hU0JB?=
 =?utf-8?B?RUh0UVZWNTViUlVmcW9ZVERhYk1uMUZyV3F3WVllWGU5WkowL1cvME81UXNG?=
 =?utf-8?B?eFBodTRuUXQ3ckFUTEY4SXRyWjBjaE5lMTJEZ3Mzcm5wc3hDaXJ5R2tybkhD?=
 =?utf-8?B?aEJkeFJSMW1DdlFQZjQ5cmxnMEpMbTNTN2Z5VGlnQWxiVnYyZy9kaXFiSGxn?=
 =?utf-8?B?OUtpZENQcW5xOWp4UDh0VHlLcnFjdGNwaVFTVWhYcS9WTjZzRUllZEZLWnU2?=
 =?utf-8?B?eFNFVE9YU1FiUVEvbHFhYVR1Yzd2dlRDbVdkZjljTVY4T1kxYVJubXhDdlZz?=
 =?utf-8?B?c2lhSk1ZdVJUeGNTdjRxVisvOEswN3N4ZmEwY0sxTXRWY3R2UU9aWkpIdmZs?=
 =?utf-8?B?YmtTWkNvSHVGTDEySHpFdUhaWHQvWGtqL1ZtUTZ5VktzaVp1UVlmZmkzOEx5?=
 =?utf-8?B?WFpmanRxbmVzd2FWZGkvdGlPT1RmbGt3RHNGYWJmY2NyNXA0QXRlaCtGaEVP?=
 =?utf-8?B?bGRKSjNDa1dSU3FoMURhNWNGa2VjSThRMi9zV2QzYTIzeERMQjBYQXdOSXo4?=
 =?utf-8?B?YTNVaVlBUDEwRWowTHROcTdiU290Y0RpNDV2Vk9yWXRJaUJ6NlBKbzFEYldC?=
 =?utf-8?B?dDJkcnFGOWI0em5GaS9TVCt1VndVMjRXbkJRWis2V3dERlAvanR4YXRkOE9B?=
 =?utf-8?B?Vk93bnRFMGtsWDd5NnNIS3hGdVd1dVdBMVJGUFdrR1VTZWcrWXVOeUQ5cTdz?=
 =?utf-8?B?VHRtRzVXTnUvQi9FMEFmNG42MWdVa01WY29UMjZwajllUVo4RUxCYzZIMkF6?=
 =?utf-8?B?VWREVFk0TW1Wa1M5NHFTKzlhREhaQUtvSWY5MWY2ODZDOVl2bjdwMENxcE1L?=
 =?utf-8?B?NThYQjh0SDZ4dkYvcDJaeFY1S1Y0U0hMbWZUalc5dittNDhLMUV5Vy91Qktl?=
 =?utf-8?B?YWUvNDJaTFFveVNqOGRRZGJZbnluMmpncG1sWEJwdE1yZkxpd1NnRk5CQXNa?=
 =?utf-8?B?MDg2SndZeFdXMnZ2Ym51SnkvdFY0UlZGQTdlUkgvcWxMRFQ4YUhCNTdoeVc3?=
 =?utf-8?B?a1h4NEUvakVJMWdyM0dNeDBmQmJWemxOVFdCb1BVanVVZlFUd2UwSmdTelRi?=
 =?utf-8?B?VFZ5TEk0V3dhS040SUNocDcwVCtzT3JMQzIwZEpoS0ZBblc0dGNrcm1ZelJV?=
 =?utf-8?B?NGwwbFg5NWJ0OURwZ01pbkJZZ3RnWURHQ29PdnpBQXVReElBV2RpaXhRV3pr?=
 =?utf-8?B?YzZiOUFnNG9DSXUzSDlDM0ZXayt1QXpyb0Znak1wMUNNTHl6UVN6bzBkWlZi?=
 =?utf-8?B?UUdsY1RGamZ1cHVqVlhzOTA0ZCt1WGwyeFliNkJqSHRXMUlJZXlOdGVDWnBm?=
 =?utf-8?B?RTBsaFJyWmFKSGMrN0psSFo4cGRYY1BsZUZacE5tSElIajYvZUZvYXJvRTFy?=
 =?utf-8?B?OEIrS1piaUVobXFxaUtOWkJJenlicytmeEc3TVFoN1J1Y1dnQUdibzRWTDd4?=
 =?utf-8?B?ZEJVdkVObTZuU3I1SjBza0VqU3ZCZXFXcUh0cEFpWTc1T281c3B6UVFnenpP?=
 =?utf-8?B?alFubmJYOU9aVlh1UUNaakMwVmtCMlVwZ0o3SG9ER1J1RlpSOWlockM4eW50?=
 =?utf-8?B?Nkw5anZpTEZHZ253c3psTWlBNGpzMkYwMlV0dk1JR0Z1YlBwYXpRR0tCalNU?=
 =?utf-8?B?OHZYOEw4ejV0MDNpRllvd1NjbGZUdnN1RXd2VGllRzR1NUxjMXlxRjFjWW95?=
 =?utf-8?B?eHdKeEJ3NFM5UlZlU2JBWHVBVWswWXo3Z1p1WlFKTy8wUVZIZDVvNHowYzR4?=
 =?utf-8?B?ZzEveS9aTzdESEdaUW5aZFpiWFB1OUFRRXBreDgzWStkTjJTZEdtNTJxWGdv?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	0ASu6Hj8f4r7obQX1YqcXpAQsii0zmpGSjMsht7wXTY5cNYfhdDnnffVjVm8+ZYgBwavYyDAqwkZgNTZSLkhSZUzwt0qN7rHusNAZjgzItKb+vPULE5V+xyXjyhUy3zxeRaM4jfrEyhizMJT0+M/9gPCQZtLqD0cF+xmU2lwhvGFsUyYSm9ksGdZPUTqXsjX4JXBOvlgPCawBz+ZZl5P5gxoJhm74DMnkJ6m0u12ROIkRHS1YDJkOkSvsfGlksxIwbmI8gNz+giumSKRLcEzgkMBMf0XT548OMGGiArvzU2+c61sjsWCxQsRhL5Y8xdBt1hVZCQyL1+IDtz5sAgRg4RlfoNegcm794fgpVwZMUm4NK7hrbu3qc8UN3DscsC9IV4qma2nDmAnND5LpCGKxf1hkyx6ZwEeuV8PJkTf5A7mOVyJe8kvujFFfoUdhtaMNEElLIGAQaIn4Lv9rPewHgXruyMdz7VHEgiw5xZEmUXynmZ28j/+jgBK5kAQ8CdGKjviFlwMmfccKTuiFZ8HiXgd4H/Ivr19ablUDvdL7wotWpehzYPtF/3urx3iptuNCWNLYMEholrsW/PcjqED4D6pRG+nRC1GRGKEDYstDtjACpr/uC3R0sm9u2Ggea/hlP9pjgm7qSsU1RuZV5IoyMYX+n3rHP+99BlG6psRJvRdC0WW1XmTulCB65GGkIfBEkpHBc0AY+q6W2tLDYExcSMhFNSOKHAGdx+dUXjn16L8TQFh1A6Wm17Rk2bp15fjQLWOP9TTH0VYJJwlpeIhJxhcCjPXXf7nHH851ZF/yePvAekyigCHaiBDliVYo7fY
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2dbb93c-f7e6-4e20-b689-08db2ba34ac1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 13:34:14.0210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKDAUIojqITGG2Y/3tOidSjAD099C/T3kwfEGfI6yfL5UoLLpiFoik5poB5dar/3l8U+vY4zIFaDUcPNYlE7XThlxtj2bmjrMoStwvj+DaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6001

On 22/03/2023 9:33 am, Jan Beulich wrote:
> There's no need for an indirect call here, as the mode is invariant
> throughout the entire paging-locked region. All it takes to avoid it is
> to have a forward declaration of sh_update_cr3() in place.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> I find this and the respective Win7 related comment suspicious: If we
> really need to "fix up" L3 entries "on demand", wouldn't we better retry
> the shadow_get_and_create_l1e() rather than exit? The spurious page
> fault that the guest observes can, after all, not be known to be non-
> fatal inside the guest. That's purely an OS policy.
>
> Furthermore the sh_update_cr3() will also invalidate L3 entries which
> were loaded successfully before, but invalidated by the guest
> afterwards. I strongly suspect that the described hardware behavior is
> _only_ to load previously not-present entries from the PDPT, but not
> purge ones already marked present. IOW I think sh_update_cr3() would
> need calling in an "incremental" mode here. (The alternative of doing
> this in shadow_get_and_create_l3e() instead would likely be more
> cumbersome.)
>
> In any event emitting a TRC_SHADOW_DOMF_DYING trace record in this case
> looks wrong.
>
> Beyond the "on demand" L3 entry creation I also can't see what guest
> actions could lead to the ASSERT() being inapplicable in the PAE case.
> The 3-level code in shadow_get_and_create_l2e() doesn't consult guest
> PDPTEs, and all other logic is similar to that for other modes.
>
> (See 89329d832aed ["x86 shadow: Update cr3 in PAE mode when guest walk
> succeed but shadow walk fails"].)

I recall that there was a complicated bug, ultimately discovered because
Win7 changed behaviour vs older versions, and the shadow logic had been
written to AMD's PAE behaviour, not Intel's.

Remember that Intel and AMD differer in how PAE paging works between
root and non-root mode, and it is to do with whether all PDPTRs get
cached at once, or on demand.

Off the top of my head:
* 32bit PV guests get on-demand semantics (as they're really 4-level)
* VT-x strictly use architectural "PDPTRs get cached on mov to CR3"
semantics
* SVM with NPT have on-demand semantics
* SVM with shadow is model-specific as to which semantics is uses, IIRC
Fam15h and later are on-demand

These differences still manifest bugs in the common HVM code, the PTE
caching code, and the pagewalk code.

Looking at the comment specifically, I'm pretty sure it's wrong.  I
think that suggests we've got even more PDPTR bugs than I'd previously
identified.  In some copious free time, I do need to extend the
pagetable-emul XTF test to include PDPTR updates because it's the one
area of pagewalking that doesn't have any suitable testing right now.

~Andrew

