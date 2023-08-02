Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C0776CEC4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 15:31:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574941.900583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRBwx-0006fg-F6; Wed, 02 Aug 2023 13:31:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574941.900583; Wed, 02 Aug 2023 13:31:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRBwx-0006co-CS; Wed, 02 Aug 2023 13:31:39 +0000
Received: by outflank-mailman (input) for mailman id 574941;
 Wed, 02 Aug 2023 13:31:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/vke=DT=citrix.com=prvs=571ca8ae6=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qRBwv-0006ci-LE
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 13:31:37 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5755142-3138-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 15:31:34 +0200 (CEST)
Received: from mail-bn7nam10lp2103.outbound.protection.outlook.com (HELO
 NAM10-BN7-obe.outbound.protection.outlook.com) ([104.47.70.103])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Aug 2023 09:31:31 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BLAPR03MB5604.namprd03.prod.outlook.com (2603:10b6:208:29a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 13:31:27 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::9410:217b:251f:2a98%4]) with mapi id 15.20.6631.043; Wed, 2 Aug 2023
 13:31:26 +0000
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
X-Inumbo-ID: e5755142-3138-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1690983094;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mmIj5gQS9Glz/5KnZL6kz4FZF0Dtt1GbJvEsBCFSfQo=;
  b=dFLervU9AQA2raDA1QucjIc1u0CEyDcdAY8lROv+p07S7WwMP3K7WrU2
   uTiAi3l04g+0pEMqp6CHG6rDTw3jW7qQHNl35LoTSllZiDrf7txF1wL0e
   jYqoRaMsG+6b+H5zPvsYNbzl0jux8Oq08ddUwuFACZ9aFzKfihnqKWMGk
   w=;
X-IronPort-RemoteIP: 104.47.70.103
X-IronPort-MID: 118269684
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:rLbff6KhUMdV1lfcFE+REJQlxSXFcZb7ZxGr2PjKsXjdYENS0mFUx
 zcZDz2CPq6NYmv2fYx+Poy09kwF7ZGBnYViQFNlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/rOHvykU7Ss1hlZHWdMUD0mhQ9oh9k3i4tphcnRKw6Ws
 Jb5rta31GWNglaYCUpKrfrawP9TlK6q4mhA7gRkPakjUGL2zBH5MrpOfcldEFOgKmVkNrbSb
 /rOyri/4lTY838FYj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnVaPpIAHOgdcS9qZwChxLid/
 jnvWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I+QrvBIAzt03ZHzaM7H09c5pKF4Vy
 +UnLgoxNDKB3sWk642YVNJF05FLwMnDZOvzu1lG5BSAVbMMZ8+GRK/Ho9hFwD03m8ZCW+7EY
 NYUYiZuaxKGZABTPlAQC9Q1m+LAanvXKmUE7g7K4/VvpTGLl2Sd05C0WDbRUvWMSd9YgQCzo
 WXe8n6iKhobKMae2XyO9XfEaurnxHqrAtxDSu3knhJsqEaXw3AuLSYGbgK2+9W3p3CfdfkCe
 mVBr0LCqoB3riRHVOLVXRe1vXqFtR40QMdLHqsx7wTl4rXQyxaUAC4DVDEpQNonv8gyTHo02
 0OTntXoLTZyv6aYT33b/bCRxRuiNC5QIWIcaCssSQoe/8KlsIw1lgjITNtoDOiylNKdJN3r6
 zWDrSx7jbNMi8cOjv2/5Qqe22nqoYXVRAko4AmRRnii8g5yeI+iYcqv9ETf6vFDao2eSzFto
 UQ5piRX18hWZbnlqcBHaLxl8G2BjxpdDADhvA==
IronPort-HdrOrdr: A9a23:aA43sqhtgF/DCgR6Hqbz9CJHE3BQXgYji2hC6mlwRA09TyX4rb
 HUoB1/73TJYVkqNk3I9ersBEDCewK5yXcN2+gs1O6ZPDUO21HYTr2Kj7GSuwEIcheWnoRgPM
 FbAs1D4bbLYmSS4/yX3OD2KadG/DArytHPuc7Oi11WZUVBbaV46gdwDQyWVndxWBJNCfMCZf
 mhD4581kOdRUg=
