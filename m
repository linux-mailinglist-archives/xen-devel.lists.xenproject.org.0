Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4C8780DF4
	for <lists+xen-devel@lfdr.de>; Fri, 18 Aug 2023 16:22:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586355.917575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX0M1-0000zK-9u; Fri, 18 Aug 2023 14:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586355.917575; Fri, 18 Aug 2023 14:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX0M1-0000xI-68; Fri, 18 Aug 2023 14:21:33 +0000
Received: by outflank-mailman (input) for mailman id 586355;
 Fri, 18 Aug 2023 14:21:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OTTw=ED=citrix.com=prvs=587dba071=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qX0Lz-0000xC-Ia
 for xen-devel@lists.xenproject.org; Fri, 18 Aug 2023 14:21:31 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84471c94-3dd2-11ee-9b0c-b553b5be7939;
 Fri, 18 Aug 2023 16:21:28 +0200 (CEST)
Received: from mail-bn8nam12lp2172.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.172])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Aug 2023 10:21:00 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5171.namprd03.prod.outlook.com (2603:10b6:a03:220::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Fri, 18 Aug
 2023 14:20:58 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6678.029; Fri, 18 Aug 2023
 14:20:57 +0000
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
X-Inumbo-ID: 84471c94-3dd2-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692368488;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LfvPsHmQ3LVO/GDhLV3Vl++BnfPzrONlXaHfSsz3y/4=;
  b=QR9v10S4ccJKs9A696MaGR2UxxME5QirpBjPQCzlyM6JyErBxAtFiZuQ
   8LA0zg0P03CF3rBkHgu7jqSF4Geuf03aQSd7qz5KgB4tXRCTXItprgzzH
   Q0sQUL6Fr3a0LAwdz4/eUPltZagu4lP/B52CykwOzoWaXK0NgUTCDexju
   8=;
X-IronPort-RemoteIP: 104.47.55.172
X-IronPort-MID: 119177917
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:KR1fsqlBIk8t+y2Jp3Itkono5gwEJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIbDTzSPP+PY2ekLdx/YIq/9k4PvsfdyYRnTwpvrno2FCMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icfHgqH2eIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE0p5K2aVA8w5ARkPqgb5Q+GzRH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dJJEDtXaD+MveCv47akbNZKr845FeC+aevzulk4pd3YJdAPZMmZBo/stZpf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3iee3WDbWUoXiqcF9t0CUv
 G/ZuU/+BQkXLoe3wjuZ6HO8wOTImEsXXapLTezhqaE72QL7Kmo7OgNOD2G6ob6Dg1eSCtN9L
 WhJ9hAHhP1nnKCsZpynN/Gim1aGsQQbQMF4CPAh5UeGza+8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19L2ZsDezMig9NnIZaGkPSg5ty9v+pIA+iDrfQ9AlF7S65vXuAi35y
 T2OqCk4hp0QgNQN2qH9+krI6xqzorDZQwhz4R/YNkq+5wZkaYrje4yp41HG6epoIYCCC12Qu
 35CnNKRhN3iFrmInS2JBe8LTLeg4q/fNCWG2AE1WZ486z6q5nivO5hK5y1zL1toNcBCfiL1Z
 EjUukVa45o70GaWUJKbqrmZU6wCpZUM3/y5Dpg4svImjkBNSTK6
IronPort-HdrOrdr: A9a23:oDbQGK/ECJBcsv7OhIJuk+DbI+orL9Y04lQ7vn2ZKCYlEfBw8v
 rEoB1173XJYUkqKRYdcLy7VJVoOEmskaKdgrNwAV7BZmTbUQKTRelfBeGI+UyEJ8SZzIFgPM
 xbEpSWZuefMbAW5vyKgjWFLw==
X-Talos-CUID: 9a23:wK04EGOmCsTVle5Ddnhf/xQSNc8fcGT+yGj2HGmRA3xQYejA
X-Talos-MUID: 9a23:rxmQaQYV8LNnJOBThSG03gtjNIBS6r2CWUEvl7Fbt/OtHHkl
X-IronPort-AV: E=Sophos;i="6.01,183,1684814400"; 
   d="scan'208";a="119177917"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8wysZi9umJeOtJ0a3JpPJhJFdB5goGtBNh87XGtdn0zLpts7IecPG7p0RP8sq6wgg4Wj2GILDIEMlLDTjTaZQQ9Bso5vX+3XdYM6VF2ue+eYD0QFoE9PWBaDORQ/Z3PAlJ+MXC7aBG0wQ+k7LwkCMR0AJMBtvnnSWDW6qKn2NwatwcjFxa5YJC+f87lgu5zc+p7+M5kl0T6tF3P8VH9Z6cVPA5rnqm8g7E6dU+XuoUC04VR7BjeNecFUoqcyzsK6iB5iviMyjiVG2BU29OIWSfTW+2b9OQY1gg0n6uLJvhm/j7Pn5XWVw3zc2mImy7qItlaN2Is2bQONHZUpDgdiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faGpFtZljD00vfnDU73PgDPa3RSBzMPdsIfANGoV1JY=;
 b=bjsePqy9J+nCWHjDlPLk0R1i54cqzrCSURVg9IXviX+/ZhUDF6BY7VI4GWOHVEF52z8Jcnb6P47jrVyw90rSt7rNrUkv06pyuOD7fhGhIrD/5bN77wVsnogB9Q/gkjr5iiXd1EWJJGyjOn8640aWD/Fj8I0gQ3QIEhfd46BC2qARCpHnav9vQZ93Tpgd+Uln1gMpVIM+VwzB3Iu0XJJ935ntFgYP/YGjXFs5GBEeqtIAEf3Uf2dapyMuNBQR+yJCjLPjubSukpBoWZcILZ7goMhwyVrLMfjQqr4yT0Ko4eRj4HGP+Q6htYK62LpKwQXSMPlDIlMpOly7lc6dYaxM3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faGpFtZljD00vfnDU73PgDPa3RSBzMPdsIfANGoV1JY=;
 b=tTIMtj5uktXWJGi4v9CCSesx8rbnyG+F3wGhFqF4MieK69CxVnFOM45y3/ZQKTqslILmIHvKHU7cHaTGJv2MJsPBFrglprBOY2UJkDBwzdu934HrrrXCks+dbrVGmVvciqwfKGh4FRNXWQyfmmHdjhUi3dGmowvlXHmvHlMyK3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <53982682-c49c-6f3e-87c1-f4bd0ab385ce@citrix.com>
Date: Fri, 18 Aug 2023 15:20:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v5] tools/xenstore: move xenstored sources into dedicated
 directory
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20230818140848.20220-1-jgross@suse.com>
In-Reply-To: <20230818140848.20220-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0322.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:390::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5171:EE_
X-MS-Office365-Filtering-Correlation-Id: ceb3d2df-4eb1-424b-cc2d-08db9ff656eb
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QpDuskBMGDL2sEWZO4mqHZ4fuS87oV6Yoqpl15kOZb/TjWkGIDUZN8AiSFrqBPoEcL6FtfdOcYntwT+UfRI/4edSdBFjZNSoobhjQ3dMiBXeJ6UMAuaHZ55+gjPqKHwyKhcviNlqD8PlpHEfkN1N1neeh7a4U8donz2emYhzw03jCDn9ZJGKsr89H0F01C5TvQmRnCbJ7oNcRIrevADoZyXyFNwGKJKANf75RxqeXyMlP/TflzHzL5GXe0FLcGd/boOTYOMATgYOEYGI1f6rGTiTgJa7q0/QKrzmA1OO2zRQiSVKmxK2p+lX5dX7QwW9k9qnOIuXiqCHwVor01je21iD02d5GrKqoO8PK1Q9Pmk3H488vwytWy9+t2zstAPXugUmcRzOUg2qfh4ExC0CbUvWjo1sdmIiSPJaskN6x5lq4bfbUQ/LywdeBP5GzZOaLe0O+4oh9Uwh6l4Vw/0G9bz6R659KcHmsdLPPEWeSNEKjRz+B7GKKPOaOrn+/c3awZ9F9Dqt2FYXrn7Ax3Ry/zVb6nhnyGP65RoHEYNzR7sfpSkEta486RVAGHLSJ8/SLCtq9SF2BVHnYKfwtoSMLLG08ecaojKtRk9Yn7LQ0Ez7z8f4RMWz+pKX4DX6Kw5ejqS4M1PHB09rb+WHnQeWdA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(136003)(376002)(366004)(396003)(39860400002)(451199024)(186009)(1800799009)(2616005)(26005)(6666004)(6486002)(6512007)(6506007)(53546011)(5660300002)(8936002)(8676002)(4326008)(2906002)(478600001)(41300700001)(66946007)(54906003)(66476007)(66556008)(316002)(38100700002)(82960400001)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T25VdFNUQWRNdXppSjZMZWpBbld1c0xMUDArdVUzL2NmMllzWWRXWVYwT3l1?=
 =?utf-8?B?NzBVOXJ1V01mdUlVYVFVcXlQTDhpS1o4VUVKWEE0Q2psR0F6b1JiSzR4WDR3?=
 =?utf-8?B?NDgvR0dsYjd1QnFoSWVqdE5BQzNDV1hsdmdTcFJhaU5GQWMvVE9GNnF2VjhI?=
 =?utf-8?B?ekJaY21NMmUzaXR5RHhuZVBOQWNzUHdWZzh5VzU0L2xYNGFGbkI0NTJPYUhY?=
 =?utf-8?B?clhrQTZnS1VKd2NHRHd5cUhONnRvZkxISE1JRkJEbUtob1NwVkFtWVptalBE?=
 =?utf-8?B?bWJEWkc5emhBcU9IOC94ZGxqSHZQRjRXSXZWM0hxQS9XcjVVNnRWL281RTJX?=
 =?utf-8?B?WkNNc0VxZkI2MFdOaWt6S1FXRkRtdm8zQ2IydGcyZXFFYktRNm1FR3pQN0ht?=
 =?utf-8?B?d0w4YTVsUFV1ZlBGUzN3cUhNeko0VTd5WWlYRjZrVTBkOVpXMzZjWmVYNnBB?=
 =?utf-8?B?d1JsbjIyVk9aZ0I2ZHQ0cXBGL1FXL0F3YkJJK01xY3lEdlMvQTc5SVFFNDhh?=
 =?utf-8?B?TVpMZnBidm1UbEEvZUxPRkFZQVhxeWh2TFNaVDhSRDU0U3pxdHY2M2FRQkN4?=
 =?utf-8?B?SllZOVRiQk1YdDI4Sm1xRmQzNzJQREZORnVvL1o2bXU3YnpjRTN1dDdudnM3?=
 =?utf-8?B?c29HdnRKV2QrL01nTUl6RnFST0RBZlpTMkFVME9UWGcyUFlJQzNyWTRBVjFF?=
 =?utf-8?B?Sm5XQ081RHZlM0lTZkg3RmtncXhNeWEyaUdpSlpJQ2hqazh3ZzZiNElXcEcx?=
 =?utf-8?B?Q0FJUlk2WHhDaWxmNWJId2hTdG9JNTNydVVpRVp1aERUYkhMRld1WUN4NDZ3?=
 =?utf-8?B?QkViU1VrVDlTcHI1bm56bFMyeXRudk5NL2tIUU1BZFdlTE96OXA2U2pvLy84?=
 =?utf-8?B?M2VubUlXQ0FWTkhrUnVVUWplOHJjcEw0T1VnUG9VTHpRQ1M1dkZWTVlqMGl2?=
 =?utf-8?B?NzNXenRJYVdMdXdFN01qK2RZMjVxSVFRd0d6eTVyTTNRall6M2NETytVOHNp?=
 =?utf-8?B?cTd5UGJ3b095eHJYTURFY0lVcXZ3OW9ZV3Fxd25GRkQ1T2hoaG5LTHBFYkhj?=
 =?utf-8?B?bzBJUzREVHNGb0kwSWoza0ttSTQ2ZFNsUy9RUzRYNmk3TldGUzFmbXZNRUIy?=
 =?utf-8?B?VU1hTElTZnhKUlpJdml1QUR6SkN0RTR1QkdMcnBxU0ozU3ZKT29MWXlxOGty?=
 =?utf-8?B?UkxCRGxDZWRDa0hyQjV2bHJEWDhtV0hqbEZkMjJuYk9RanlLYnE4Q2I2VGNQ?=
 =?utf-8?B?R2VvRWpqSEN6RTJxbXI4NEZuL2VnWSs2alV0U0VyZmd3bWUrWENjWTNNak5O?=
 =?utf-8?B?QzBhanI3MHdCc3FZV0puVVlqUU5nV3JXNnY2THFDQ3F2TS9kamZ2dlF4N2xB?=
 =?utf-8?B?RS9KQ05WNExoVzgvejVJUWRXZy9wejRxaVAyZ0xnOEVyL1RLU1haRzlNQm43?=
 =?utf-8?B?a0tRZmVWcVdYQVNxeVpoUW1tdkRybEo3RTlqeGdRVDFuNFp4OVBjb0svbkZF?=
 =?utf-8?B?a2YvbkZlQm53WnZKeXNtcmhhN3FudXNPS0pKaGgvVlRtbmNQNEFQcmpoYW5X?=
 =?utf-8?B?eXN1UjJhZ2ZCUW54TEcydlBMakE2Vi93Wno0Nk9yOTNuYk0xdUR2Z25DMCs0?=
 =?utf-8?B?N21yaERwaWdHNVM3Y3Q4M1RLSEx1eG5HWGNsTjNGMmk5a1NIT3lFUHRXK1g4?=
 =?utf-8?B?VFJuOVdtdmdCT2VWdU92ZnA0TE53bDV4Z2pQejNaQVJISGJsMWhLeWx5NVdP?=
 =?utf-8?B?SnhCakk3cHRQTmNCeDdQbUxhUiswdGNGOTU3R1BvZWVENTVlVHE0Q3NCSUNa?=
 =?utf-8?B?YUZXaHNZQks5Z3E4S2xVeEZkbGtJVHUrK2ZubDVtY0VFOU1xbjhubTc1VExM?=
 =?utf-8?B?Z2tuUzNxZEp1SldYd3pxeVh6cGd6a3RXWnlmUUxTZDdoeWRkVXRCcXNyTXMz?=
 =?utf-8?B?WjdlM0pNZUZjWkVhbkRXWHFmejBRNWpIY1VIODVTa29QYVFSbVpsOVdYMURu?=
 =?utf-8?B?NGhHSlNrTEU1NFZudlFjM05Xbjh6N01GTG5JamhMWXgrRWIrYk53QlVjc21u?=
 =?utf-8?B?OXFqeUI1bTZpcXJTZVRMMlV0bkdad09Fa0RPZE00Sm53NE1ma3NqRW5LT2JH?=
 =?utf-8?B?VHJSSWNjNmFGSmZMcUdEK1kwaVFDK3YrajBQWE5PUXkvdXoyMHVpMVRLVUNL?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qHl436ldKO6plthjxnQAkoXElWjATg8H304TVajB6HHn0V/fHud8GPyEABlZNUAx4AnO+VcM6sALzyDgTe+LPd7u9bXCW8aOyTeKiQYAeQ/wQeV91iPvU4Ka/hH1G7kkzoxEhNQjp3aWqK+lb08iozpaLIOgJNywo2gISuDRD7TC0B1rYLlzIuMtL+8qA5Rl+te8r5F2WFzabBeX7FVVp3+wZlhkQQ7x74/UVoWNOlUZf6X7RbjVjKreJ6b8mv2pUpHYuf0dqz4A/fxbhyDv6VSB+h1ZIJe4Ro6TUeL5xS/mVrkodfLO85WXzJhpUz4EbdbGkdBA1dkYPgVdPInLobn/J9V9H1OZmE9PZcPWAmevl8KdUCApG4V26wpAChTA1mLPweywonFoyK7jC30Rh8Go4Ic9nh8EVXTcSj2XK3h4sHxcGrsVBrSxbgCPrbXwRVwPvCa16ZJMm8xtW6B69or/Fu8Jo/VvHHW1h1vfNZsCzx8K5HdxuL9tzb0xKnhJ/v56CjU4yrx5d6y52U427aHMor36lKzdVPHf5GsEbwOasE5v+Q6GOMJGavreZNgo4AtZx7j6nkHxZX5l1oZyfvs9t931Ihe/P2JumDzqigxWmkQ0jJIumiGT33AD2shUvbmYwP5MJyevId0DrryO/RNn4POEXz8h1kSTdnswVkn3cnW0GGiOhwZzDR17380WXSmfzETpKzYGRlLtAfSlXEEKxp1OydXYGn6xnJSy2UpjYleHltZrHl6lJmUnv/+zd/tLHCSu9eGP6GheZeA++Ki20So1xfXD2+QsQbNtfu7GwW+MddufjtEpZDyoSXpXFAqKNhbLVqlpJzP/8Sq3jilLnFcbq92P574Sp/fu2jwRjywzn0xZJ/uPySTTPFnH
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceb3d2df-4eb1-424b-cc2d-08db9ff656eb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 14:20:57.4805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GadUZ/2OaGHOo1IXVWlStGE8eXM4jSs255gSDebXIOeb0fu4z6/IJS8weGch5H0M2jeKEV2v6aixDuZXduANS6z1OLFMruH1oa6VqTFre9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5171

