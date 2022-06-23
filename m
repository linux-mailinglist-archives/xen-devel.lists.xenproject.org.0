Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 959C055755E
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 10:25:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354579.581771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4I9S-00065Z-KN; Thu, 23 Jun 2022 08:25:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354579.581771; Thu, 23 Jun 2022 08:25:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4I9S-00061z-Gk; Thu, 23 Jun 2022 08:25:22 +0000
Received: by outflank-mailman (input) for mailman id 354579;
 Thu, 23 Jun 2022 08:25:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uSRO=W6=citrix.com=prvs=166c34e93=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o4I9R-0005Uq-C2
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 08:25:21 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03bd9dc0-f2ce-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 10:25:19 +0200 (CEST)
Received: from mail-dm6nam12lp2168.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jun 2022 04:25:17 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by MN2PR03MB5008.namprd03.prod.outlook.com (2603:10b6:208:1ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Thu, 23 Jun
 2022 08:25:15 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5353.022; Thu, 23 Jun 2022
 08:25:15 +0000
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
X-Inumbo-ID: 03bd9dc0-f2ce-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1655972719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=GAh16+3k4c8+TUlKcf9+shdqpJejBCp6iXhFkcuF4Bw=;
  b=MAzvwkM4e0dg9NNWo/wgkmO8KXv339NSQwVSJlo+wFD2kLq/M3J00S3R
   GopU7cMqU1tNRhhtnc2BAQ+ZAzJ+/CeTWs4/uaF98M9TQzAEOiXe2DW9Q
   u0qBfw3iJlXaxHE37HbhwKhETVQ0z6TWvNypnT19oIfl5CnHokQ45ezdp
   M=;
X-IronPort-RemoteIP: 104.47.59.168
X-IronPort-MID: 74257063
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:WdLx3aLHG/rYz7/FFE+RzZQlxSXFcZb7ZxGr2PjKsXjdYENSgzxWy
 mIWWzyOP/6LNmP0ed51Pty/p0kB78fTzYVgHlNlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA14+IMsdoUg7wbRh3NQy2YTR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 PwKuYDtaiF5B4nBg8Zedkh7TTx3AKITrdcrIVDn2SCS52vvViK2htlLUgQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHMGFGvuajTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SWlLmIA9gn9SawfwVKJlBJA07rXaoTRUPnUa+9yu0GEq
 TeTl4j+KlRAXDCF8hKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTifuzh1O6WtlfA
 1cJ4Sdopq83nGSpU938UhuQsHOC+BkGVLJ4CPYm4QuAzq7V5QexBWUeSDNFLts8u6ceWjgCx
 lKP2dTzClRSXKa9THuc8vKYqG20MC1Md2saP3ZaHU0C/sXpp5w1glTXVNF/HaWpj9rzXzbt3
 zSNqyt4jLIW5SIW65iGEZn8q2rEjvD0osQdvG07gkrNAttFWbOY
IronPort-HdrOrdr: A9a23:i9xhhai31kgLKkVuNGyk0eserXBQX0h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK/yXcT2/hqAV7CZnichILMFu1fBOTZslnd8kHFltK1kJ
 0QCpSWa+eAcmSS8/yKhzVQeuxIqLfnzEnrv5an854Ed3AXV0gK1XYdNu/0KDwUeOEQbqBJaa
 Z0q/A37gaISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGA9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9AwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgvf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosfD30E1wsa7VcKM0lt
 gsAp4Y6o2mcfVmHZ6VfN1xJ/dfKla9Ni4kY1jiV2gOKsk8SgHwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.92,215,1650945600"; 
   d="scan'208";a="74257063"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bSeHdKlGl6KeIQqP5EybgsYP1KcCpx9XAxf+5iVFGT9/EDvrLdj/xEzwDY6W47BFOexPLqw//06ReXRkP2/B1oCwutzRRCAoU3QB/CbF6RCdCFMLS5SLpYONJvU4gXPYJekClFzkhnIRBxTNKnCaql/LkkH00CMJw3j39vcXLAseL4npD1kevBsegE3WPqVSAb7KRNXXr9ZO04JpMjyMqPm4mO8DUB5G09w0KuLS6lTqrdK9kpze+TYJOCVME8QPillSQOzPfB33Pp0Ps2RCWasPfyexLG4NCmF/gXulNloQFT6kHVKfwFhDGfxhv6flPdimupXonCUx3vRaGHXOlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mV+GSA3oDieHR/bXqJJFOlJFFYmGghYFGMWvwZGx7cE=;
 b=oIs9ZGWLbsDTb946MHt44xHElFjiUkn4dz55fAvTmwNwQyubEDLZZxzuHzB2vcS40N87XZKhsOZFSBlSQmapMzI39qMWStgRLv/BOwI0lVG301QV00KUdKJrR8NhDafe+AtswBcV4qukDbKVy0PwMeejIbDh8niaxLn4groLdSllKHbwNSHZWuNbgfhCKoeMOXPNmWfWxEkdtMjffJD5qg6ZtVRrLrVQaSH1WqR4+QN7DaAbYzQPMUe8dwFWOAH6HmzxRqVvavtGrOExTA0AnbTZW899Pu05ZXoJHTI5+dt7uyInYPSJolqJyTcfNGvGFe7RahcGxQ8seU4u0eHNWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mV+GSA3oDieHR/bXqJJFOlJFFYmGghYFGMWvwZGx7cE=;
 b=NihpBs3xlP6GPZHWiQsL897C4nYXY1nAqLnIfFpzTRk/4B/j7CfrSfyDh5yuWhVJQlowHOgFHDj10nBXwf4wRSDptJtvNBLUf/uNhsB9FiiCx2lC1GvfhphPqWAgoQe4+e+6YdnPKcY0mdIPp3avRVCxWADnrHl5R9c4xM3Stn0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/6] x86/x2apic: use physical destination mode by default
