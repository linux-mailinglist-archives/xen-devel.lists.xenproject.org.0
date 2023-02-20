Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F08E69D6EC
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 00:08:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498450.769344 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUFGk-0008W2-T7; Mon, 20 Feb 2023 23:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498450.769344; Mon, 20 Feb 2023 23:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUFGk-0008Sg-Ox; Mon, 20 Feb 2023 23:08:26 +0000
Received: by outflank-mailman (input) for mailman id 498450;
 Mon, 20 Feb 2023 23:08:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CT8u=6Q=citrix.com=prvs=408b4b2b9=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pUFGi-0008Oo-Bx
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 23:08:24 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78401ec0-b173-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 00:08:23 +0100 (CET)
Received: from mail-bn7nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Feb 2023 18:08:18 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DS7PR03MB5589.namprd03.prod.outlook.com (2603:10b6:5:2cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 23:08:16 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6111.020; Mon, 20 Feb 2023
 23:08:16 +0000
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
X-Inumbo-ID: 78401ec0-b173-11ed-933d-83870f6b2ba8
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1676934503;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ZkrdgVnzit6kWn7S7oMccACtAX2VxqAEUryZpD+YZ6Y=;
  b=d6dGehQJBljHDBTuHdsTIDkWtnNPkqQqa7tMWnignFTAEABH6Q9VtCNy
   yHJ1UXv1xNE+S6y13OdKnn1qok6xqdD85lsI9vxKEa+hW+LKbm4F2cSYq
   NBYa/DYxa+CTR6APxE0jAQlVg8NiThSSTYXxWVjLQ5d3dbY+8rfr07Yz8
   Q=;
X-IronPort-RemoteIP: 104.47.70.105
X-IronPort-MID: 96642111
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:uygY/aJzsUtIriZEFE+R6pQlxSXFcZb7ZxGr2PjKsXjdYENS3zNRm
 GscWjrVOfaCNmGgft0gbdnj8U4FuZ6AzoBiGQNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPcwP9TlK6q4mhA5AZmPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5pHX0e6
 /5CNwpdRS6squ6qw6u3Ybhz05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLkWSd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnzH2lBNhLTeTQGvhCvW2+6U8iVw0tcBixmqKAs0KiSfkOA
 hlBksYphe1onKCxdfH3QgeqqXqDshkDUvJfFuQ77EeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19L2ZsDezMig9NnIZaGkPSg5ty8bniJE+iFTIVNkLLUKuptj8GDW1y
 TbVqiE73u0XlZRSj/j9+k3biTWxoJSPVhQy+gjcQmOi6EV+eZKhYIurr1Pc6J6sMbqkc7VIh
 1Bc8+D20QzEJcvlePClKAnVIIyU2g==
IronPort-HdrOrdr: A9a23:vKDiGqBc+RUkihHlHelo55DYdb4zR+YMi2TDt3oddfU1SL38qy
 nKpp4mPHDP5wr5NEtPpTniAtjjfZq/z/5ICOAqVN/PYOCPggCVxepZnOjfKlPbehEX9oRmpN
 1dm6oVMqyMMbCt5/yKnDVRELwbsaa6GLjDv5a785/0JzsaE52J6W1Ce2GmO3wzfiZqL7wjGq
 GR48JWzgDQAkj+PqyAdx84t/GonayzqK7b
X-IronPort-AV: E=Sophos;i="5.97,313,1669093200"; 
   d="scan'208";a="96642111"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vdq1PXcu1rTAAa7EUNDFQPaPG8wOrTVyAx9jIVBDU0T2D9Iwsil+J86MRBI6O0MOq6k/x7gT3WRGpTnkjUo91DXy4edgacnXHiDw1mZ6NAMA8h4G719gsHL2lJHU2SS1wk/a2XBd6XE5/R7xoYPXDzHMKFH61W2RRM7WrkVgto8JrkCSRku4eVW/URpcwhQKMNe4y0i/4tb3uQwzzBgReCwkI+e3ZQ06fHkEVW7hs31j21O2kj7ZFxFqR0ccG9oy7OkIswAvSyyS4bFxl9rQFrESMNoE5G/DUoH/+nHw3qit7SQ/C+xIK23szL0sasJkrwalX/c+2tWZ4QVHeRUEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkrdgVnzit6kWn7S7oMccACtAX2VxqAEUryZpD+YZ6Y=;
 b=fBcAk/hbAXGVcDoSWKNhDLsj8J2ewIehDAl1O98K2ZmcSgQACKog1Cuaem1Y7d70LIwtyGMbzWVuzlnmb0CiQpBMV0vwtQbjiqaMazmogR5bCgqUjdMYVKr22WPKhWIwqzgau5VACXKsIV/lEyLh6GMHf2MfnRhR0Ueb3EHyeYfLoR9GZcrpPgxjMVbDmvY/DkJi9G8n+T87qiFXBJf5iMJdSf96OXnjcUyVxqo70Nde4EOmtUpKhDziDRI0p5wbTtvc6txBFDewGS9akZTmUHZOwchmDZ7P/ek69Rs6/mFmt0q1biTBEviWxldpeUXN3cJnz7cFeH95tPT36pQ0QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkrdgVnzit6kWn7S7oMccACtAX2VxqAEUryZpD+YZ6Y=;
 b=Msphz3mfOT8qiGxvPOBf+e87fjP3/s+sfEnXPm4V+j14L/sRVpebyuV1BGvlnsuDkQf71/BkxqnyVhUm/kSPvuh5UebQxB3lcq7X/2F2X/RhSh8n83eNJ6KmIx2NOqh4EpqhEfwWG9+CWMP51SIB3rvN9sHQUzMgTfScvC9EYYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <562ae912-e833-ba97-dcd5-4c6b6d8898e0@citrix.com>
Date: Mon, 20 Feb 2023 23:08:10 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/4] x86/svm: cleanup svm.h
Content-Language: en-GB
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230217184814.1243046-1-burzalodowa@gmail.com>
 <20230217184814.1243046-3-burzalodowa@gmail.com>
