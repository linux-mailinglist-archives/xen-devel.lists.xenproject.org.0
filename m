Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53A6724B0A
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jun 2023 20:17:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544147.849704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6bF9-0006ku-WC; Tue, 06 Jun 2023 18:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544147.849704; Tue, 06 Jun 2023 18:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6bF9-0006iS-TK; Tue, 06 Jun 2023 18:17:19 +0000
Received: by outflank-mailman (input) for mailman id 544147;
 Tue, 06 Jun 2023 18:17:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9teU=B2=citrix.com=prvs=5144dc918=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q6bF8-0006iL-Oo
 for xen-devel@lists.xenproject.org; Tue, 06 Jun 2023 18:17:18 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5d325fcb-0496-11ee-8611-37d641c3527e;
 Tue, 06 Jun 2023 20:17:16 +0200 (CEST)
Received: from mail-mw2nam12lp2041.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.41])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Jun 2023 14:17:13 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SJ0PR03MB6793.namprd03.prod.outlook.com (2603:10b6:a03:40c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.31; Tue, 6 Jun
 2023 18:17:12 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::bd96:913a:c06c:d606%4]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 18:17:11 +0000
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
X-Inumbo-ID: 5d325fcb-0496-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686075436;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bOVRr2tGQKq/1FHeAAIHEQiJT59QP9fGW7EE+AmKzdc=;
  b=TG16/PQPBpnfHG41Abb1tzrkOmI6ZPoeokfCpvtfXl++oMU7A8rD7bT7
   cZXCzeih08a+y14yxHOfCOXTyMW7LCpOAjGl/J5rTHJj0QbIH4BZYPSjl
   C6n5+DxvCSxDNuQcbYcK8X12/S0HFei2Dn0jAUFA2hV+Jc7xi9uOKZ2KN
   A=;
X-IronPort-RemoteIP: 104.47.66.41
X-IronPort-MID: 111826521
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:uC5qRqLZ5GehPFZ8FE+RUZQlxSXFcZb7ZxGr2PjKsXjdYENS1DVWy
 zcWC2uDbq7fMGD2KYxwaYqwoB8Cu8WEmNVmTFNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrbwP9TlK6q4mhA4ARgPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4sPHh+6
 qYKAgo8f0HfntCNzIiLDdFV05FLwMnDZOvzu1lG5BSAV7MDfsqGRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/RppTSKpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eWxHqrAtxPTuTQGvhCsAyQmWweETEvbwW3/9ulgUunZNJ7J
 BlBksYphe1onKCxdfHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpQMc9qMY8SDgu1
 1mIt9DkHzpitPuSU3313rWJqTK/PwAFIGlEYjULJSMP7sP/uog1glTKR8x6Da+uptTvHHf7x
 DXihBY5g7IfnMsazZKR9FrMgy+vjpXRRwtz7QLSNkqn5A5kYI+uZ6Sz9EPWq/1HKe6xUV2pr
 HUC3c+E44gz4YqlkSWMRKAIA+uv7vPcajnE2wYzRt8m6iin/GOlccZI+jZiKUx1M8ECPzj0f
 EvUvgAX75hWVJe3UZJKj0uKI5xC5cDd+R7ND5g4svImjkBNSTK6
IronPort-HdrOrdr: A9a23:N2KzPK+BR2l2zvvxIbNuk+AoI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HLoB1/73XJYVkqN03I9ervBEDiewK4yXcW2/hzAV7KZmCP1FdASrsC0WKL+Vbd8kbFh4xgPM
 lbE5SWc+eAamSTjazBkXWF+9RL+qj5zEh/792usUuETmtRGtBdBx8SMHf8LqXvLjM2f6bQEv
 Cnl7N6jgvlQ1s7ROKhCEIIWuDSzue76a4PMXY9dmYaABDlt0LS1ILH
X-Talos-CUID: 9a23:2T5UPW9WUHE6jTWD8HGVvxUpA/A6KG/39kbBchOhO11lco3ScWbFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AS2C3eQ42BlELsjgAI9+zn/x8xoxYsqfxCE0Uvaw?=
 =?us-ascii?q?85cXaFzB7Pi6ijBC4F9o=3D?=
