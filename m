Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EE96DA1F2
	for <lists+xen-devel@lfdr.de>; Thu,  6 Apr 2023 21:48:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518980.806084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkVas-0005Mn-I4; Thu, 06 Apr 2023 19:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518980.806084; Thu, 06 Apr 2023 19:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkVas-0005Jg-DK; Thu, 06 Apr 2023 19:48:26 +0000
Received: by outflank-mailman (input) for mailman id 518980;
 Thu, 06 Apr 2023 19:48:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3yY=75=citrix.com=prvs=453e3c94d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pkVaq-0005FB-S3
 for xen-devel@lists.xenproject.org; Thu, 06 Apr 2023 19:48:25 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb7a61de-d4b3-11ed-b464-930f4c7d94ae;
 Thu, 06 Apr 2023 21:48:22 +0200 (CEST)
Received: from mail-dm6nam12lp2175.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.175])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Apr 2023 15:48:15 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB6538.namprd03.prod.outlook.com (2603:10b6:303:125::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Thu, 6 Apr
 2023 19:48:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::a5a1:8cae:d45b:2030%3]) with mapi id 15.20.6254.035; Thu, 6 Apr 2023
 19:48:13 +0000
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
X-Inumbo-ID: fb7a61de-d4b3-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1680810502;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZsgUh6XwYy3/O+QPZr6A1ROCkyOu39sZ4l5RK4WQIxo=;
  b=AiO7DCZRpyKSs+MobuHBjH/sk+kK3DRzxSljw0g0e3sovTyikkG0zQVY
   RH6u971T/aduMzP4uxyTJ2KE3y6v92P4RHKQ/cMBRwVnUyh7NMmnHDRfd
   iP3580TUXzW3Ni/9AS2NGBUr9zhuM7I2ENzCpIF+7UkxXJh0984TmsnAQ
   4=;
X-IronPort-RemoteIP: 104.47.59.175
X-IronPort-MID: 107043711
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:TVgu76LzxG358h7QFE+R/JQlxSXFcZb7ZxGr2PjKsXjdYENS0zxWm
 DBOW2nTb/iON2L1L94lbYywoUwF78PQzdYwTQNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA4gRgPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c57J38J0
 fEUBgoMbw3bueG7muu7dPNF05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMkWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHukAN5JS+ThnhJsqGy82nQTI0wEb0X4nbqS23SXdItgD
 0NBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rrZ5UOVC3YJShZFacc6r4kmSDoyz
 FiLktj1Qzt1v9W9Vna15rqS6zSoNkAowXQqYCYFSU4J5oflqYRq1BbXFI88Teiyk8H/Hiz2z
 3aSti8iir4PjMkNkaKm4VTAhDHqrZ/MJuIo2jjqsquexlsRTOaYi0aAsDA3Md4owF6lc2S8
IronPort-HdrOrdr: A9a23:Fds+w6B9Xe5H1orlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.98,323,1673931600"; 
   d="scan'208";a="107043711"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDONPtyNiTo2z+kchG9QvxNMhUbPl0UmtYYbH/vg68b+gZE3I0gc4pSO+DRcKP1dsCyfxnZYY+8yKrVKJhIqIPh/d4xOzJfqRvGXa5Cmjpn6JNDXo0FIvLGhq2e9vuGY+A4s2PEwFX4Bx5YoAy+x1y9d+iATTPrc3x/NvV5y0PP+vR/8nhVqcEK3sSlsP39ALlyVq2IDA/dNnX4CCKRC2B/dod/pR5K+zE2tfcSfbKtHVf2ciXYCtfTR/c08H+2ElCwtBvNcWipFuOnmTLXGYAdOyAXmixsBrVBg60IsQm7ADD9uh6VB8UHZ8GdybzQwCIQqwHYFGDiXH/3lOmfJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GEv/vHHfWSr/9qukhjnK/VmYsC3r4UDh5/C75enRlo=;
 b=AHzJ+FkOcUMSbYkBqU+mcmYxfcHXZRt1/NAV6XGW1C+YLjJB8YJvmjIJeUzTwIiD6n8RCLFhPYAE9xWnxCnP7A7hoYZ1aPVNupCVgm2wfOJmkYcRvHPDSZfyV/V2brSejNL9q90jFbliIQ3vTP2ioI6qyuhOd8Zysfw4x2SWydBlN/o5VmGnbImXxEDSEI7+9sROrr1jEoHUOdc3dq6IvIsDxy2P54jF7zVLhHH8iPd+9WjJYd8EwC3grWiql3pg5uxtUWPYwo73bjbrL1TfUie/dbYSdLq+SXGg3z2tXFBOFg7pcIVPUftPYZhGL1J59dTWbU35k6ODgcYbE3dncA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GEv/vHHfWSr/9qukhjnK/VmYsC3r4UDh5/C75enRlo=;
 b=waSE8FxTuVgbjy55rwI/7O2/2xhxrDw9U7e1OFIAN6xnsTBnVXndoUCCFELqLakun05gF9CBD0qITJ9CFGzFnScl7Q0DkP9SJ2mvWkdOp8DdjKMMvj945k5Ic/N7tGVdyutBhvaS/zt5rD/mCclnfd2BK7RDFfhbLVYMwN8H5ro=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <197c2d8a-0a41-da10-771a-87843c9a007d@citrix.com>