In-Reply-To: <20230217184814.1243046-3-burzalodowa@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0129.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::20) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DS7PR03MB5589:EE_
X-MS-Office365-Filtering-Correlation-Id: 363e28e5-f418-4dd8-7ea6-08db13975950
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2X6f/vFunpMDfVilV5ZXmqbYLD+4Dnlg28T/Cw5+ldNBMc9OD1uRkSI9xsqK+ZXvEMpIofCQI8nhgkMR0LcWsYkzXSoVmr6PJINo4B/qzRdZBl6lbq61ZMbyNrOgkolThlteuk+z+9PMdEQroXnR2gLjO/Es9H8RjN3vpdLSFcGPfp6sCFRv8K3e/a2qM4anSHDx6KJjOsTcpS8X4OqtJfx5T1Qj+8WhQHKLfIRC6mhPzQDN/VkDSmQWrYRRgw20kyInrsrjYKFISpdtYSh4uVt3Z1tGHD61J7zeCHyw51Z2GVidVJaV26XjOh9sjZKUXeyyUsvUGJ+j8r+iCRQpxf7ewPS4TbA/VXO6K2OFHeY6BVcTUyW+rxMguWd0xIAj+me3fWj6qD/3Ydcgm3k4VtVNJqHLafWtMzaNDlO6GZOhIa9SFku5DknhXV4NGgpiV+X6HMVTzsgiiLefy2qw0PuoakHQp+D1IcpKYnIXrQt41yp/FpAnOqCIvYiVwQ8nb5w3IONrx0nhaGMihKdrlJbnAKz9V/WCzCfWggY3sitVZ1HDh5Gz+8nqUdSKv8sDf9hp21XMcUKXG/tTWPl48CYKiU+RbdC/QIJUbhBHlFfnUHViGuviHOyy4ghQ7p27V/cxlpgdgN9+tQQPioNX7oC4aNRRUZJgZXIJaN4iODCpWu/UvA2w4Qk365O1qPKb68/CTwoVNLWcaXJxVPgQyKEG0Yca8fDcTvVhz7dLX0w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199018)(478600001)(54906003)(31696002)(82960400001)(86362001)(38100700002)(2906002)(316002)(41300700001)(36756003)(5660300002)(66946007)(8676002)(4326008)(83380400001)(66476007)(8936002)(66556008)(53546011)(6506007)(6512007)(2616005)(6486002)(6666004)(31686004)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEpheVJQNkYzMjVCR0lsTlNISUl3cmhxOFJ4bzVTdUt5NkppcS8rQkx5VjQw?=
 =?utf-8?B?dE5mMEJaaDBvRUprb3NLSU42U0JucmUzU0dlMHF2NUxBVGwyanZSQmVJcFF6?=
 =?utf-8?B?eGR0N0I1R1dBUi9uYkFja0ZndHdZVmdja2pGRmJma1laZGppM2ZyaXFQcUVl?=
 =?utf-8?B?R2RUQmNFWVF5UlJGbUZjcHFYbi9aY1k3VGRFQlJaMWRiNW1Nb1cxZVFyUXpy?=
 =?utf-8?B?VzRRbWpYaFhGa0F5ZE9mTTl6RklTOStxMzRueFJmSnZ5bHBXUTlhYkp2UmN4?=
 =?utf-8?B?dVdZK1dZdW9MNFVYa25vUWNKc0w3MWt5cWp5ckl2eEpLY3ZwQjEwQm1nbFdP?=
 =?utf-8?B?RDZVM2lhbFRMajNFNWFxY0V2VG1HT3dzWENXSGQ3V3EwNlJuTUZlVUViSVBt?=
 =?utf-8?B?Tk10ckZjZHQ2V3FCMWYrSjJGckdvT015azY3QkdWZWkvTWFvcklVODBBK3RY?=
 =?utf-8?B?RHJjTjNUZ2tPLzVBTWx3R0NFTStRRCs3anNKT0pXQUhzMVBhVzJsTUJtZXk2?=
 =?utf-8?B?ZXUzd2FCZEVFMnNZcEVRelAvWG5qN1dRMDcxdklBTEdKek8yVUpBcXNUaERo?=
 =?utf-8?B?bXg4dXlEQUxoM29sUStPSlF6WmNCWGlobzRYYXVnWDd1MGJrNzJYSGQ0S0JF?=
 =?utf-8?B?UyswdFI3RjFFR2c1Tm41TTVRMjNiNkNXSlZlMldTNTJPQUVUamdWYTJpWkJv?=
 =?utf-8?B?Nk5mOFV3cDByQUIxdUxpbnM4R3d4UndiVkVLWC9weExEMDB3d1psVjF2Mk9Y?=
 =?utf-8?B?MnFUa2tEcFV1dDRzN05ZSGVjTmpiTjVPckVoODc0NUZsdnE4L21QcHNQUWl3?=
 =?utf-8?B?T0F0c3dnSVA0VWpQNW1VSkxDQzBmSEw0R2wvWERZaGZuMTZpb0pabzBQVFJG?=
 =?utf-8?B?clBNbHhhZCs1SkE5cVF6Sis3TXg0dGJkNm95TzZid0w1a1VRZTJqbi92azZI?=
 =?utf-8?B?aG45SE9UUDN0ZUtWSXRIejhNOVFPbkpDTVAvRkNFSk5BQ2MvQlVUb2NFNGZs?=
 =?utf-8?B?TklLOTZ6SG5pMy96Mk41TXlLMHpOMWx6SDJXdFNkKzc5OHdVczcvNFlEL251?=
 =?utf-8?B?WXNudFY5VWZiUVd0NFpEemlDd2Ntcms4MW9ZSEtBdE01cHpKYTBycWQvVDlQ?=
 =?utf-8?B?SmlPSmJKcDZJaHBCenNWSy9hY2c3M0RnV1ZxaXh1aTA0WEpXeDkrTE9sbUpY?=
 =?utf-8?B?TzcxNUhCdXZZUmIzVnNzUE8xRDVxT0xTZVVYMkl4QlNaVGJ1QUZ3alVkeTRQ?=
 =?utf-8?B?OWZtRGtpbkhTdk1HYmhuZHlWNkhpZ0dERXlpN1VxUnRCTkZmem00QmFidUh2?=
 =?utf-8?B?elNSR0t0TlkvbFBiRWFxb2ZFVDhxZXA4YW1SUEYyN1NwdnNiM2pGTDV1N3Fu?=
 =?utf-8?B?UktlQ3RUcXI1Y3BaOGp4WmRHaFlBYWNsNng2MTViTkMzL201azhvTnd6RUxj?=
 =?utf-8?B?QjRvQmhPSk9VTlk2SVJUUXlKTmxVaFNkL2w3a0d2REE3K1pjUDB6aGk3TkRB?=
 =?utf-8?B?MTlhUTNZZFI3OG4rbkFyd09WY0FlTDFnNEVla0hkZjdTQUlFQ3YrRWpFLzN0?=
 =?utf-8?B?K0VtcjAxdHBoY3Y3UDJLSXBnTEwzRVJZMjg3Ky9GcE9mcCt1d3RENldNdHEz?=
 =?utf-8?B?VWxkdGtYQ0NzdEU2dUE0d3FGTTlzTVZYd1UyV2RjYWZOSi9RMm44UHp5RVlw?=
 =?utf-8?B?MHB0RGlaamY0bExaU2FodXNwUGM2bnJQQXE2WjNCWVU5WmwvM21TYUZ6eHY2?=
 =?utf-8?B?Mzg2TW9JcFpTS0NOTW96Sy9iMmcvbDhzRkp1OE5LaFFPT1ByUFRNUWl6Q2VG?=
 =?utf-8?B?bExwdDBpTDNsRVZPdU1xT2tONXVxR0p1NGdZemJLSW1jMk45VkF1S1doRko4?=
 =?utf-8?B?V0dNUElTZmRhV25pWHptYWZzTUw5NUVpYWl1MEJYWEZCRkdxem1NNEdvTFFL?=
 =?utf-8?B?QU9ISlNFdXRBWURHdDE2VzkreE0ycDk3WFlrM3FlOVdvVXBMNEdQNUN0cDhl?=
 =?utf-8?B?QWNYZHZFc213TVJFMnZYeHF6STU2dWRWZnYwZm5HQzRWTEhCSm4zWGE4Ujcy?=
 =?utf-8?B?M25wbHZQRk1nbG91U2l1c2JEdFE2VzVYakFyNHBVTDJtNjJIUHFUN3F3cVJp?=
 =?utf-8?B?VkVXTVlCUmNSTVlZU1Fmckl5U0ZISlBFSDRKNHp4ZkNnLzlyUWJRaXZEdjVQ?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OlpS2nUSS7yLbiJR+XgIo9xLVJEZyS9iwRbRsVDzNOQLu8Dj7jn/EU1YwGCjuvTEELZx9FD9S0LrUgox3bDnt3XlxKy2EvZsknEVQeWx/2kyxz8Hu3/Q0n/c3URdyJ2z2Uki8jfsO84a6B0qM0hmIdA2K/mDlMmnceKsTd2qL0yVaEEeuY5Tq+gz727x4TVWE85RlR0q0JfK/HimOtK8eMX+NvyOEbyiv3KPA8ay+Q9y9kn4Xur9HGJ4VfGIk7ZEauENbdDh6xa3uckSDcTS2b2VBB5UiY24f1ApaLifegqco8NWfVpL0WE/J8TgiK3MCKGmy2tR523xKLHV92jMVhhnCL/OgoE73QJrU6pn3T2oR3XvRU46qanvzN5mMcdePNp16g4/VqzACGOpFZrAzOMuSXRAPUP2+WUR+PmajhQIb6XnP1qa7ZioxV1kQEAnmjMNcpyPYdZHlJ5WdkrBGBh9yjK2HSruFbPPMCpRyxbKO2Jt4J4y5e6d5WchsI8U+qgp3NNyjXWhETYo4ysOiEUl/UaoCU6HcJLGk67tJnhT3zVkDIIwd8K+/yUuAE6+Gt+o7UT/WP9o2xc7OlF7JSx4oUn5jQFd3jKLKtT00l/Ji73D0CEDUtLs8QdwG7rUCFF3ZA0dwkKii6mTmPHcfolfxzbXl+72YizRKTqJOll8ibCP4fdWlFVFrZA3ZrRccE1J+VgyW8ACPli4i80sIiVuM4ZVhfMLlHZln93BkcmqWdOl0OZ3nlHpGLDkagsO11Ctc2VMmPBz43AZ2w1Y2ppnif2Zk3Pd+Mxh0uZaEwHQahRBj7elJ2FIJoYlRbrxyoECe9+TE4qeCCkQF5eYPW45GUpb7Q5GOI6O3wpURaY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 363e28e5-f418-4dd8-7ea6-08db13975950
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 23:08:16.5618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhRs4kagBoBCCTRMpDtSN00Muu0V5zKT1ixaI6KxSSnfO843mqxxuC9NqCpr1YAeQT3lYx2229mwHRZm7FTQuLsEbhyieQkYVsi8o4GXK80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5589

