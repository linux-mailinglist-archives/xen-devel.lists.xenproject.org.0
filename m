Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB2F34ACE4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 17:54:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101965.195359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPpj1-0008F0-7h; Fri, 26 Mar 2021 16:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101965.195359; Fri, 26 Mar 2021 16:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPpj1-0008Eb-4G; Fri, 26 Mar 2021 16:54:19 +0000
Received: by outflank-mailman (input) for mailman id 101965;
 Fri, 26 Mar 2021 16:54:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MLVS=IY=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lPpj0-0008EW-9e
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 16:54:18 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a82b306-f257-4039-baa2-4c13fa723aee;
 Fri, 26 Mar 2021 16:54:16 +0000 (UTC)
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
X-Inumbo-ID: 5a82b306-f257-4039-baa2-4c13fa723aee
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1616777656;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=8V1frlHzzkycMXgCP01vXInUX3cSxkbUvRQFSIuKzAk=;
  b=JVC9i1V3kPPwYcREQPMrRwPFk8bW4UtrdEmfEjIpM0fs6T7FZGnbZkL6
   AJz7okWHHx0wIcun2pmA2j+NEdjAS9r10Zr+tzDKtR3ss6x1G2vzlNXLN
   PFZaMS8uFNVJtbNTOBLA42DQfsk4didzhrDsqN8NYet9xAxcgxWsztKTd
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: L43dheEaLnqrwktK5rHaqU+iD1O1IgU8K1hCI7eTH6614rs6A4qVgrWeFN3bt9Oy/IbHYPFyYP
 ZuvvtmipQZNGFeliha49kws3NHrDFFsONEKAEW7WsOyNgMpkASoD2j4hasp08iNN3QH9Cuby5g
 39xWAHsOPXEU5b/JcpxQC1sJDUwpFm6taT0sikJWeeR3I7j7Ndx6oZLzIA/8kwTbRqES1EoYxT
 va9nzLkKTa2XJsZ91B5VTYRMT+dwi494cav0ldtcL+6ev2geNB73oax0lidnLv7a6Lzat60XWb
 acw=
X-SBRS: 5.2
X-MesageID: 40239500
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8BWd7amh/IABgyHUzGMsZywHrN3pDfODj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN+AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 hdWoBEIpnLAVB+5PyX3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0YNi+wOCRNNW57LLA+E4
 eR4dcCgjKmd2geYMjTPAh6Y8HoodrXmJX6JSMcDxk85wWUyR+u4rj2Ex+Xty1uLA9n67Ek7G
 TDjkjF9ryu2svLtiP0+k3yy9BtmNXnwsZeH8DksKkoAxjllwrAXvUbZ5SspzYwydvfkWoCsN
 6JmBs4OtQ21nW5RBDJnTLI+y3NlAkj8GXjz1jwuwqQneXcSCghA8RMwaJ1GyGpk3YIh9133K
 JV02/xjfM+Znms7UeNham9azhQmkW5unYkm+II5kYvN7c2U7NNsZcZuHpcDZZoJlOI1KkcDO
 JsAMvAjcwmFG+yUnaxhBgK/PWRRHgpWj+JTk8e0/blqQR+rTRSyksVw9EnhXEQ9J4xYIks3Z
 W1Do1Y0J5JVcMYdqR7GaMoRta2EHXERVb2PHuVOkmPLtBIB1v977rMpJkl7uCjf5IFiLM0hZ
 T6SVtd8Uo/YVjnB8Gi1IBCmyq9AVmVbHDI8IVz9pJ5srrzSP7AKiuYUm0jlMOmvrE2HtDbc+
 zbAuMVP9bTaU/VXapZ1Qz3XJdfbVMEVtcOh9o9U1WS5urWN4zRsPDBevq7HsuvLR8UHkfERl
 cTVjn6I8tNqmqxXGXjvRTXU3TxPmPl+5ZdF7Xb4vgzxIABOpYkiHlQtX2JouWwbRFSuK0/e0
 VzZJn9lLmgmGWw9WHUq0VlUyAtSXp90fHFaTdntAUKO0T7ffIooNOEY11f23OBO1taR8PSGw
 hPmkRv9cuMXtqt7BFnL+jiHnORjnMVqn7PZYwbgLe/6cDsfY59KZo6RqprF0HuGwZukQhn7E
 dPATV0BnP3J3fLs+GInZYUDObQe51XmwGwO/NZrnrZqAG7vsEgRnwSWha0Ss6JiQMSRz5Z72
 cBtpM3sf6lo3KCOGE/iOM3PBlnc2KMGo9LCwyDecFpgLzxQRpxSm2LnDSerBk2dgPRhhwvr1
 2kCRfRVeDAA1JbtHwd9qrx6lt7el+QeF9KZmlgvZdwEnnHvXhPwfaGD5DDple5Wx8n+KUwIT
 vFaTwdLkdVy9e72AW8tRyCGX8lr69ec9D1PfAGSfX+y3mtIIqHmeU6BPdS5o9iL82rmPQMS/
 ijdwicKy7YB+sl1xeOnGssPDB5pRAf4KvV8SygyFL98G80APLULlgjeqoSJMuE6XP4A9mPy5
 d0gLsOzKONG1S0TuTD767ZbzROcEyO5UG3SvwlspBSs+YZsqBpE5zSTDvP0zVm0XwFXbHJvX
 JbZJ4+xrbLfrJLVYg1XQly+1IyjtSBLEcxqGXNc6UDVGBoq0WeBs+D5rrDlKEmDUKArjbhIF
 X3yVwrw971Gw+4kYMAA60+IW5qeFExxXRr8uSFbZDRAmyRBqh+1Wv/Fn+2a7lGTqeZXZ0Wsx
 Zh+tmN9tXnOxbQ6UT1vTFhJLhJ/HviacSuABiUEeoN19ChI1yDju+L58G05Q2HBgeTWgA9hY
 dfc1YXYdkGoj4+jJcv2iz3c5fJmCse4hBjyAAisEXs1Iig6HraGk8DETSxuOQmYRBjdl6Sjc
 rE9uCE0m/a+zYt4+iZKHtt