X-Talos-CUID: 9a23:WKn5UW+qZTZCmf0yrCuVv1A9JZsba0Lb9kuKAU3hLnRCd56LcnbFrQ==
X-Talos-MUID: 9a23:SLDBbwjO6g0R1ENl8skFQMMpL8Nt/5mLM1A2yJhcl8epCw1eEGrMpWHi
X-IronPort-AV: E=Sophos;i="6.01,249,1684814400"; 
   d="scan'208";a="118269684"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oJMijDyyu/ZOEaWeIyh4d3OEaHhja83ko2FAYAZWOyK4OVg6npDkBcOR+CaKDGNHiUOJ3/FdSW33twh9AVp6VJoQtRnwBZVBmfHotPt8/fxLA0ksLG70g2NniVcsLsZ6bNxC2mFoECUN5LxjCYnm5QLU74xf9p5deVd9u97W/Wps0uSjvlc4xhKluRx8WTU4pMlLHAs/NJTapfeMzdO6o5KpVWcngvERQ27Ljb3nUrvf9BGbqqKii3HzJMufiup7R/xuEUay3FF3yzPhsDKm1sfaOl0rIsEMCBc3TS+9lmKF/qhGIsIMl5sUiXnJAf5iWbwJtmD2sRoujuI/D/XspA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TbtnL/m8prfhEqUqlTW4I8qNZGxszTAgBNOj+2dmDg=;
 b=Q0AXBDxnHqiY4NUeEwp2WuYCdRUZaXJocnuM69RupY5gGZha1yYv51UoK6xHxQwuXHAUSKClfHuvHOTCKBm/8L+ZFWsfSUyiR0AjspsZRjGf/vhEJR08FhwSASCiwSKvKkXeUr1zd9hlnZsG3WA5muLV+IPg7Ss7V9swOrF0AS5cS4+YqBoNnCQIUZ+vVggwSfdj8wBK/v84eZKpwrmKfj11tKnC5nNhASe8eLji+IU9oj+FVJQyj9Yl//cvOO43OV8svScSKE/XOcNEeRPxbwoxdQGH9HhvnbmAzqJuwmS4/8vNIKYMsJlX4IRIAL1vYODQnCN0zYduXAE2oqaSdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TbtnL/m8prfhEqUqlTW4I8qNZGxszTAgBNOj+2dmDg=;
 b=pE2FjnvbmSgMgBYJ4sFXbkzvpSPp1WNobowxScC6DCuda8RlE4XywFPL74jSvyYz0xteVW+fwHzKs0mz8FzSeQ9gwggEv3V1Rx/wK5MkyQmWwXk2bZTog4y7A5UHMuirujrh6ChiLjYjZeoL8rsiL1wDQj7SXYq+MXjntewz4mU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <185d2ddf-9461-564c-5d29-4a5afe88596d@citrix.com>
Date: Wed, 2 Aug 2023 14:31:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86/gen-cpuid: Avoid violations of Misra rule 1.3
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230802131003.166670-1-andrew.cooper3@citrix.com>
 <b7ad0800-4808-d18b-2278-d4d4812c8d46@suse.com>