On 17/02/2023 6:48 pm, Xenia Ragiadakou wrote:
> Remove the forward declaration of struct vcpu because it is not used.

Huh, turns out that was my fault in c/s b158e72abe, shortly after I
introduced them in the first place.

Also, looking into that, there's one legitimate use of svm.h from
outside, which is svm_load_segs*() which means we can't make all the
headers be local.

But still, most of svm.h shouldn't be includable in the rest of Xen. 
Perhaps we can make a separate dedicated header for just this.

[edit]  And svm_{doman,vcpu}.  Perhaps we want a brand new
include/asm/hvm/svm.h with only the things needed elsewhere.

> Move the forward declaration of struct cpu_user_regs just above the
> function that needs it (to remind that it will need to be removed
> along with the function).

I'm not sure.  This feels like churn.

> Move the definitions of NPT_PFEC_with_gla and NPT_PFEC_in_gpt in svm.c
> because they are used only in this file.

IMO, these would better live in vmcb.h because that's where all the
other decode information lives, not that there is much.  I previously
started trying to convert all the exit_into fields into a typed union,
but I didn't get as far the NPT info.

> Move the definitions of SVM_PAUSE{FILTER,THRESH}_INIT in vmcb.c because
> they are used only in this file.

Honestly, at this point you might as well just delete the defines, and
opencode at their single usage site.  They're pure obfuscation like
this, given no statement of units / behaviour, etc.

That said, we do need to stea^W borrow adaptive PLE, and make the
settings hvm-common because right now we've got two different ways of
configuring the same thing for VT-x and SVM.  (This is definitely not
cleanup work.  Just an observation for anyone feeling at a loose end.)

~Andrew