X-IronPort-AV: E=Sophos;i="5.81,281,1610427600"; 
   d="scan'208";a="40239500"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZak5iYt2rOgO9wWAYtxzGyDkIfDNZ3bjHUR/mk82WDostawMnTcPii4zZIJHAgG97MmMMNI4salqVWwZX1HWI80UpqhajIBPBMYDJdjmRzQMES+zxPGJ6v1SNIcTp0ncKSUsySv2nEm513qoIA2Qjf9jszUCZkwRyizVNwCF5Xwl6X6JERegOnsAMp7kbS+osHrJRGHCfFqC29R3DgFOE22uFDUpKbaeorW6GnqZvGy4rTurrhwT9wG3R0g99pW3BaMN2b5nQwokIcWI+fTOtQBvsSCAQ65QTQF4YUlLDHjF77Vvu+B2Drj8wJf0XD8UMY1aySGm9+q10D6j77HfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHIoGsfWwIgGaEP5O372bN7pg6+tTs0nJuFQXbDMSu8=;
 b=lH8gJCA8avoxxpB33uELaAD+vfyvCIZIs6KfCbHR+fg3HdMV3KYUQd7va82Qsc64ySCPbAThLccatRxidYKV/edYI5XZTCdY6KgyNfd0/tX3jRkkFpIcxirvTnEVpLnEU+qtXJTJEDgrdGITDG8Mgwr4mA6BjT/8XbR1t92I6UU91jRO1/ucycYuCtd8IGbWZuLoFBwaMvlrMlsSg2iS6pp1oiyIEVLkJhCKMdp8h/Q3iOJ7vuBkvSOrfjTMgJYaHG1NH86psCX39vmq9stbxtFbKK/UOtV1+EbtaSxEqh1Qo8ixwYZe0aeYaLSh9uGoUpL96b4DpgI133o7mit5oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHIoGsfWwIgGaEP5O372bN7pg6+tTs0nJuFQXbDMSu8=;
 b=OevcdBXYGEmRA1ZoSyb84x55HM2u6yl1NsIzQzmvOALCuARBRpDxK312jB7kIWhpiU3QA6becUaa/tZfbhsrFOvByxjLD3kWz/ta5xOn7+7sr6nojD5hMOzuPVl1GDsdtmV9NOCvZSI20jZc3FOOf3YupUnaVrQQEHuNtMWGz50=
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode
 unconditionally
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
	=?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?=
	<frederic.pierret@qubes-os.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
 <20210325172132.14980-1-andrew.cooper3@citrix.com>
 <e7e94820-b71a-4cfa-8c40-614373215362@suse.com>
 <19ed3f8f-1dcd-dfde-ffb3-67da569b15c4@citrix.com>
 <36510d2b-a5d0-d5a7-ceb7-c92c7b5e6e2a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <8d7b290f-ede6-3180-7bae-5451a5f8800e@citrix.com>