X-IronPort-AV: E=Sophos;i="6.00,221,1681185600"; 
   d="scan'208";a="111826521"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivoEb4DkA/m78FMI18ah5b4fR2yOb5G8A5kmt6NbQMF5S3gVs5C7PNoPNpF0IYn6LSKtAn91Ix1Xyp4eo4cAhe02f9/VXrzzU94OibO+LzDU3OTqvyekXBGq1YQlYMEmD8LRDJa4MWnmkrJHqnPsL3rUOy8gEVcpE5yHpj+18rxS2Td95dTy7O9voB2+fF9Hv5g9F0AM9J5wXDjN678XWBQoukdkuGWsW7bw+RUfpkLla8rtJ7JPQwBJ0oxmS7xrHAstw0S9doetD/3W9kxRiXscPtcehE1U5K6NOJ1+hVpRsNK2IyEriAoDXFYhYrSlHyRfvaFj2w6hu8Zx5JOtxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rcxIyhMVlgxl4huQci0IT9hw4zt/8fSTbZVgpMN8HVc=;
 b=dGP/f7grOdU96izQmGFq2OFmhRy3GysyoM9pPFI0qiL79/Px7YtzyNWObcjhq8FemzBDXIBrD5hYj+V50i3rpsSecA6gWzR7naZfo8i8je1ZUH3AGY3MQ62GhoGDDv3ymsAML/8Uxu0gdOpJrc4GTW7meTPBfEgRUn0CMV509hNfsx2hegkMU/m05Mm+qke9e+sX7opnNtf4RnWRId8vk39MIsFLDDx12l8/9QK6yyQMhTPBXLuVjoMe9KrBq7x4Vez9gXEv31lNW+bDdvH3lDRkmVnSyQ8geTCKjfPcLHIBkQniIY7ywKjNZKbUd0BbJvvd9I2V0maY6qvNEy37sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rcxIyhMVlgxl4huQci0IT9hw4zt/8fSTbZVgpMN8HVc=;
 b=WV0ebAV8//5nN6Etuyg6LSOoGj8HxjZ9wxZaW9Y+GaHS90MAjKACH71+Ijmd6W8to8IbsXRMLY1eMAbgzDPTKAxbEtoDl6rFnRd8HsOrB6U9AfYA+tYAfL7QMdbV3kmqSaMLkkGAeEofbRrB+93UJNAkXu8+CaPcLhv9h+hWNGo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <6ea96752-1da6-5566-db14-359b95af9f29@citrix.com>
Date: Tue, 6 Jun 2023 19:16:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] livepatch: apply_alternatives() is only used for
 livepatch