Date: Thu, 6 Apr 2023 20:48:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/9] x86emul: re-use new stub_exn field in state structure
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <c7f748fe-f062-c2fc-4cc4-b2f888633abe@suse.com>
 <a9c212a8-8c63-91e0-eb07-8c927b62c1ca@suse.com>
In-Reply-To: <a9c212a8-8c63-91e0-eb07-8c927b62c1ca@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LNXP123CA0007.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB6538:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c16495-7673-4a48-76c0-08db36d7db55
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YVHMiDGuZVD1vrEMbauouKPVHRpBTNtmtjLmj+FdJr9sLf/zTKuhCzP1nK2mll5+mmSsvcjSNV1Z4B/MU0ebPZ8BRY+Cp2PQnL3gEG2Fg/TR0igX724Kcmq7dScEyMf/W4Q5sLHjTGiY2SPT+Kz4SKk7w9TogN/wkBvfel5rEIUKpFfVkbd15/hIgQ/7FyDr94lVuBDCMGGRSwRClTwxcfTlal6VyV+c36fBvFfBJX8gDU1uSPek1rVL30NXBB96Hga6BpAa7BL7zpadshx6n3T2zTSq99XIfegQAnK5Ovnw74uWlxSxcj7uZqDKU3VZzSyIoc8c4+oMT0knPIqyn1H+Al3BrWFeFml+Ugl0NhVSo7kjtxqTxbzwcXncINiBWB1IIT/EW/l2wSAkgPcgWkE3ZMyceAoYfs2oQhlOfErq2XvczgPokqDD3KxLpjBYGR2JiyyZyZ6Uv42vh4eUNnoYSeCzYj891+EsXKVoRVPXJLpQRmosTTh2k1DTfawW2Rh17YuD3GWxA68kp1lbBAC6xnmeraTZu7JFra0wpJY4s5p+TDJ370oNq+Svg3+jrwpt2XoluRQiKkTy/WE1Mpg6pFMirzLCicDrZtLeNZuzNdlUSj27llkxiTABNwNP+/+7QHAgEz0CWUARk0pUdg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(366004)(39860400002)(376002)(136003)(451199021)(31696002)(2906002)(36756003)(8936002)(31686004)(86362001)(2616005)(83380400001)(107886003)(53546011)(186003)(6666004)(6512007)(478600001)(6506007)(26005)(6486002)(66476007)(66556008)(8676002)(54906003)(4326008)(66946007)(5660300002)(41300700001)(38100700002)(316002)(82960400001)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDVFUDJ0aU9lOVl5ZzVsdFhpeC9YTkZLMWlFZUl3NVJaZUxsYnJpSU45T3VG?=
 =?utf-8?B?Z3pDa29XbDNSRmQ4b3FPQzZYZy9hMFUrZTVlaWVEY1FxcDdhRFkwdmIwK0VL?=
 =?utf-8?B?VXc2ZVY2ZFJORVYxa1grcU1YcWlsaGdXVjFHQnBRUW5KMHdieU15eFlHM2dD?=
 =?utf-8?B?S0REYWoxRkNEeUN1c2d3L1Rjbis2OFNBR2g0cG1iTnEyVUtKUStCb3lkV2cr?=
 =?utf-8?B?NGE3OC9mc0xreVZyTDZUZjdTSHNkeERGV2JYWnlzbjNST2xaN2hSQWNMa00w?=
 =?utf-8?B?Z1VqajlrMVlzOWZZcmEwd3lIcHVFZzcycUhPNGJBYXJSYnVRenlxdExUbzJQ?=
 =?utf-8?B?V1dQY1FsdmZZN0EzZHhVa21yV1pQWVBKWkl2bUJ5cDdhOUkvUGFEZGZmTjFJ?=
 =?utf-8?B?Sjlra0N0OExWeGhaQ1Y2Nmp3YmZaOVhTM0RsMXJjUmxDN09vYzVvdFpreDZK?=
 =?utf-8?B?dXJNckpMbVJweXJHZFlUQ3V6VlNoc1kyNzJGTUhHMXE2OHd2bzcvUUU4OEJ0?=
 =?utf-8?B?cUtuUUs4WEF4TVJyS3h6eXhTYld2SE9EMlFTUDdRb3JkbVpTdS8wV0IxbjV6?=
 =?utf-8?B?NUduYllSR1ltckllVGJrWW9MU0RaZ3IwdXZTZ3NPWWhqaDZMdjV3ZjY5MG9J?=
 =?utf-8?B?bDNaY0lnV0lnOVk4YU1iTENwcjdzR2dCOEJMSm03Q20xM3VYckR3cjdkZ3dV?=
 =?utf-8?B?Q005a2N4R0w4cDc0azRtNWVOYXMxV3NxRXUvRlZNM1JkS1FsbVB3Z2JEa2pF?=
 =?utf-8?B?NTM2dUtIaFRPL1RCZG5kWVZvMXZBcGZOdVYyTWpITUJubElGQXlFVkpIYXVm?=
 =?utf-8?B?MWRzTmlxTEhtLzZlc3pSbjlCV04rSmhlRllxYlZRTjdrd0xiSlJZNmxHU1k4?=
 =?utf-8?B?RFFXWHhIMGxveFh1bkMwNUJFVWhWSUJBS1JoNCtoWnQwMlM3ODJIMHlvbzZW?=
 =?utf-8?B?a0hsa3lIbkFkMkxPSFhrUWFxSWV3SzdnU0ZUQVBYTU1EWlRZekZPTzV6MjE5?=
 =?utf-8?B?MWFqb3kwTldxMUtFZm5mRGV0MmFiaWtzVTE4NDVydVN0RVgzSmxCOHAwWXFH?=
 =?utf-8?B?YVBaNkpJSWtlTWllK012U2Yrd0piWDdKcGQ0ZEJ1dUIxaEtYaFRLa3k5Rzhl?=
 =?utf-8?B?NTJQKzNwUVRqdXI5NDJYYnZuZjNadWFqTXBIam41VU5TZFFRSjhBS3lyRFNy?=
 =?utf-8?B?NmYwRkJXcFBhYmowU0FKM3ZicFJwMG1CcTJBRkVlYXdNUGhQUXBudThYMHpy?=
 =?utf-8?B?MGtKN3pFbjcvNjh5c252SlBHSDQvR3NHTjEzYVBqRjNEbVFuQ0JMVVVTaW1O?=
 =?utf-8?B?MlE4bWJTb2xGenBPNmhPZ0tSaXBYeUEwNldNcmswZ2FKUUdHRzQ4M1p1SFNw?=
 =?utf-8?B?Wk55d0dMMzJyam9MdUdVZ0kydk00Z24zUGZ1MWFBTUFTYjF6bUFUbEl1aFdK?=
 =?utf-8?B?Tm1oM05XazdpOG4rRFlSeTVCVGN1OXRFU2NIYm9lWEpCK3NyT3N1S1BWZGZX?=
 =?utf-8?B?YlpBc0ptQ0ZaRFV6Rm1hc1VXaHJnRVVsa3hBSzFrOVMvT1BhWkhTa0tlU3FX?=
 =?utf-8?B?RGtBYkxiVXVGM3RhL0NHR000c0QyWEFnb3ZHUTg1RlZwSG5vWWtjNmtMNStL?=
 =?utf-8?B?K2xGUHBLL3NlUzZvdTkzMExsL3NOVlM3VHlyQXdUSmdwSk0yeXdSRnp6Tkl4?=
 =?utf-8?B?YXMwa3cycVBDUERCeWlLOUtiQ3FLWEpzRFVzMVJZY0J0ZGtLV3NJeVBLYlEy?=
 =?utf-8?B?K1ZnMU52b1o5TGlHWnF3NFJndkZ2OXpkRWZGZXZPd050aktOVmRJRnJxOXBa?=
 =?utf-8?B?K3Z3VnVlTG1jZ3JmU3JUN25Da05uczRKVnlTU2F2eGJSK2ZVQWhGQ1VlVVcr?=
 =?utf-8?B?TjZ6NytGemFkNjNLMEg4Zlh4M3JwWGo2d29PdWlMOThuT3NZcW0yMXhlVGYr?=
 =?utf-8?B?NTVOTkNHY3plMjg1SENVTmMrZ3dMMlBjRHRnUU41S3RkM0Z0RzlHdm4zUTRy?=
 =?utf-8?B?MnFXRGlyT1YrVVlyWk00Um9IOFBlMWFpS0ZxNXZKQkhPTEkyMlFYdzhnVGlI?=
 =?utf-8?B?NnFaOTJZSkNjazlCUWkxbGQwM2kyb0UyVSsvcUFKbmI1YzI4TjAyYXFCZ3Zw?=
 =?utf-8?B?SHlVWm1kdlJ2MmROUzdFTnhQQmlmaGtVRG1nbFJPM0pKUUJqdkhlMUYyWDRE?=
 =?utf-8?B?RlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hR3JTT/yTDt5+8/LfHBqMSLOrJjfWa2guvNHPLjfWRrjm2xWd6dFMUO9D+FU4efC1pJk6u7w0QpDBxJUsA6q0hzIe8+j31uVPtDCmjSotVnF9WDEWUpp6HS+BNEgXlufM6NqAs2Y79lTJhtfTrVMKOrwbDEQM2cn7RAfrQZMLklOWWWK3YsogP4mWcOYrIYIwafRLdxDeF6X2fcMqAVzzo61hu25iguHfLTRjk+rUG9VTQArBU9DD2TxOt845vAP96nXhEEx69mIJxDNmvUibpDjbFCRkkNK0inlVf6xlhioomaA7rYPcH6FPkL0w9KfRQZP/2ZCt1m8Gq0vTMfQRhSWOo9JZdO8JYFG/dzEZ+yiN77P2GFs0BCuhoHY8l+d72/Hz3JD0o5GQClFn6NHvRDU9nDF81OemS9u7qEO4/r2p4vU/27khatmTp3+hVG49wfTsK7Q+B34Fmj2YB+mAa1vODIwK97jP6oELH0qmoK1daNt1dzUC9D2ivztEyiR22/skBiP2h9rZClbWe+cCiFcReIaoFqF+Qfb5yNjHeeELIdhH1gRpdbGv9PZyY8zdnO+VpZ6eygyNOMblN4+JiRe/FKgQGNOqBFBw2LQmkk57JsC6aIcjDgAVPOMQKJVI2t3f4FOk2nwM154QyC9E+dDVhbDjFLyY16er2Yvyh+MMsN2guCmZ3IQ1WwmtyPiNW7PwqhW7cWUhZknWtyajdWFcuJCGC21FgLNqdejXu22cP0Y0FCwe6Xs2NAvjqlzfCKjB8UsjzOK3luwO49wRM/fGMIQrKqr/D5i1TOKRW+qk1a2BCvu46bmmrl1j51x
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c16495-7673-4a48-76c0-08db36d7db55
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2023 19:48:13.2632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3Phhn+rxFjj28TsgIhIyq3U3yNqZTj0ElLXBIByn1Zdw47Ri3cTGuc4RbNLqPWXuiMDqINSYnDXatB3VcR7Gt56TqsibGOYuucpHWhCWWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6538