In-Reply-To: <b7ad0800-4808-d18b-2278-d4d4812c8d46@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0185.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a::29) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BLAPR03MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c263fd-0c20-4d8a-059b-08db935cc5b7
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R/PYo+nYyIttISvwou1+TUgGfrDzJQqdDLCcXy2W7vhGcRRrcIZoxYGoCvAQnb8qxqFdj660IwsOcwaIAMCGeivy9c7sgcmv07XASRaTfXDDsUR/mngtqGJsxGVl/jjjW/TOgO+TgpkowChecKQovJgzekDU9ZvTHmwgluYBU0Pc6TZv/PHHDOXVjAQPl9+aDf+JkBoULJQcwX40rQqKjnMwyh1wREi7eNxXKUoSoDb64vLRTwEJ+fjufjsTY3lXeZKgoq1EBxDZUV0ikAYYlt9f7QHcyeDN+soADXskyh6hFNAGCJ31YGWCOa2cRby+p/1HqDH0Od3YTHmajDREz/CSIT3piKa1J9RwCCeAoIpiqZUxJEo6a53Xhg/EbC7ItGzPKQAUmcqOYOT3/zP+PX8w4xmCRnk9rysCRBDSZUEsc+o2Xvz01ij72HyzvBLhCFzMjIGvZwk6ZvWaxXya6hCEOGQn1gefQltR1eQEHhxdUJ2ykzLq8S7gr3t3JWqH4F12uYMJk4RSt2kbO8zCbqkJ+ySvwhnZ5uFr5vGj8MypNU3IXbR7ozVyDdl2nirdkLiFPQhXVlUZjlbQAlclMB1vG827/hDccJU8+sjoL2d60dHeHNBdHvlUZbFdOLBzAd+LGtzOa1lcuFsAT+FCKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199021)(31686004)(4326008)(6916009)(31696002)(86362001)(36756003)(38100700002)(82960400001)(53546011)(6506007)(2616005)(83380400001)(186003)(26005)(6666004)(6486002)(6512007)(478600001)(54906003)(66556008)(66476007)(66946007)(8676002)(8936002)(316002)(41300700001)(5660300002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R1Exc2lmdUdVT2RvMTdyallDSVo5TUJ6SHo4M3JVRy9EYmxsdENaNEFMSHBY?=
 =?utf-8?B?eTJMdEc1UktYeUJlU0loQkRDeU1jVUhLTHd3eDI1T2dhNkNZRk5jRHpTVXly?=
 =?utf-8?B?Q0JBQ2dNKzJvZEROQ0lnTjZCQWNsZHdpQWFwVEdwU2NvWnRVcm4ybVNKYXZM?=
 =?utf-8?B?bTdmTkpVVytyc0FZS09mcVZIVkJvT1ZWT21tckRGTGZOcVNSZThnNmg2TVBy?=
 =?utf-8?B?RUVUTm1ESjA2ZzV5dTFLQys0MWVwUFlUU3dvdEhRSjJxSEhIbC9UbDlKc1Zk?=
 =?utf-8?B?SzEyVmpiL0NwSWc5Q1V5RXBnT1dBbHJlUSs5aTZXbDllSTYyTWl0SGNSM1dS?=
 =?utf-8?B?S1daQklXK1ZUZzZ5N3FtekZ3dStQTUc3a3ZVMUVPbVc1a0NIK29MdHp2TVRp?=
 =?utf-8?B?UTVtZlRET0xlUWd4Zk10UTJxOC9lRG1TS3FNMzFpM01teS81L3FySHZqYU0z?=
 =?utf-8?B?ZXp4dEZZaU92ZURGbFRUSFZIM2o3VUdsd0djTFpRZ3EvZklhUnM1cUNQUWFq?=
 =?utf-8?B?ak4zcjNQRFRycW54b2VpUUJUSTRqcnhIZGhkUnRqYTFQUktCaEtHek4zQWh4?=
 =?utf-8?B?cTRxUFh2TXpEU0tvZzF0WW9rSjVpbk0ycG1ScmJ2Sy9qalJUY280Z1hZTFNL?=
 =?utf-8?B?MFFDRmJZK3I1WXRORE8xa2JOLzgvdVNON0ZDY3hOekY4clo5YUJYVXhMSHB1?=
 =?utf-8?B?dldSbzFQY3U1aDJqaUlnSHkvRmVnZVAxTXRaTlZKSmVpM2p4NTJQVWNicTcz?=
 =?utf-8?B?UXdUWGZNVjBMdnBmNkd0ZGo2cTZ4TWYxQi9VVkc3eFJycGM0MjgzamNlczlR?=
 =?utf-8?B?MXRZSWJFQzV3M25mNEMrcDZOWUZEdkFUSUUySmI2dldmRkVieGJQbmpVV2Rp?=
 =?utf-8?B?bis3c1hPQkhBNHV0M3FPVEpZdHNkTTE4eWs4Zjk4NXkzeEFLU1VvckNnUUEx?=
 =?utf-8?B?RlE2TTMrR2owaFRPR1JGV3VobHRiWXp0MG8xU2tZeVJvUUVmV0hnN0crd2w3?=
 =?utf-8?B?OUMrRVJIdDFJRFl5LzZsMTdPcXN4ZTFWaEtzS2FwODA2d0xua2NEbzdnWDBh?=
 =?utf-8?B?VEthYUZ6Sjl1RmdWc1ZaaHIrS3lrMzVMOGdWcTNhM2hNWFQ5aWdQMEdlMGxM?=
 =?utf-8?B?cWR6U3lhWnpTUHNTQlB6ZU52YWRvaU81amY4SGljU0YzQUt6UExSVjdPUXYv?=
 =?utf-8?B?SWJYKyt1V0N3M0lUY3lDQ1ZvdWhHbUVzcDN0RGRPR3lWek5MVFlmNmdxcmNT?=
 =?utf-8?B?OVEvOTJYQjg0VVRTL1dJaTc0dXJlcm8vTTkrVkVlOEVaMEFMMkJZRWh5dzZ2?=
 =?utf-8?B?Q3poKzg2N2toSEJUaVhDamlPbFpBdGJOT2s4Nk96T2ZiZytUaHRQMDFXNEFN?=
 =?utf-8?B?VWF5T3pId05hOEluZ3F1bFF3ME55ZzdFbkJWWThtQ0JJd3czM2JPWEtHT3k2?=
 =?utf-8?B?QWt0THdlNWV1Y0NJNzRZVXNhNlJtK3V6ZzdkWUQ4VWVFYzY5MVFERTFIeWJv?=
 =?utf-8?B?N1FjRVcyeFJxaGQvSFlwMXZWbWtCRjByVnh4Q0xMaUtvVXNoK1JXb0l4dmhK?=
 =?utf-8?B?enZIU3hUZ0VXbkNkRU5WSFhpZVVjSlZQUUtZYmpwcWdRQm02YURsV0MvVGla?=
 =?utf-8?B?YW9WUkJnSFZKYVFDMTNCOGdrcnYvcDU0Ym1pWjdINUczMkZvZ2gwNC8vczlq?=
 =?utf-8?B?UkcxYTJMRHU0Mk9rNElmSmVZNVpCT3ZxYkhnWCtieSszZGtKVDhqcktYYnhj?=
 =?utf-8?B?TlEzWUxranF3dCtEU1dPWnB2NkxuamlSNllTYmE1ZGttL2F3WnlRaTkwdEJa?=
 =?utf-8?B?RHIvSDd2WEg2dGdNeEFwMWtsT1EzRjhlR1JtQXhkWEJMYUY2T1EwcDJYTUN5?=
 =?utf-8?B?OXd3cDE5aWZWWWJRSXVCQ2pWWDlvSUQwV0FUUnhOdzlYUDBTWUlUcXQrOVhG?=
 =?utf-8?B?VzJzTGZkTElPQnVsdU1KQnBQRlZpcTFpMC9NQmV6dFJPZzZpaUVOWVA0Mmkr?=
 =?utf-8?B?WDY4UmllUS9IWnd4VmJqWVBVYmlSTU5uanQ2Z2tvOTVldk01azhBcDVYazNF?=
 =?utf-8?B?Ym9FQ2duV04rbUg0bzF4c0tkdEJTZjkvUnk0cS96clc5YVZmSlcyUzBDMHI5?=
 =?utf-8?B?RFcvWWxPVm1UYWc4empnTFVVWkpZaVRpR1RYaGZHRE96c3o0ZGFPTVcvYzRM?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	30RuHhsc58mOUG7tWYHz1DtmQgnbCSCtqrI2vC/jXxHuZOMtc5nLAEroLRF9UgFVKC/bv4iLs9uvmaMp/nYPjN39HL7PmebVhOz6y7Fk3jCLYML9HckO4v2AkioVbnnGG4SET1bbJjI/SMVh4RcgvYYJKAPJ3NTRqu0OX/s5dzbevuBFoKGI3CvGWa8eZdGcrurcL2VFW2hWKnRyTFA6a7ET+4xIIMcdbUBHVZWKV7Hi0eqUqof5IvEDtFf2K4yeFlqvx4Fn1kY7QqDqZwTKCX7QgSsQcz7//I13Ek6dMVigAyAmkixRwUHtc82cGbYceC7MIAsmwcr4It94pLS3xBESNwe3aFxeC7t5z1pu0/7Ud5+O5fe+5PyvzeTnafLmdt5kLMXI7Fck6Qt+VBYL4eKc5HM+g9GowrTV3gZ6sqJvfdE1xk5heHmBm9rnFY7us51cFdG/mdlG9AQL97G4416lWJjUUjObmmQgpdJ+LT2ZHdfXpIcPu/Fz0zNgzYoecj8uYn5WYIrXbG9TsEmxPdaCJZ0oIxInNGye+6awisjII3Y5M2oVI9ieAwRWv5HTmWqkqz7FPe9Xc41YPqXscMyzb6BHwS9aI/cdKr057hrQPbmvnuJkiaCnVRIro4r83fUH8hs9GbmzWdTgtfijuN2uy736bPH/J2rjQmKJF36ZZ1vsRa+ipSfa7xTq7jlp1HhvJAaM1Io88zfsoR6oNRDHSzT/9Abummb9IorbCQLR9kTq/NOTsULyozwPzksIeIPnbfZrMjEuEDLtRyizAv26MtwWZpvbSNugSU7IjoxawF6OYmtRcVSH5LEpC3nOb1FFXbZmLnlO/lkjZ3FWSh8iAmx4tcScJv7xeUWicqE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c263fd-0c20-4d8a-059b-08db935cc5b7
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 13:31:26.9036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCrN9RJmyzmffooiWv/9mbHqfTnpM18uQKoOHnRNkJaaXQZjxsG/RlToysTEyv0JPldwaPoiXmVHIsUrM2dVWxeOVnNC3qyuXXUSNDyHCBI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR03MB5604

On 02/08/2023 2:22 pm, Jan Beulich wrote:
> On 02.08.2023 15:10, Andrew Cooper wrote:
>> Add the script to the X86 section in ./MAINTAINERS.
>>
>> Structures or unions without any named members aren't liked by Misra
>> (nor the C standard). Avoid emitting such for leaves without any known
>> bits.
>>
>> The placeholders are affected similarly, but are only visible to MISRA in the
>> middle of a patch series adding a new leaf.  The absence of a name was
>> intentional as these defines need to not duplicate names.
>>
>> As that's not deemed acceptable any more, move placeholder processing into the
>> main loop and append the the word number to generate unique names.
>>
>>   $ diff cpuid-autogen-{before,after}.h
>>   @@ -1034,7 +1034,7 @@
>>        bool intel_psfd:1, ipred_ctrl:1, rrsba_ctrl:1, ddp_ctrl:1,     ...
>>
>>    #define CPUID_BITFIELD_14 \
>>   -    bool :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1,   ...
>>   +    uint32_t _placeholder_14
>>
>>    #define CPUID_BITFIELD_15 \
>>        bool :1, :1, :1, :1, avx_vnni_int8:1, avx_ne_convert:1, :1,    ...
>>   @@ -1043,19 +1043,19 @@
>>        bool rdcl_no:1, eibrs:1, rsba:1, skip_l1dfl:1, intel_ssb_no:1, ...
>>
>>    #define CPUID_BITFIELD_17 \
>>   -    bool :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1, :1,   ...
>>   +    uint32_t _placeholder_17
>>
>>    #define CPUID_BITFIELD_18 \
>>   -    uint32_t :32 /* placeholder */
>>   +    uint32_t _placeholder_18
>>
>>    #define CPUID_BITFIELD_19 \
>>   -    uint32_t :32 /* placeholder */
>>   +    uint32_t _placeholder_19
>>
>>    #define CPUID_BITFIELD_20 \
>>   -    uint32_t :32 /* placeholder */
>>   +    uint32_t _placeholder_20
>>
>>    #define CPUID_BITFIELD_21 \
>>   -    uint32_t :32 /* placeholder */
>>   +    uint32_t _placeholder_21
>>
>>    #endif /* __XEN_X86__FEATURESET_DATA__ */
>>
>> No functional change.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> with one question below.
>
>> v2:
>>  * Write it more pythonically.
> Yeah, you know I don't speak Python very well. I was glad I got it to
> work without overly much hassle.

Generally speaking, if you've got bool-like variables around loops,
there's a neater way of expressing it.

This one relies on truthy/falsy values where "" is treated as false. 
(Same too with None, 0, (,), {} and [] for the other primitive datatypes).

>
>> @@ -382,7 +382,10 @@ def crunch_numbers(state):
>>  
>>              names.append(name.lower())
>>  
>> -        state.bitfields.append("bool " + ":1, ".join(names) + ":1")
>> +        if any(names):
>> +            state.bitfields.append("bool " + ":1, ".join(names) + ":1")
>> +        else:
>> +            state.bitfields.append("uint32_t _placeholder_%s" % (word, ))
> I thought % could be used here, but then I wouldn't have known to use
> %s (elsewhere we use %u), nor to add an empty argument (which I see
> is done in a few other places as well, but not uniformly when %s is
> used). I assume there's a reason for the specific way you've done it
> here?

Hmm.  That was taken from your version.

In python, %s means "call str() on whatever you have".  Similarly, %r
means repr().  str() on an integer behaves as %d.

But yes, %u would be better here, and consistent with the rest of the
script.

Happy to fix on commit.

~Andrew

