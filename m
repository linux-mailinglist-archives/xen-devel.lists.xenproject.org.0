Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD806C51E5
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 18:07:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513542.794692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf1ul-0002lG-5O; Wed, 22 Mar 2023 17:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513542.794692; Wed, 22 Mar 2023 17:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pf1ul-0002jB-2Z; Wed, 22 Mar 2023 17:06:19 +0000
Received: by outflank-mailman (input) for mailman id 513542;
 Wed, 22 Mar 2023 17:06:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5r5y=7O=citrix.com=prvs=438090303=roger.pau@srs-se1.protection.inumbo.net>)
 id 1pf1uj-0002j5-Ts
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 17:06:18 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7b14e5c-c8d3-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 18:06:14 +0100 (CET)
Received: from mail-dm6nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Mar 2023 13:06:03 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CH2PR03MB5288.namprd03.prod.outlook.com (2603:10b6:610:9b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 17:05:59 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::48a7:d1ab:897:acda%6]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 17:05:59 +0000
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
X-Inumbo-ID: d7b14e5c-c8d3-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679504774;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=q3SNUVE/IUY9EjHG0zZKyW8zb+MonDmkXt82kT3iquo=;
  b=QRrOZRUM9t50scgx52RoGurMFpBRJWxYT/Os0V2mYeUtNUinOWvQ8bD0
   06ho7guhs/Y83/5qVSo65e6w1Ey538yy7d5BnJ2KNWA3eAYVT9I1fgbej
   5UsNDRyf+lZoV2bCGzhuqulQHV6soBj7jjMy+sbf1MCCaw8txa0fByRCh
   E=;
X-IronPort-RemoteIP: 104.47.59.176
X-IronPort-MID: 100699877
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:FSAvdqLUkkzZOy2dFE+Rw5QlxSXFcZb7ZxGr2PjKsXjdYENS1zEHy
 DQWXD+FP63cMWumKN9/bt+/8xgPsMSGz95gQAZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpJrfPTwP9TlK6q4mhA5QZkPaojUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c4tXHEJx
 81EBwsxcxuD2++T7uKEU/Vz05FLwMnDZOvzu1lG5BSAV7MKZM6GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/dmpTGMkmSd05C0WDbRUsaNSshP2F6Ru
 0rN/njjAwFcP9uaodaA2iv03rGezHOkB+r+EpWg2OdbhXGIx1UONwNOd0Gi+uChr0ihDoc3x
 0s8v3BGQbIJ3E6hQ8T5Xha4iGWZpRNaUN1Ve8Uq5QfIxqfK7gKxAmkfUiUHeNEgrNUxRzEhy
 hmOhdyBONB0mLicSHbY+rLKqzq3YHIRNTVbOnFCShYZ6d7+po11lgjIUttoDK+yiJvyBC30x
 DeJ6iM5gt3/kPI26klyxnif6xrEm3QDZlFdCtn/No590j5EWQ==
IronPort-HdrOrdr: A9a23:rzwSFKi/56Q4Eea+fbqxF4lEmnBQXmEji2hC6mlwRA09TyVXra
 GTdZMgpHnJYVcqKRYdcLW7UpVoLkmwyXcY2+Us1PKZLWrbUIXBFvAf0WKg+UycJ8XGntQtqp
 uICpIOduEYb2IbsS+K2njdLz96+qj/zEnAv463pEuFDzsaCZ2IiT0XNu/xKDwSeOApP/QE/b
 Onl7t6jgvlV3QLT9ixQkIIV/LEoLTw5ejbSC9DKR47yRWEyQil4r7iExSew34lIkhy6IZn32
 jZshDzop6uufGjyhPayiv64plMlMH6o+EzdPCku4w6KijMlg3tXohnVrGY1QpF2N2S1A==