On 04/04/2023 3:53 pm, Jan Beulich wrote:
> This can now also be used to reduce the number of parameters
> x86emul_fpu() needs to take.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

As said in the previous patch, I think this patch wants reordering
forwards and picking up the addition into state.

"Because we're going to need it in another hook, and it simplifies an
existing one" is a perfectly fine justification in isolation.

With that done, Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>,
although...

> ---
> We could of course set the struct field once early in x86_emulate(), but
> for now I think we're better off leaving it as NULL where not actually
> needed.

Do we gain anything useful from not doing it once?  it's certainly more
to remember, and more code overall, to assign when needed.

>
> --- a/xen/arch/x86/x86_emulate/fpu.c
> +++ b/xen/arch/x86/x86_emulate/fpu.c
> @@ -90,9 +90,8 @@ int x86emul_fpu(struct x86_emulate_state
>                  unsigned int *insn_bytes,
>                  enum x86_emulate_fpu_type *fpu_type,
>  #define fpu_type (*fpu_type) /* for get_fpu() */
> -                struct stub_exn *stub_exn,
> -#define stub_exn (*stub_exn) /* for invoke_stub() */
>                  mmval_t *mmvalp)
> +#define stub_exn (*s->stub_exn) /* for invoke_stub() */

... honestly, I'd really like to see these macros purged.

I know the general style was done like this to avoid code churn, but
hiding indirection is a very rude thing to do, and none of these are
usefully shortening the expressions they replace.

Also, putting stub_exn in the K&R type space is still weird to read.

~Andrew