Date: Thu, 23 Jun 2022 10:24:24 +0200
Message-Id: <20220623082428.28038-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623082428.28038-1-roger.pau@citrix.com>
References: <20220623082428.28038-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0283.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::31) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d4a3772-7508-45f7-1cea-08da54f1e65e
X-MS-TrafficTypeDiagnostic: MN2PR03MB5008:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR03MB5008CC3A039202AB3A7A2C618FB59@MN2PR03MB5008.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	D2Y5WEx4/BFdvmZ295YheBUcUCdEYvWGrO7/Hvqak120tE7Osu+LH1D3HihQhcLSIOsu/H4ENrAAym85zzHydjMKlcE3H5D9ZB24gse2CJxNgBNiVWjukyh/+mmpoU+fMOxIWzKPFW3UHWS4SY/q9gwmLUd6CAwe7eut8JTVug3MJ2VxxYnnxdbJ4xkW3HfrRNbvs77bVOKzEbG7cCYqSPX/RLSPx0Em/g0XoReWRjfg3kUASf93wnPhfQo+2M+x77v6ZPzyBFrQ2z2nU/stsdO6aanYv0+GbBBdaiOmhOjMyGlYsgCygDabO+4ae6TeV9gdCHayRefxJzYTTomBKhRmS2jzz1Kpbjuqwp3Mf4ULOU42CvKYCXOqxUva41n2dDzLt0NIOVVv0QsFhyoIzn8IlEIhouWBD4Hi/0gisV3N86KH177A9k/fFRk0g+KRBILk7rNYC0YW0HRP88ZvJBTNVRSFn0rXHA40XUmF3DvvEh6ahYOEIfxFxhWj8agOWOPS5bwsIEl7++BqOas3LybQjCGGPJA4Xx45hXMdXuqiWtcBrWXOGATCoPvQMJrfHyZQUA3Du/27EKaAbUS2A5sKWxCgeM/5Xt14mURaTO3ACVJPyD1UP2SWNYAoUbO8wau5+qZ2epT7bmaLrT2BmAkCsp7FLwqy70UMMvVhLc8axK9M2o3bosXOYBxCJJKuLKbGHUBm9Qf7gWzldSJUPw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(82960400001)(6916009)(2906002)(6486002)(38100700002)(5660300002)(316002)(86362001)(8936002)(6512007)(66556008)(8676002)(36756003)(54906003)(2616005)(4326008)(66946007)(6506007)(83380400001)(1076003)(26005)(41300700001)(478600001)(66476007)(186003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?alE4T00wREFnZDcxZ01qWHkxZUZ0c0FFNlRoeHRnS1VNUXJZQzhxWGU0NExr?=
 =?utf-8?B?Ukx2b0h0Y21Jd2libmpJSit4OFVVdkN3bDJad3pkckllYWtFdmpuWTdabFJh?=
 =?utf-8?B?THl5Tm5FTU10Sks2NTg4V1hLRFVsNm5GODlmQnpXdlNsUWs3M0JHcEZ4Y1ZO?=
 =?utf-8?B?b3p2Qjk5b1IweEw0VWlyaTJwMFlMbTBwbm8vUkVhVUtybHgwOFMzb0tzdDB1?=
 =?utf-8?B?MTlrSWtUOHF0UjQ5aldQRUlNYXpLdHBiVThwSzZadENDeDFmN0hJYVQzdkcr?=
 =?utf-8?B?TmtaQlZ3WWkzalU1bHBWNkFwWm9ZSkVnMzJmcnpIVmVmOEZycW44RExQNmpw?=
 =?utf-8?B?aVEraFFCL0J4SjA1WWtrRkczYUhIRUMxUktSM1VwVUZtWjlPVmQ1RlozNGZR?=
 =?utf-8?B?Uy9NQll4WHdxYmNyKzBDcWFJWGxjMU9PTUM2YnQyRmhrNlJmTTYzSEpCbGtD?=
 =?utf-8?B?aHJzTFAwWGQvbHVQc3hGY0xOeWVLU01ZODF0eGxGSUtHdG4zdVo3TzBiYndF?=
 =?utf-8?B?UVVYZDcvZGVyZTJXNzdrRFB3aW1XZHA4QkFpeUlVeEcyMXlJT3V0ekRtVjRt?=
 =?utf-8?B?NlpWNUFJZGJJanNIcUc3SVJIZkZNdEo2bjY2VEpCNVVPRk1PQkQ0ODhQcUg0?=
 =?utf-8?B?ZG1OTXZNajZhNi9MN1BydGxXS3BxN05iZFpEUkp3VFJQUit6Y0YyU3F6bnZ1?=
 =?utf-8?B?ZmRkQW51MXl1MHRvdVAxWG1KVDlUZkNXUEFpd0MvTVNCalI3WVJYM2dXUnNR?=
 =?utf-8?B?TEt2TlRYbm5FTzZ4VXUrcndDdHVIUEQ0aUFmUWxaY0xqVzViWkZ4a2Z5Qk1l?=
 =?utf-8?B?WFdGN09zYlpPRk03NmdubFVra3RIQ3p0cmhXbnFyKzhldWdkdUNhS1duaVNt?=
 =?utf-8?B?b3lobTlXZVc4Q0hZaUd5THdvWWhnNUlRSEc0dmhTbnB1d1JJR0pFRkdkc2ht?=
 =?utf-8?B?NnV6YitrWjhwUHEvclNtKzFLZnBEbElZNzhCUUFvdnE1MnZiQk8rTjRKbXNV?=
 =?utf-8?B?UDhHcGtCWWhGZElKNzhmbUNGSU1zblc1RXNhUUt2T1dHSlBiQ3NtVDNFc0ox?=
 =?utf-8?B?YWhwbXl4UUN4cHdWM3ZzdlNTSTE5THZuZzZmM1lFTWdpYzJSTjJ3MWJ4amQz?=
 =?utf-8?B?Y3FUbFNyY1RHRWttc21jOTFLM1M5a3RNKy9JNmF1S1lWNW40SjFDSWhjMUxF?=
 =?utf-8?B?bmxhbDU3TVFKcjRVL1RhVW9YWHRkeHdOVThhQ3NGQXFiQ3FScmgrMGx0N3py?=
 =?utf-8?B?K2RjR29QcWVZSm84UExTSzI5NkdkQmx1cXRkMFdmODVFOWdxMzNEampwclRv?=
 =?utf-8?B?WCtQbzhWN3U5VnpGK3Z5VUJJdmlkTkU2ZFlHTDVCK1R1RUY2bkl5c2o4cFp4?=
 =?utf-8?B?UkQ0MWRZSElWU1V2MnFSbWZySlJSTDBUNzNaMkFlL01tV1BIekY4YkdBSGw1?=
 =?utf-8?B?cHM2bnk0WWMvT29DN1hURFdaMDQwei93Q2FmdGhSWk1wRUtOOTFqd1NzUDF6?=
 =?utf-8?B?UlBTeGp6VGJETW5nenR4bHdCRDN2VFdPbnU2bzJsZ0dhcDRLdjJ4N1JaTkkx?=
 =?utf-8?B?M1hIWUUyS0JNN01qYXd0Z0ZuWHB6YnVsdUNhZUZkZjlneXNXZzR4S3Y5Kzha?=
 =?utf-8?B?RlJ0SHFGaEFXa2k4WTRDOXU1Tjl5azhGeE80U0pMZ2ZqQlRRUVZaQUtEb0Fo?=
 =?utf-8?B?aThXcjhFZWtUcmZPOTNqaW5kcnlyWWRVMllKM2w0TlNTbVpieC9mNU5tRDIy?=
 =?utf-8?B?YXNDdSs0RHhPYS9mSkZpeXB6VVhHNUVNaFRkbG0xU296ZlhNUyszakN6NXlu?=
 =?utf-8?B?RnBsK2lsSllDOTlQY0ExVzl1aVhicUZERWtTaTZ5VTllSnhqc0p4Z3orZTNO?=
 =?utf-8?B?UUlsTHkraVFtYVd0ZW8zSzVGamcrclNrdmYzWGxIbVppZ2xtVFFVZlJITUhS?=
 =?utf-8?B?cll3YVExdmp5Um9lNHN3bmRyTTkrY2lxUm1tK2dsV1J1L0pTMzJXZDFUL2pm?=
 =?utf-8?B?TTQ2U1FsOXJSTS9uK09kTlZsZVNhaTgycWZDZThLVm9Qd0V6SXBEZXVCd2Y3?=
 =?utf-8?B?ZGJWV2Rvb1M5NXpWWHhWT0lTTkFPSDZOTHprbXNGdE5DQm1xZWFuTVVTNUo5?=
 =?utf-8?Q?CVnoDouMAYB+0D6xpUlqkIGtw?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d4a3772-7508-45f7-1cea-08da54f1e65e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 08:25:15.7000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3chuX1jtqy/+Slkd4t9ZsZH9lM/5hdZcU7jPdw2Nnmhm2J69Ap1wqzgCnKcTCn8yzFOhhO5oKoINSOFimmwFLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5008

Using cluster mode by default greatly limits the amount of vectors
available, as then vector space is shared amongst all the CPUs in the
logical cluster.

This can lead to vector shortage issues on boxes with not a huge
amount of CPUs but with a non-trivial amount of devices, there are
reports of boxes with 32 CPUs (2 logical clusters, and thus only 414
dynamic vectors) that run out of vectors and fail to setup interrupts
for dom0.

This could be considered as a regression when switching from xAPIC
mode, as when using xAPIC only physical mode is supported.

Switch default Kconfig selection to use x2APIC physical mode.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 docs/misc/xen-command-line.pandoc | 5 ++---
 xen/arch/x86/Kconfig              | 4 ++--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index a92b7d228c..952874c4f4 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2646,11 +2646,10 @@ Permit use of x2apic setup for SMP environments.
 ### x2apic_phys (x86)
 > `= <boolean>`
 
-> Default: `true` if **FADT** mandates physical mode or if interrupt remapping
->          is not available, `false` otherwise.
+> Default: `false` if **FADT** mandates cluster mode, `true` otherwise.
 
 In the case that x2apic is in use, this option switches between physical and
-clustered mode.  The default, given no hint from the **FADT**, is cluster
+clustered mode.  The default, given no hint from the **FADT**, is physical
 mode.
 
 ### xenheap_megabytes (arm32)
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index f560dc13f4..74bfb37db4 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -228,11 +228,11 @@ endchoice
 
 choice
 	prompt "x2APIC default destination mode"
-	default X2APIC_LOGICAL
+	default X2APIC_PHYS
 	---help---
 	  Specify default destination mode for x2APIC.
 
-	  If unsure, choose "Logical".
+	  If unsure, choose "Physical".
 
 config X2APIC_LOGICAL
 	bool "Logical mode"
-- 
2.36.1