X-IronPort-AV: E=Sophos;i="5.98,282,1673931600"; 
   d="scan'208";a="100699877"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lwNeXtRefGaD8wu3VXqKJcE8j4fzidsjuOKlHlwvoNTI6nJxJjBB0RO+D7BXYGn8MOTJg50U/02apY13sVowFLG6seOC8fozkeg7G30V1/X/dOknBSa/RI/LTpCymjBOwmGuFmsYftABJm6szWYT9QqdcMBIVTEdB4I1L4XYCeiYKsqW3vs23+xhvPXLbn4xQXKD9amauxtnee2jJKaCdl6aF7o1BDYjgRwLYf+WWNN/Pc4C4ZkNWwczvCplET/QY8OUnUPJ8OZ7/ptWb2rCi1vBWfZhm/H16Lm+zRM81plcO5oJRC3jPOBp6DHR2dxcay+kFjVYd9+j/zUMZL3nxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tO6LWwIJvKxuNZ9gS973aQcaXeLO0WPRZAcNXifVCE=;
 b=jejfW5EFyMsF6nCrLJS9Ha+G70rivT8MB3gyPaoBGcLMxDKiHIbFNe/W+Ie13foTROc4yvLcW9hHwkhbjPQn5dBZdktnUbpevvLmf+xUqxSbqGtB1bKTJYvHaeArhZG3uTr431vcenk1pQ+yhftseQjfRTNqThcuSw6Dgv86pqM5zKCJUhYu5J7J9l8fXhMdLE4Z0+CrHO7YbsjU308cNzaYZQnzqZAyZWkGoeXik7oXvbwWefrI0NXo3yVuPbjKMoYN3fq2epMTK7Hu/7wXwTIZyaZAJxRx1fCmitZYsTRrMYFqfUuu/eHjuAlfKS+P4ggdRW3CzZu9JaNhsDUHBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tO6LWwIJvKxuNZ9gS973aQcaXeLO0WPRZAcNXifVCE=;
 b=Y7tPZZlxDe9xk1xOtpnza7F6usYL4YVE80bUN6jlrfFcroG8VyVCNWIZff5UaFYD/qG5lz339L3t1STLOJpw7V8kWVCeSmQGuo1EQB32qtXspSgtlQXEU8TE3AoSXjJCqQfV3f/YI4ZYgYHQQz3hFAncbno3RzgbjD+6GBQTs/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 22 Mar 2023 18:05:55 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3] vpci/msix: handle accesses adjacent to the MSI-X table
Message-ID: <ZBs1c7ILtkRQOzki@Air-de-Roger>
References: <20230322143001.66335-1-roger.pau@citrix.com>
 <0a69ba74-71fd-101c-2f06-2cd6ced412b4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0a69ba74-71fd-101c-2f06-2cd6ced412b4@suse.com>
