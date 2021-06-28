Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8623B5E5F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 14:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147854.272959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxqgH-0008Cc-JL; Mon, 28 Jun 2021 12:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147854.272959; Mon, 28 Jun 2021 12:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxqgH-00089a-FL; Mon, 28 Jun 2021 12:48:05 +0000
Received: by outflank-mailman (input) for mailman id 147854;
 Mon, 28 Jun 2021 12:48:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxqgG-00089U-2e
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 12:48:04 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6606ec7a-2b92-4643-a1b6-d27c87927252;
 Mon, 28 Jun 2021 12:48:03 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-6-4d7CqSfVOSiidogRbvN5kw-2; Mon, 28 Jun 2021 14:48:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6303.eurprd04.prod.outlook.com (2603:10a6:803:f2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Mon, 28 Jun
 2021 12:47:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 12:47:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2PR09CA0003.eurprd09.prod.outlook.com (2603:10a6:101:16::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 12:47:56 +0000
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
X-Inumbo-ID: 6606ec7a-2b92-4643-a1b6-d27c87927252
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624884482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cIycQI4iuwXTPEuDjO3ZJ5nWRpgCyn8TiB2q9eb2DW4=;
	b=dPIJ10i9yO+wwKJiO4fy34Nk3ODJQGiojGrbKLKcBgBcNEFd+BAmCgfGXecRaEsQXS84ts
	hybXF4wA+xwa+i+33TCa6XIOwwEbXzA7C6PIaNqr9boslyPkYHDsPDSKyj116ZXmls2rA/
	sahuD6l3hkC2oKZqkeO5awlmk2NlwGI=
X-MC-Unique: 4d7CqSfVOSiidogRbvN5kw-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3Ub3A6ArI9bxt3a2c2/4fxfyivYpoNU9vuefVnCi7UYdL9FJCJC9fJmVp1TmO/F/WiaAQzRa7cr8Y9As02lop9z8eBiG7eL8GtTe7seYrjARhYToyi4Janb6tDrHrTLzWmeQvVZkbjm8uzrYGGDTwi6Q/v79XZyKCUEvrbpfuHPCcAVjZKum+MJURzMW6JXv+r42cj0cjcboI8ggbbZbGRNqyC0NoU4c9B+eqExF4R9mo2uu3Lpl+O7MGqdMZCdh6MgtHtt8BZWFEOweGaqD2bXBgOpYPW6jFd1RWBlew5znoDbSc5UwPNXkMpwuH5szcUGMaI2QO1uqYEdgsnuew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cIycQI4iuwXTPEuDjO3ZJ5nWRpgCyn8TiB2q9eb2DW4=;
 b=XPRS2W1i3lTzwz2vMIGsueDjY5rpTg/gCbIzGuCiKYITNSP7ZjruvwhTUaDH7Rp7lpwSG3PQypGJUughQ1b/7Yu82uuQHij/SH0kjuadkrGDp9jOUo0YS24Lwe5W0XZ/aalODBtlY13QqVj2pPJaJNh9h5N3B+NGAAchxqNLb5cl7n7470hXyqZi+fQy/QTD0br0TR39hvgLtJgJt8GsShxCOy+kQLd0FpowfsePyGM9y3mWd27s+1VmwCyJgqY1AX5j3sEWebpUeV7gjtjXp50n9jLZyLFswYF2TFEyUJ83CmVT3EC7ecvA4RKz8g57DiOSnimIhoB6QC6zipJbJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 3/4] tests/cpu-policy: Rework Makefile
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210622182124.11571-1-andrew.cooper3@citrix.com>
 <20210622182124.11571-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b8ff5619-2684-b8d4-c30f-2102fbd72284@suse.com>
Date: Mon, 28 Jun 2021 14:47:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210622182124.11571-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2PR09CA0003.eurprd09.prod.outlook.com
 (2603:10a6:101:16::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: efb51a73-e84e-4a8b-642d-08d93a32f42b
X-MS-TrafficTypeDiagnostic: VI1PR04MB6303:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB63036C3805B7BE4D0C39D80FB3039@VI1PR04MB6303.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uLlv68JFSySXRtHV+Hko/8Wp2eomhjDkwV26cHJqn2nKyuA60ULxEMf6z5EyHZSf/hJuujPyoPjWFjSJ7KVCEHtCS4JXpPbK3muCItFWi/mgchRHd0TXkG4RpsqBLGnoADWgvAZbTSWgMLUhnxuWhzZpDL5YuhPSunqEWIDenL0ZFk3LfIKKYRPdKW+JnZrYiL35+qXloEZcGzRvUXxy1jvPkqk6TvcMK6OHfbt86HsYl5eTIi9rDqCxbhc0eZqjBpClrgT9WCFb2tgRvfnNvfjS6yM4rWOu19tsrtCCFZ9mQcxyYUcCyB+U4KnjFdLTICZ1BJApBn++LcCdUoOq1AOAmMAiOAv9Yp6MWwBzOhzjDONIjc7LLN+D6ok05H7U7v0Kbu3PPXYWnYXLIMrIryY56I3S1e2MLfO1MueC8XTzjy/tlKaw4Mhlr5mXH/1Y8hEm94VQjz6Y2i2GL7Np18LK8qtkfZ3In3jusk7IiVCoV7xQYeobEjXayUwXSeHl+lUjOPu/O7lItoF3LcOvzU6NDJCfx1ViSyviAs5Gr7zdcl/Z4N/IbDbqz9EgNhpTbVam8KH1N8VOg7J1ZsBpP+U5XfwtBnCxopYlggMcS1CS7xWXMiSKSyjxp0CrSdaGGW06g01nllheMjFXRYHygqS8hpI6Rh55jvwTmKpvGzCLsyPj5dRtafolu9mQlP/BiAs/mnZqQNpyNRAHxzBRZvCN3pUCC0ZsCWYMUb58Vxo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(366004)(136003)(39860400002)(346002)(53546011)(8936002)(26005)(16526019)(2906002)(2616005)(83380400001)(186003)(54906003)(36756003)(38100700002)(4326008)(66946007)(6486002)(16576012)(86362001)(8676002)(31696002)(478600001)(66476007)(316002)(5660300002)(956004)(6916009)(31686004)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2U2L2lqdVhGWmlYV3kvVEZiejRsVC9PK2d3UjVTR294U3JDSFprWkllYkhD?=
 =?utf-8?B?TXBNRy93T1FCK2ZPRDRGYkxPQ2RJbnFHWlhOYUdOSUxrSmxhK0o5Q3QrYk5a?=
 =?utf-8?B?UGZGbGdQV0RqV2NKeTZqeVhWdGJhcWd2S2krZHp2a25JMXI1STgxUFAwN0lW?=
 =?utf-8?B?K0RFVWJDZ1pZZlFqdmJoMDdyYUhVSFR5TzF0WXV5cUs0djJqUHl4Nk5lSHc2?=
 =?utf-8?B?bVdqOWJHVjVBTmg5dVlHVjB5OVFBNG9HRlJmUEcxbHJXMjhwSXYwZ3ZEa1lH?=
 =?utf-8?B?RWtaSEtBUmNVRG5UeDZKa0ZwMUhzd2dyYjRQV2dXb09McXNwUllSQ2V1WFFH?=
 =?utf-8?B?Y3M3TUp0UDI1WE1lYmx6QXFPZ3lKL2VHSnBDa0hyYWVRSmZXbEszalQ3TlF4?=
 =?utf-8?B?RWw3OWkxakFna2Jnc3FCdkdudDRwdnY4WFM0SFZBOWF1RWczanM3eGRYTDVQ?=
 =?utf-8?B?aEh3R1F6WHVTaXFDajlZTjJldVFtS3ZxU25GV0J6azJ6OXZhU0poVitXSWVI?=
 =?utf-8?B?bWNOMXhqWWZuWm5HU25MVXRHRzg0Ti9jVUVnL1VEUHg0YkQxRDFPNnVzSE1t?=
 =?utf-8?B?aWFVRXJnRm5PRGZEUitpa1J2WklEK2lXenZBSW1OVWhHSE95V0xXaDBqSW9E?=
 =?utf-8?B?aWRrTXQwQ3NQTnFzR2cvMWNmMC9WZExWaGk3dGdNSlhOdEE5VmVlb3JSTnFZ?=
 =?utf-8?B?YUd6VGxqMWcvWE5odDM2RzI3bWszMDYrRHhZeUp5WE81RHNDRzFobzZ5cjJt?=
 =?utf-8?B?Y0dJckplVjZ0TTc5TVZXQm5JNURPNzE2aHgvTXJ5NVE1Y0ltVS92cE41TWZO?=
 =?utf-8?B?RjhSa0Z6aFU0NWNsMW1RRzYxcitnMVhsWDllSlBZNk9yYVQ1QnpaZ3AraVA1?=
 =?utf-8?B?UjJGRFdBV3hIOVpKVHhNUERQbmsybkhKNmk4Yjd6U3R4OXZqa2dxQ0s3MWxS?=
 =?utf-8?B?czR1cUJtREdCNm9Xb3RaRTVWdW1jaE1YOEgzVlJNVVU1R095YVdwZkFCbHpM?=
 =?utf-8?B?dXAwQ09jWmxkbFJFcC9BeldxMlBFWVdzWFVPYk9JTkNVSDVoU0FNUGlTWWNh?=
 =?utf-8?B?emRtSFdBV0l6OWtqY1R3NWxrV1hmL1NoemU2aDhUQU51RUsxbE5kRHlabSsy?=
 =?utf-8?B?QUM3MVdVVWpxa2IxYjRPMG5tSmNUZFY2K2tERE0rRlNMM0kwUzNvY0dGdS8y?=
 =?utf-8?B?a1FycEE5UzJRemh1ckdFTUh2bFB1a1BJdVpqTDVQcDY5L3R1Y3lramV4ZFZF?=
 =?utf-8?B?QjRSOExteHh5M3lZcUd4WE1oVmZTcGFaOGVDRVNPVkdCd2dybGc0bG1jb3p6?=
 =?utf-8?B?WEJRZlFMTGNsYjdJc3FUbHlUMzVtT0tJN00vbWxndzMya0JDVFBkQUZtMTU3?=
 =?utf-8?B?N3RZSFJCR0gvYm1la2FhNjFjTXB4aXR5S0NDaFhaRXVpQTFWRmFDMWdvZzZz?=
 =?utf-8?B?K1o2WTJna2JIMWdCYVlKL1ZhMDNGMzBiOGpudXAyelhiTlFIODhWOVBOb3Yy?=
 =?utf-8?B?L01mSkhFVWRNWE41dTUrNmJ2eHRlazczdSt6L1JlMUNjNG14V2ZCK0p1UHUx?=
 =?utf-8?B?OUxLVHBqZ2lYQXhJSzFPQVhZY1pUTmc3ZFJtUFpyeVRUN0RSa05lem5mSEd5?=
 =?utf-8?B?WVZ1ckJlNEp5MkJ4Z2EzUURwMGsydVp3cktXbmQ2Z3RIU3BCLzZuZ2dqM1o4?=
 =?utf-8?B?S3F4b25aaVNGV0ptU2hZMGZxWkE4cGluUzY3MXlaamd0S2o2NzZ1dE1Cc0FT?=
 =?utf-8?Q?muTQO/Vb7iCTPtB5mxHfFzlwypgYbqpv/BkJugP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efb51a73-e84e-4a8b-642d-08d93a32f42b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 12:47:56.9705
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EomltINoaETcqb9bTKqZwI5VjyVzWqTPtXgEi9VOB2TIQGkU8Lxu3NAf7Cv1ertzeFuNAQ8vBff3jXGgRAbSaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6303

On 22.06.2021 20:21, Andrew Cooper wrote:
> @@ -23,23 +21,32 @@ run: $(TARGET-y)
>  
>  .PHONY: clean
>  clean:
> -	$(RM) -f -- *.o .*.d .*.d2 test-cpu-policy
> +	$(RM) -- *.o $(TARGETS) $(DEPS_RM)
>  
>  .PHONY: distclean
>  distclean: clean
> -	$(RM) -f -- *~
> +	$(RM) -- *~
>  
>  .PHONY: install
>  install: all
> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
> +	$(if $(TARGETS),$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC_BIN))
>  
>  .PHONY: uninstall
> +uninstall:
> +	$(RM) -- $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/,$(TARGETS))
>  
> -CFLAGS += -Werror $(CFLAGS_xeninclude) -D__XEN_TOOLS__ -O3
> +CFLAGS += -Werror -D__XEN_TOOLS__
> +CFLAGS += $(CFLAGS_xeninclude)
>  CFLAGS += $(APPEND_CFLAGS)
>  
> -vpath %.c ../../../xen/lib/x86
> +LDFLAGS += $(APPEND_LDFLAGS)
> +
> +vpath %.c $(XEN_ROOT)/xen/lib/x86

Is this a good move? In general I think relative references are better,
because it is then possible to move the tree as a whole (or access it
from multiple locations, where each one has it appearing in a different
place in the file system). I do realize though that we have many such
absolute references, so this one more isn't making things much worse.
Still
Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably with it left relative (or a strong reason for making it
absolute spelled out in the description).

Jan