On 18/08/2023 3:08 pm, Juergen Gross wrote:
> diff --git a/.gitignore b/.gitignore
> index c1b73b0968..c6489c4e70 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -237,22 +237,22 @@ tools/xenmon/xentrace_setmask
>  tools/xenmon/xenbaked
>  tools/xenpaging/xenpaging
>  tools/xenpmd/xenpmd
> -tools/xenstore/xenstore
> -tools/xenstore/xenstore-chmod
> -tools/xenstore/xenstore-control
> -tools/xenstore/xenstore-exists
> -tools/xenstore/xenstore-list
> -tools/xenstore/xenstore-ls
> -tools/xenstore/xenstore-read
> -tools/xenstore/xenstore-rm
> -tools/xenstore/xenstore-watch
> -tools/xenstore/xenstore-write
> -tools/xenstore/xenstored
> +tools/xenstored/xenstored
>  tools/xentop/xentop
>  tools/xentrace/xentrace_setsize
>  tools/xentrace/tbctl
>  tools/xentrace/xenctx
>  tools/xentrace/xentrace
> +tools/xs-clients/xenstore
> +tools/xs-clients/xenstore-chmod
> +tools/xs-clients/xenstore-control
> +tools/xs-clients/xenstore-exists
> +tools/xs-clients/xenstore-list
> +tools/xs-clients/xenstore-ls
> +tools/xs-clients/xenstore-read
> +tools/xs-clients/xenstore-rm
> +tools/xs-clients/xenstore-watch
> +tools/xs-clients/xenstore-write
>  xen/**/*.i
>  xen/**/*.s
>  xen/.banner

Please take the opportunity to move these into local .gitignore files. 
One less area of churn in future renaming.  Probably can be fixed on
commit as its only mechanical.

~Andrew