Date: Fri, 26 Mar 2021 16:53:27 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <36510d2b-a5d0-d5a7-ceb7-c92c7b5e6e2a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0348.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::11) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9513053a-7f51-4807-e6a3-08d8f077b0ec
X-MS-TrafficTypeDiagnostic: BN6PR03MB2515:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB2515EB5F520D833436A85B49BA619@BN6PR03MB2515.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LCu+sYl25eG1/kaKVWnCyuXUt4XoUTZGyDVIvHn3msFyqBVVbPDGyZg9i5KJIrRinBTUD/HbJTqyOGElj4hLwM8eJx/DZRgEdgRHWgfB6ehMiOeFhq1glvzR5yDJw6uJtVCEtaNB+sv37Oj6Dogr4jtR33qDPVr8Yw3Sh7ZgPj36Ayb1l9ztDNSC2X9QKIEnbrrrJVbMyiwzs3IUSK6IgGmRINe0LA+3H7mQ2taHtP4CWGoY9FKD4q83bSiO7FtIINCVrQL/roLlv2uOgIwZfB3cf3kMWCwyx8eoVEnqvHkbklS3M6rIcHbeQyhIaL94nPFlFxfR+zXxWDuM1NxtDh30P6X/RcxZxSWSQHD3yRsrPBwDGWiRZDp+km6emUjA+Yo+GN3xxyBmfw34FEEhPuhixxpIzB8I5TTfTPH69DGYMS9P4Uqa/VNhf8qcITfE7sWKn3lPCvinBypa74GBW6viad/F98cQeTPxiQ+Kow19uaNCecsQjfgQOhiChWaPwIub9BpwAIoWLo18hJMKQUxIH8kClDzHw4VVh+WB2T3rKQm709f8ZMvAOnxiMep6RUTLUq6M+sLkg89+krNe/Je6saS1dEMxpbpcbVbD02JoJZLgqMpbPLnzh+6E9eE1P93ofZhQBCZJwpxENn3Q+Z0GG1+46bm1SXFk3T9iYRcGDw8sJRTgoXLbEnFbgCa18Ss/hR+SMuUjbWNLTg9Ew5ad5W1zrqZDv6FuYLckZHU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(136003)(39840400004)(376002)(396003)(478600001)(31686004)(16576012)(26005)(316002)(186003)(54906003)(6486002)(6666004)(53546011)(6916009)(4326008)(2906002)(16526019)(38100700001)(66946007)(2616005)(86362001)(66476007)(66556008)(5660300002)(31696002)(956004)(83380400001)(8676002)(36756003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bGpCS2Y0dndBN3QwNDZYczFUWWdDZUZqVXNPbEtZVnA3MCszRzBNYkxYRDZa?=
 =?utf-8?B?cVowMDlNM0UyRURHUEx6aElpeUdQcGxNMUpNb09sZGttdVRDK3lLNkpHMVli?=
 =?utf-8?B?emdHT3F1MCtxd1J4MWxaalczaDVWWlNpQkNYaDYzSUo2Z0F4d1V0T2pVZHNS?=
 =?utf-8?B?bmJmbUtXNU1xQmk2cGFIZGFLZVRFcy9BV2hyYlUycmtES0xIYm4yRStlTGRT?=
 =?utf-8?B?ajVoRHNjeGpHT2U0NC9OV2taWDhTMnNwTWdzSUd3cjI3TWVpUUNOTlZHcHpU?=
 =?utf-8?B?UndOeFZTMVFkQjNHa0RQTUNTWlZCcEluYWRBWnQyemQzQ2toZlZYWE5QUVhK?=
 =?utf-8?B?WHNBVU1hZFA2aElUbjdpdFF4QXJvTkh3YXdSRlFEMGo5QkozamRiU3djc3dC?=
 =?utf-8?B?L3UyM3VBUFlWR2VyRFR0NUo2a3ZkY2VEUXRsNDZMUU5JMXU3Q05WRlp6TEtm?=
 =?utf-8?B?ZFY3VlppTzlTM3RMVzRSYXlYYkNhZXlkSVV3YVVKWnhYNnA1aEFraW1XODdl?=
 =?utf-8?B?bUJrbVE3a2VRczNYNHdIVGhIRittbWNIUFNNT1R0WFE5M2c3MXhDVVFBaFVC?=
 =?utf-8?B?WkpGVnhuRENLcWx5ZUhIL0FPZHhTL2dXLzd5cnJMMFdiN05YKzBvYmkyT2lP?=
 =?utf-8?B?TmVrSVZGMDRQNXphTDlrZUltSm1JWkNzOGF6ZklpS2dkMTF3bnJpbTJpd2Zn?=
 =?utf-8?B?b0FjVGhxYkduUEFQSXFqQVkwN3NNeUVBbWNvRm9YeTNGN2gvYlRsQ2dxamlL?=
 =?utf-8?B?ZjE2Y3UrOVVhaEZpOHZzRGxZemphbTBEL21zZGxwL0s3S0t2MXRDbW9NODVR?=
 =?utf-8?B?NFM2R1hIWExIeHlvOVRxcGRCRnhpMnlYV0ZLSFUvck5hbDlaTWJRa20yemJ3?=
 =?utf-8?B?SzJWdzlxSS9jd20wTVhJUnNFS3ZWNld5ZDRaaG4wejRybVhrSmhrZ2pXNnlm?=
 =?utf-8?B?S2VKODRQaFp6K3Y4dzBPaGV0ald1T3pQOHBZU1RycWRUNitmRWIrSTBaMzRw?=
 =?utf-8?B?VEY3UjV0Sm5BMm54ay9jR3JDeTJLNWZwbE1uM2JsWmJzRCt0c0ZzNDc5MUg2?=
 =?utf-8?B?dGFtbFpGcGpRMlZ3SW1TOVlnSGlXMnV5UUR1aHFIMXp5MkgxbkYzcmpqQmVI?=
 =?utf-8?B?eFRJcW5DRmlVOHVpNnRqcXdMMktYeDNibEV4cGhRdzhabE1OeldEV1N3UGJU?=
 =?utf-8?B?d2Z2dU1vdlIvdmUxbm9EY3k0VVYwNjgxT3RWWUZrcXoxMkp3ZnlaRFFMK2lk?=
 =?utf-8?B?U1VyVis5Szdkd1RHYUxpeENPemZlNmxNcFo1cVgyRmZ1dHVLRU9JckJtelpn?=
 =?utf-8?B?cmdVTTZ6RlZOM2QrczZ6YVFSYzBkNVJnM2tsdjRtRHA4VUJxT3BBeWNDQ3NL?=
 =?utf-8?B?dGFaeXhkOE43Tml6czRUSzRwYkRPMC9nS0dERVRrKzk5V3AvSndydlcvS2xi?=
 =?utf-8?B?a3ZpR1hSUHViYlpUelZDbXpOV2ZBT0lEUk40RTN6T29HbG05RlZSQmxGaUtY?=
 =?utf-8?B?L3dmcXJuelo1UWM2ZHplcWd3RWwrSkw3cTBrQmpVR2hVWWNVQ3BOUVlwanU5?=
 =?utf-8?B?NHhhY29wRUliL0tERkpmbW9qdG5hQkJnM2ZwU0hqNzhEZW53QnA5YmtUaEFV?=
 =?utf-8?B?a0RqNlJub1dxcEdwbmhLMjNMbGJJd0NRRkp2cUVuWU1nbGNzTG90S3MrVkU1?=
 =?utf-8?B?dG1SWWNoWWFia09YREg0ZTFLZml6ZUliVDFvN2tteTJ5TG9ISDlSUVFwb1JJ?=
 =?utf-8?Q?tmZP8g+UQ1xMj7GyZBxdmqBWK8TWn+ZMZfqwdM8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9513053a-7f51-4807-e6a3-08d8f077b0ec
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 16:53:33.4914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k6jW0t7YS2NrIAjAHHvtvDV34Y0AbvYKQfHzfkZCeF0JQFAp5JbXsWk7W7T5XW/cExZpL1W6GcLHeFAUjzNKqzwp7lBzGG7pPlrM0TnMrTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2515
X-OriginatorOrg: citrix.com

On 26/03/2021 16:48, Jan Beulich wrote:
> On 26.03.2021 17:32, Andrew Cooper wrote:
>> On 26/03/2021 09:51, Jan Beulich wrote:
>>> On 25.03.2021 18:21, Andrew Cooper wrote:
>>>> @@ -1922,14 +1924,38 @@ static void __init check_timer(void)
>>>>             vector, apic1, pin1, apic2, pin2);
>>>>  
>>>>      if (pin1 != -1) {
>>>> +        bool hpet_changed = false;
>>>> +
>>>>          /*
>>>>           * Ok, does IRQ0 through the IOAPIC work?
>>>>           */
>>>>          unmask_IO_APIC_irq(irq_to_desc(0));
>>>> +    retry_ioapic_pin:
>>>>          if (timer_irq_works()) {
>>>>              local_irq_restore(flags);
>>>>              return;
>>>>          }
>>>> +
>>>> +        /*
>>>> +         * Intel chipsets from Skylake/ApolloLake onwards can statically clock
>>>> +         * gate the 8259 PIT.  This option is enabled by default in slightly
>>>> +         * later systems, as turning the PIT off is a prerequisite to entering
>>>> +         * the C11 power saving state.
>>>> +         *
>>>> +         * Xen currently depends on the legacy timer interrupt being active
>>>> +         * while IRQ routing is configured.
>>>> +         *
>>>> +         * If the user hasn't made an explicit option, attempt to reconfigure
>>>> +         * the HPET into legacy mode to re-establish the timer interrupt.
>>>> +         */
>>>> +        if ( opt_hpet_legacy_replacement < 0 &&
>>>> +             !hpet_changed && hpet_enable_legacy_replacement_mode() )
>>>> +        {
>>>> +            printk(XENLOG_ERR "..no 8254 timer found - trying HPET Legacy Replacement Mode\n");
>>>> +            hpet_changed = true;
>>>> +            goto retry_ioapic_pin;
>>>> +        }
>>>> +
>>>>          clear_IO_APIC_pin(apic1, pin1);
>>>>          printk(KERN_ERR "..MP-BIOS bug: 8254 timer not connected to "
>>>>                 "IO-APIC\n");
>>> As mentioned on irc already, I'm somewhat concerned by doing this change
>>> first (and also not undoing it if it didn't work). An AMD Turion based
>>> laptop I was using many years ago required one of the other fallbacks to
>>> be engaged, and hence I'd expect certain other (old?) systems to be
>>> similarly affected. Sadly (for the purposes here) I don't have this
>>> laptop anymore, so wouldn't be able to verify whether the above actually
>>> breaks there.
>> Turion is K8, so very obsolete these days.  If it doesn't have an
>> IO-APIC, its even less likely to have an HPET.
> It did have an IO-APIC, but required one of the virtual-wire modes to
> be enabled iirc.
>
>> Even if it does have an HPET, there isn't anything to suggest that
>> legacy replacement mode is broken.
> With one firmware flaw there is about as much chance for another one
> as there is for HPET to be working, I'd say. Iirc (very vaguely) it
> did have a HPET, but no ACPI table entry for it, so we wouldn't have
> used it.
>
>> Would you prefer me to undo the change?  Its not easy - we have the boot
>> time config stashed, but if it was periodic before, the accumulator is
>> broken because we can never read that value back out.
> I didn't think the accumulator change would matter. I did think though
> not having been in legacy replacement mode before might be better to
> also not be in after, if its enabling didn't help anyway.

The accumulator matters if chan0 was configured as periodic previously.

Then again, this is broken anyway generally (e.g. the S3 path), so I
suppose we're not making it any worse here.

~Andrew