X-ClientProxiedBy: BN9PR03CA0861.namprd03.prod.outlook.com
 (2603:10b6:408:13d::26) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CH2PR03MB5288:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ddbf839-4e21-4eac-77f8-08db2af7b57b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4crIWIYCvaC9rX/Q4XK1xwhnyR6UDPNXadGSnM4gJQ7fVqvebetVBWkIwTmOB1fNr43bH4CQVg6f+9V7/VXrushYHFgws7R07Fs3u7/lgO75u4FLayFajdXK4gm32yUidMuJkHW4IxZ3vH+jghp5+QK/ZPKxaUv9cDCTKPaJcGQOm3zFdeXko72dvEkG8k690YQCohOOwLoY5geFVVzvGj4tVPRQnbxTlKwvK1jJbeHFD9/mcnAvM0Pmtx4gagG6JMY1NjznVv/vdb3bakDZ34cspMbxF2mU6UXZTyym1zcJiXXwZEcfp0YEuEeONwnCZ0kwi9hRwklmaFkaiBttMJTeblyXcJfzu1AV4MscwhoUK8C0fO87/D3w53j4gdy72sOHR0RVLpzaRGAHX7uDqbVgik36Dd4+KpJhsEXOSXCNtE/s+xnuq/YtjvK/kfQv9nSHjsH1Oc+Wrx9YlkBysgzlR6y4BigEt7V+VzyXCgHqLsovc0k89Ucau8QoAd1WiV/I7ShAny+puwi8HcZdg5PmZHRcyO+gYPwWvYbmSC1gcaD4G1rqWxjeoxf1NH/zBpynveKmTaz34RgAO9eMNT4ZidIYv6B7csqj5frRYSKrKfdhaWtOXE2/BdKSNrOjQjwm7jhcwQ1y6BPhNULPcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(7916004)(346002)(396003)(136003)(39860400002)(376002)(366004)(451199018)(53546011)(26005)(9686003)(6666004)(6506007)(478600001)(8676002)(4326008)(6916009)(66476007)(66946007)(6512007)(6486002)(83380400001)(186003)(66556008)(5660300002)(8936002)(2906002)(82960400001)(41300700001)(38100700002)(316002)(86362001)(33716001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zkl0SnJiei9qd2RldVBGU0FmZHZOL0FkcmdBcStwUmJwamxHZlI1QXRYOGla?=
 =?utf-8?B?dm5XUURLdDRpMmhlQ3ZGdm9JekQ2ZXVZWnp3RzY3dHhQZGJTWGdSUE1JaUhZ?=
 =?utf-8?B?Sm9BWU9KRDVrYmwyQXV1bUxZaXNBRXdxMys5VE5uNGErTEVTR0FxQVF3eENs?=
 =?utf-8?B?aEtNZ3U3cFhjdExhWkppZmdtbmNZbUV1RzUveHowK0YrNEhPV2RVTzZoalEy?=
 =?utf-8?B?RGRkTFdkV3pLdEpTVzFKRnhmYXFxZ0NXVXZKUGZVbzM0YWkvWm9KWmthUE9C?=
 =?utf-8?B?akFaLzNJZ0hJeWFCcHIzSHl2cjZCbzRqOEFkTUpiUjB3VUxySngyemxyRWd1?=
 =?utf-8?B?NTdudXdQNjlhTDk1VHZJSXJvL3RMQ0p0djRMU29VMFUrak0rd0RsK2ZUOTNj?=
 =?utf-8?B?S0VyeUIycDNEWCtDU0hpRiswL0owVlVKQXl3QjI1QzlVMlZCRjUxbzdiYjYy?=
 =?utf-8?B?U2pBVVBaT3Y0cTJtZ2ZxRTh5TUl2eFhxZFNPYVRGSzJWbjZwMHc3ZE9vSWh3?=
 =?utf-8?B?SGFxdXAzckg5TDlRNUUyUHVESXlmTlkyczhHbGVYcHF2bmt5cGtqWFpnY3lI?=
 =?utf-8?B?OTZyb0x0VmFYOVlkUnFBdjRBVTdKdU1kQU1SUnV0TVAybGpuNVFBaFZ2cXhq?=
 =?utf-8?B?WGNXVzZzQVpWUkZxdk1GTVBuc2dKYTV2NWF5VmhIRStVVzVwMm14WStVZE9x?=
 =?utf-8?B?UnJvTUN1RXRxVFpLV2tWTHFiMnQrU0hzVFdrWFYvL0JCUkxNM0tvcVFqTHBB?=
 =?utf-8?B?QVdYUVRNRXlqL1JCRTQ5cnJ2RGV3RytweHA4ajlyd2pEbUl3THpCWG9vaWc3?=
 =?utf-8?B?bURrbFg4RWNMamo1TWU0NDVydm5PUXkyZ0V6ZGJLZWVoOHdaM2NwZ2s5bkVW?=
 =?utf-8?B?NklkN3Y5bkhTdmZNTC9sa2k0K3lDMTRBWUZNaFMrZW5jTGFIK1AweUtoNWRQ?=
 =?utf-8?B?eDVrTW5nL2RHZ0FtWFBCR1JxaTZ3YmwzejZtVWVaTVRiTUJ3VUU0UWhYWWJw?=
 =?utf-8?B?SHhiN0w4TVpJdHZqYzlYYThvcW5MWTdCVEZoZ0REaTU5c3h6Q2haUGVRR3B1?=
 =?utf-8?B?VEROd3FyRWYyQmxtYVVSWVJ1VXpaWDN2QjVKN1p5UWVUUGdNSVlvd1hHdHBN?=
 =?utf-8?B?RzVvRCtyNkd4eTVkQWd3ZVBOaXN1cTJ1dUE3Y2s4LzBmay9STnBSdzRPci9Q?=
 =?utf-8?B?a1c5NXRRdzZuaTBuTm1SY2o0eHR3N3FTbnN0Yk4yaGE1V2dxNnVDV2xZSmha?=
 =?utf-8?B?S0VPN1JJN05SNGFSOVNLaThPZGFjcENiNktUcGNDVE5sd2N6K3Y4OHU3a00z?=
 =?utf-8?B?aDBxR0NxRWM3eW1kazZzMDZ5YlIySmtoandONHFxUFErMWVNUTM5YU8vcVhp?=
 =?utf-8?B?UUlpNUlMdkl1WGVaTFFCaldmOWV4S2dMSXZxNUFHT0tmcTYyVVZmbjdiSGx4?=
 =?utf-8?B?Y2tMWUlrWUFIMlc5NEdhYXRGMTRhdjJzZFI3WkdsYzZadml5RTN4NGZIL3Ry?=
 =?utf-8?B?Mzl3a21qZzV0cEJlMGp3Qmk4NW1va2Y5VmpOV3VISE9kejRrSmt1RXFZTCts?=
 =?utf-8?B?T1cyL2grdEVXTGRyMDBCcFpVRFEySW16bHlEandMa0J6NmUzbjhUcjJFNUpY?=
 =?utf-8?B?RkNMdll2WktqWjdSWi9kcmpkeFRIUVVtdlkvR3ZUS0V0NUJEN3JNWnpHUlBy?=
 =?utf-8?B?WW5WbjBEUlo4Z2hwOUNGem9YcE9pUDJQcnlndHpFK1o4RFM0U0d3c2FseUxy?=
 =?utf-8?B?ZnJzakRiSWFjUGo1bFl4MU1SbmVybHlVVC8wYWV5NE9zeUw5YmZoYXEvMDJl?=
 =?utf-8?B?L1NvZ3hmTkpFVFhuK2JaeGZJaXRrNjNMVmlDZTlqa0hkUzYvWkxtRHQ3SmR4?=
 =?utf-8?B?Y0Y3dWhOODFYbHgwc3l0dy9ZZVJLdmxYNHFvWmlpdTQ4a0pSZFhFRVJEb0Ry?=
 =?utf-8?B?MVEyUVdydkhoQ0tObTNBMU5PeWlZY0xQM24vOXg1TW9Od1dQN0I4N3BuTHZI?=
 =?utf-8?B?TXJGWm5ZQTZvYzRKMEtxd2VIaUdlMUNrd1ptaEhmUU5UOHNGdjJVbldFaVQ3?=
 =?utf-8?B?Y1dWZ3pUdFY1UVc5WVhNYkRTZXhXT09ybnR2eVViMXo1VWxOUVBEdTVBVWwy?=
 =?utf-8?B?Y3Qxa3gvWnp5eVMwdzVvcWhlb1pCZzlVMkVZL3hKVkJQUTQ0clUrQ1ZnM1VQ?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tDhTT63Y2dByJZmRv9usKPHVi4E7iOn6BDJG/5SZFw5r5RukOcUenBv+KoViizJ1P58Xi17RtIZcApCYcy/pzHbYCBil7MynjKmClGP//MDGdEPYHhfy+lSwyQAJW03kSq3DnxirGFXjAYVlPfhbZMKgShmMkzMUcIIQaAyBW1uhnWIw84kdIzceYukIfFXKgFcDb8N4oToDg4RgnqzaU5wJUMaDQ3czcgLsXOHC0d+i1cTEmhG3cOw8g9aSkLIMm/mYBVzh6sEjYT5LbIBcRTGH+eCHvyp3kcIVnFo6VC02fs5dACE6eEroe7EfwfNTygCWN/RRFiuVBS/D59CjRUSyR8JZWTZtvb5I94iIcviEN9wjowLYS/0gTgpikui/rBoDizTSa0/xJ3DlefO+y0sPK4vYe1XCTGOXGdPwhP5oeosYGskMcQwVmmloMR+oKnjm5cX3IjqCNnL6DR1r0ANhVT/WOk9BT5cO2O6MZk7Wfzip49a7uIkjO8sWpn8Cwo38CYkE7uULFP3bVofVw0Rn20CAakx4azXGYKgmR/tjcKa+uupPhnOwfk4Q2Dvk/vFCzX0jrbU22KfDCFfkC+/AKZi0hahf2Efu9PMHJKWD/PrLT6eTPyikeQfFbzylRWoO6eSU9fZ0uZlSofuBpqnJwWVPyimj6wkcZeP0zMIl8w5mnAkWzSebwq84RwcDJMOiSx4NLzuFrNDjOGniMmBuWH7Mqj3YAl0/mWez2syuVw+qmbR1RB7I+IRlZuNESf4cttbegwV8frAsFugqzrGLUi9E6xBMcQjYC4+Ysnc=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ddbf839-4e21-4eac-77f8-08db2af7b57b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 17:05:59.6238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eI0KMycTKou7+g5peiXeWz4xT11pjJE00jTnTjAnMuWcQo7KF+ViTbgxedpH/y6SxICvG3AhrlomTXV6ULtZNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5288

On Wed, Mar 22, 2023 at 04:14:54PM +0100, Jan Beulich wrote:
> On 22.03.2023 15:30, Roger Pau Monne wrote:
> > Changes since v2:
> >  - Slightly adjust VMSIX_ADDR_SAME_PAGE().
> >  - Use IS_ALIGNED and unlikely for the non-aligned access checking.
> >  - Move the check for the page mapped before the aligned one.
> >  - Remove cast of data to uint8_t and instead use a mask in order to
> >    avoid undefined behaviour when shifting.
> >  - Remove Xen maps of the MSIX related regions when memory decoding
> >    for the device is enabled by dom0, in order to purge stale maps.
> 
> I'm glad you thought of this. The new code has issues, though:
> 
> > @@ -182,93 +187,201 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
> >      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
> >  }
> >  
> > -static void __iomem *get_pba(struct vpci *vpci)
> > +static void __iomem *get_table(struct vpci *vpci, unsigned int slot)
> >  {
> >      struct vpci_msix *msix = vpci->msix;
> >      /*
> > -     * PBA will only be unmapped when the device is deassigned, so access it
> > -     * without holding the vpci lock.
> > +     * Regions will only be unmapped when the device is deassigned, so access
> > +     * them without holding the vpci lock.
> 
> The first part of the sentence is now stale, and the second part is in
> conflict ...
> 
> > @@ -482,6 +641,26 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
> >          }
> >      }
> >  
> > +    if ( is_hardware_domain(d) )
> > +    {
> > +        unsigned int i;
> > +
> > +        /*
> > +         * For the hardware domain only remove any hypervisor mappings of the
> > +         * MSIX or PBA related areas, as dom0 is capable of moving the position
> > +         * of the BARs in the host address space.
> > +         *
> > +         * We rely on being called with the vPCI lock held in order to not race
> > +         * with get_table().
> 
> ... with what you say (and utilize) here. Furthermore this comment also wants
> clarifying that apply_map() -> modify_decoding() not (afaics) holding the lock
> when calling here is not a problem, as no mapping can exist yet that may need
> tearing down. (I first wondered whether you wouldn't want to assert that the
> lock is being held. You actually could, but only after finding a non-NULL
> table entry.)

Oh, yes, sorry, I should update those comments.  vpci_make_msix_hole()
gets called before bars[].enabled gets set, so there should be no
users of the mappings at that time because we don't handle accesses
when the BAR is not mapped.

Not sure whether we should consider an access from when the BAR was
actually enabled by a different thread could still continue while on
another thread the BAR has been disabled and enabled again (and thus
the mapping removed).  It's a theoretical race, so I guess I will look
into making sure we cannot hit it.

Thanks, Roger.