Content-Language: en-GB
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20230606172307.38857-1-roger.pau@citrix.com>
In-Reply-To: <20230606172307.38857-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0183.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::27) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SJ0PR03MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: 659dff21-ada6-4933-1de7-08db66ba3f08
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TrV+WtDA5ih0rV/3F4351iU9F1uszZBYcMtwuKKqMiRrwmtZSp+oY97TAtik7BY7HW8wg2STHjgrODepB2qbFmPxfKvgjNeZmrhhvTTanp0eVoWyEZZeV2Gm4RzdqAFgOFhdbyvUmCKSv4fcNrFYGwUUMKoiC10aFI26uzK/ZDDS+jMxXePbdPWSHgL2dMJITSe1UJp7piqMxr/zObhuNESyeVjBpSRPL7qMVFA8C0fWC6k12nQyZlvSEstrmj3Vl9GG20WiOX3GLeydyx1e3Lw0GbPbDLDMYh4aVIkdhYf5Lzpy0xd3DsAHHKXZj8pW9eOhrxLyoiq2LWZ1G706ynhlhk/44u06dKV7bwjJDp56waYu2wl6TJ69yqKQ08I5u7xPcQixmNobhhZxxH/+lZHc7DUSoZWPfZsyRYvByYfsg7VxsIKjb4qRwbgyMEBu4X2xKbUrErdtPaZStNizuMHWtW48KhV6N8FWrW/XTXVh14v+vUE7BBiBIGmdf/oxTQdTksR/HFcsbVlEdzns7ulzQ1ratj+ek3kVXCBNWVBpivNylJj22e1umOVKD1Ew6zvjpy756gy1kUWXpLpjFPnDmb6X4KF1TjpGdjpeEuCvi4zch4ZyhUP7CowJYBc/M4opia/3GMVg2Q8bJI0WJw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(451199021)(478600001)(2906002)(4744005)(36756003)(6486002)(6666004)(2616005)(53546011)(26005)(6512007)(86362001)(31696002)(82960400001)(6506007)(38100700002)(186003)(5660300002)(8936002)(8676002)(31686004)(41300700001)(66476007)(66556008)(66946007)(4326008)(316002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aW5sYUx1emFkSzRielpBaTF4Q1ozQUU0UXlDNkVRemtqUHhRa0NSOEdodnds?=
 =?utf-8?B?bHhNbjJ0RENpV2FybU9jcGc4TU8xYlJwbmlkNkFhWmZQWWtZNkx0OEpQa3RT?=
 =?utf-8?B?VnErVFZBQVRybVljdWNmNGRRQXFtOGFXZ3F3MU5GU29hWGpMTzF4eGJLYlZ0?=
 =?utf-8?B?SmYvOHJSRFQrQWU4VTdTSUgzektpQjNZdkJCRERCWUVvS3M4aFJadWU5VlJi?=
 =?utf-8?B?UkQ2QUNSTW1MSTFTZjQ1dXNraUxkMTNLL3FQMFNKMGpSakhTckhkQlZpUmVq?=
 =?utf-8?B?aW1BTFljQlJIZ2JVdjBVOFN5ZmE5Qno3WHBkblluaXBaRkc4RlpNMkRxNmhY?=
 =?utf-8?B?SWJYWVd2a0JWZDJ2dVZxZXREbkE3Z2NwNW5zQm1uY3MrdzdqRmlYS2N3MXVK?=
 =?utf-8?B?MlZ4eHNVV2xySnY3OTVDcDJEL2NDRWd0ZldDQUdTcmtRWmFaOXlTYVM1V0VW?=
 =?utf-8?B?T2MzSHREbG9vbWoxK09XWlZ3cVltTEpZbVpXWXBjQUhSRVAvZG5MeWwvRFU3?=
 =?utf-8?B?L0JmL1FuamZ0aEZ3SW9SNVNLcFB4ZmJBVVF3ZnAramY2dERiLzkwaVhEQUx5?=
 =?utf-8?B?TWJuU0wyejRpTzlEMW54clVpbHZ2MStCK3NLTmVXTGVKUWZySUo4dk5rSzZH?=
 =?utf-8?B?K2pGQWVwSlZYZ3ljMUxNVVV3Ujd4aHErUE5VeXRjQ0l3dnNWM2h0d0ZrMllX?=
 =?utf-8?B?RW9RYUFvWG8wT080WTRWN24vbEg0N29teHpzb0EyRUphM0dOQVhOU3dYLzhp?=
 =?utf-8?B?L2xQQnpHYVlzSFJ6NVJmK01KcHJRRWtuQnJpZTlyY2tVSXF0SzlLTUkxUlBn?=
 =?utf-8?B?RFh3SEwwR2Q2R3dxY2VlMExVNUl6SEdKTTdlVnBrTUgwb3VaMzRFYStKMXRh?=
 =?utf-8?B?YjNBYzZqNUtRN2FQcDZpOUdJQzh2d0JxS0tRZ09VS0RkNmtSMlM2VEtlaU50?=
 =?utf-8?B?c3JYcFBmMXNsQU5GRzJSa1dScGdNbDFGWTNIVzFSemUrR3hFZzRkR3V5b01V?=
 =?utf-8?B?S2xXTXdaMnRVc0ExV0xYc0taNHd1MEhwWUozRlBGUVVwN29SRytRNzlqSWpR?=
 =?utf-8?B?QWkrV2tSNnlYYThtdTk4Y2Q0LzRMN0V5REFwdGVlK2V0RFp3cTFXVEJYUWd3?=
 =?utf-8?B?aTFBMytLTGxZTDFWNU1Bc2lRWDJYRkJobnFXamtBazNlL1Y2NlJpT29Tc1RC?=
 =?utf-8?B?TlMvNURXS0hTVmJIZFdBTWRDQzBaWEVFYk5iTkNkTi9hNW8rRkN0ZTdiVG9T?=
 =?utf-8?B?WXo0Q1c4ZzZrRnhMTm02VnJ2SDlmQ0o5alg4ZkZDTUdlbEs1UTRRRk12UVFm?=
 =?utf-8?B?ZGI3VVJMNCtCR2FEdFhIM2lyaW9FRCtieUdGNE5mOGpvNmhTaENidmR4S3ZG?=
 =?utf-8?B?Q1RuR0ZUNEs0MW5wZXIvY2pYK0RTellSUkFIZnZNYnFwTS92OUljODNCNitM?=
 =?utf-8?B?RDlZeE5ZRDBNT3NuVS9LazdDN256bU8rWlUvUm8xb2J1K3MyZmJ0K2NvdG96?=
 =?utf-8?B?L2RhdW9Ob0NOcVhYbmxOamZxeHNhOG9QVlgxS3FlZXZPZzdTU3MraWpRc09t?=
 =?utf-8?B?QWFQMDN5SEVxajdGZ0g4aFRFb3pXZFlJWTg5Ny9JQ1BEdTNVNWpScE94MlNI?=
 =?utf-8?B?UVVrOWpoQXlGTHJkOStOaUVJV1FoMC9vNHdISUlwTHdXK21oUWZOYUN5alpX?=
 =?utf-8?B?Z3BycjdRbnprUG13TlFrMHRXMzQvNmZpQlIxL0ZaeFZyYnpSd2c3eUMwc0o0?=
 =?utf-8?B?aTBQQ3ZDQmwxeFlzUm96b3E5eW9vVXNwc3NrSEVlMzRXd0dWRS8wQTdTSXFm?=
 =?utf-8?B?ZXVRN0pDVkNGa25RZ1VGcklMS1pKTFZKaG5PVHdKU0s5TXlkK3hDUlMycFZu?=
 =?utf-8?B?bFJZU0VtMUhuVzd4K0RRUWQzbTkxTmJRemhGeUJpL0JXTG56aDNsODJVN09z?=
 =?utf-8?B?NkFzZzRuMmd5dHN2TlA3dmkzMlYxeFA1VmlWdEFFNXZORW9HckV1djA5eHFi?=
 =?utf-8?B?endDS00xRDd3d0poSXF5NTlzTngwWXJITGhtSytLMjQxbEF3TnJCa0tYUlFr?=
 =?utf-8?B?dlEwWCtha1VWS3FyQWYvVkt3NjUrL29zM0hpTWtJRWR0bUYzcDdkcU13R1hQ?=
 =?utf-8?B?d2VNTVQzQXVFc3hLUHQ2Z25RdjdHdUtDVlNwd3d5THZ0OGh2WjJWYmRUdzhU?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	MyjtC+nn1Ra1tGvUHvlpJHOqYvM79GkX/9MURNz1utfZ1DiFvHMOo9sfsmW2qTAlQ9PIT8SiizAuwzWcy00TDSzp9MTUWYzIYocHVPvZsLFSbdtFfCCst2dBD3fzoDKmONRxf4YHkL+S/llZ39f02tbogKoov09QPHMBRnV2wLAUZgQywziz+ljgjqTn5u/ZK1uQtgDyXXTdhN9BcpoudyH7etHGDWh00zQ8Doh3n9BOSYqfd9/pq3jG93ls70gdRt7RZuR54WqabLFzvyWvbfVLK94f98SUgCajfPIMZLvX/1r6BCUwt6aP9Lo4umBVeLPNL2QNqmisEKxIC+gUEfNrNq8Fpu8qEneCejs79r1suHFJIQFi1Ve2DC+Zaj1c/rmJ+bPPMKKFffq6zqGqUtVrBAsFk1ygjfVt4NuxmPA8p1UhIxskanvb9d3nULDNV2+6PphLPcHJX3K7dAUX0di989z+mcwYBTX0dQng1j68hnEsFzFJHTHNi27P+5c+RcXj/5uQSfYg9xLWrKcl/ULgOLVfcapRmv1zehip7PK0fCEzs6EB5Fq3cDm/gB+/8O1Tha0NeAST5ZEWpwCi4lZtCNEHVzjPzFJ5h9P+PgIVkeXzdSrU8+ru1ZbR80oDN3mFpUU0dfoagZAoO1xYgW2TeRvVvven27N94/fg837GNBqceJjRLdjzqccK4XkCMwoA6wwtGbjYT+ghVqaz+CwydgkPPmD6hxYhgvtLktQWtTFr+xi9TGZS8nltxVhLqtSNCjQM7YLjlmWuD+xPOYripBeNARO5z4gzVky90PtUNuRUZB3gnvZhg4slXniaoMWvWsiYDLWaD3IBqfZoVLkuOp4kOIYfeu6RqU1rq6gOZgAq5tOIf+C1sb1+PhuUv2s8FEKKl4RnilSE5MTlNw==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 659dff21-ada6-4933-1de7-08db66ba3f08
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 18:17:11.4132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8eu3gPnHIERiEf9I//jkHSIj1IYXbHzjCw9nu/s32yBfi7GzN68ZELnovMtSdLqBM1MR8Ga0RbL+yrqBwqVRLux7/fuPX8oXMzLLmyfJWCI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6793

On 06/06/2023 6:23 pm, Roger Pau Monne wrote:
> diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
> index a1cd6a9fe5b8..688b554099b3 100644
> --- a/xen/arch/x86/include/asm/alternative.h
> +++ b/xen/arch/x86/include/asm/alternative.h
> @@ -24,7 +24,9 @@ struct __packed alt_instr {
>  
>  extern void add_nops(void *insns, unsigned int len);
>  /* Similar to alternative_instructions except it can be run with IRQs enabled. */
> +#ifdef CONFIG_LIVEPATCH
>  extern void apply_alternatives(struct alt_instr *start, struct alt_instr *end);
> +#endif

Given that this is called by common code, it shouldn't live in an
arch-specific header, and it absolutely shouldn't live identically in 2
different arch's header files.

As this is a cleanup patch, we should gain a xen/alternative.h which
depending on CONFIG_ALTERNATIVE includes asm/alternative.h

This will help RISC-V too (a little).

~Andrew

